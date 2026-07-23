-- Git plugin support for tufte colorscheme
local Util = require("tufte.utils")

local M = {}

-- `:Git add|checkout|commit|reset|restore|stage|stash -p/--patch` (and
-- `-i/--interactive`) run through a real Neovim :terminal (termopen), not
-- Vim syntax highlighting — see the diff-add/remove comment in
-- groups/base.lua. Git's own diff output there is plain ANSI foreground
-- color only (no background), so the line-level wash from our diff
-- convention (colors.diff, DiffAdd/DiffDelete) doesn't apply on its own.
-- We recreate it by layering a bg-only extmark over the terminal buffer's
-- `+`/`-` lines, same technique codediff.nvim's own line-level wash uses
-- (bg-only highlight at an elevated priority so the terminal's ANSI
-- foreground color for that cell is preserved underneath).
local patch_ns = vim.api.nvim_create_namespace("tufte_fugitive_patch_diff")

-- Neovim's terminal buffer name/b:term_title only records the resolved
-- executable (e.g. "/usr/bin/git"), not the argv fugitive passed to
-- termopen() — so "was this `-p`/`--patch`?" isn't recoverable from the
-- buffer at all. Gate on `b:git_dir` instead: FugitiveDetect() sets it on
-- every terminal fugitive spawns (patch prompts, pagers, interactive
-- rebase, ...), and all of those render unified-diff `+`/`-` lines worth
-- washing the same way. It's set by a command chained *after* termopen()
-- in the same `:execute`, so it isn't there yet when TermOpen fires
-- synchronously — check it from a scheduled callback instead.
local function is_fugitive_term(bufnr)
	return vim.bo[bufnr].buftype == "terminal" and vim.b[bufnr].git_dir ~= nil
end

---@param line string
---@return string?
local function classify(line)
	if line:sub(1, 4) == "+++ " or line:sub(1, 4) == "--- " then
		return nil
	end
	local first = line:sub(1, 1)
	if first == "+" then
		return "DiffAdd"
	elseif first == "-" then
		return "DiffDelete"
	end
	return nil
end

---@param bufnr integer
---@param firstline integer
---@param lastline integer -1 means end of buffer
local function highlight_range(bufnr, firstline, lastline)
	if not vim.api.nvim_buf_is_valid(bufnr) then
		return
	end
	vim.api.nvim_buf_clear_namespace(bufnr, patch_ns, firstline, lastline)
	local lines = vim.api.nvim_buf_get_lines(bufnr, firstline, lastline, false)
	for i, line in ipairs(lines) do
		local hl = classify(line)
		if hl then
			local row = firstline + i - 1
			vim.api.nvim_buf_set_extmark(bufnr, patch_ns, row, 0, {
				end_row = row + 1,
				hl_group = hl,
				hl_eol = true,
				priority = 200,
			})
		end
	end
end

local function setup_patch_term_diff()
	local group = vim.api.nvim_create_augroup("TufteFugitivePatchDiff", { clear = true })
	vim.api.nvim_create_autocmd("TermOpen", {
		group = group,
		callback = function(args)
			local bufnr = args.buf
			vim.schedule(function()
				if not vim.api.nvim_buf_is_valid(bufnr) or not is_fugitive_term(bufnr) then
					return
				end
				highlight_range(bufnr, 0, -1)
				vim.api.nvim_buf_attach(bufnr, false, {
					on_lines = function(_, buf, _, firstline, _, new_lastline)
						vim.schedule(function()
							highlight_range(buf, firstline, new_lastline)
						end)
					end,
				})
			end)
		end,
	})
end

---@param c ColorScheme
---@param opts tufte.Config
---@return tufte.Highlights
function M.get(c, opts)
	setup_patch_term_diff()

  -- stylua: ignore
  return {
    gitcommitOverflow         = { fg = c.red },
    gitcommitSummary          = { fg = c.green },
    gitcommitComment          = { fg = c.comment, style = opts.styles.comments },
    gitcommitUntracked        = { fg = c.comment },
    gitcommitDiscarded        = { fg = c.comment },
    gitcommitSelected         = { fg = c.comment },
    gitcommitHeader           = { fg = c.purple },
    gitcommitSelectedType     = { fg = c.blue },
    gitcommitUnmergedType     = { fg = c.blue },
    gitcommitDiscardedType    = { fg = c.blue },
    gitcommitBranch           = { fg = c.orange, bold = true },
    gitcommitUntrackedFile    = { fg = c.yellow },
    gitcommitUnmergedFile     = { fg = c.red, bold = true },
    gitcommitDiscardedFile    = { fg = c.red, bold = true },
    gitcommitSelectedFile     = { fg = c.green, bold = true },
  }
end

return M
