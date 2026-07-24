-- codediff.nvim support for tufte colorscheme
local Util = require("tufte.utils")

local M = {}

---@param c ColorScheme
---@return tufte.Highlights
function M.get(c)
	-- Diff add/remove convention lives in colors/init.lua (colors.diff); this
	-- module is just one of its consumers.
	local line_insert = c.diff.add
	local line_delete = c.diff.delete
	local char_insert = c.diff.add_char
	local char_delete = c.diff.delete_char

	-- codediff.nvim re-derives CodeDiffLine/CharInsert/Delete from its own
	-- `highlights` config (default: read off DiffAdd/DiffDelete) every time its
	-- setup() runs or `ColorScheme` fires, without a `default = true` guard —
	-- so it clobbers plain nvim_set_hl() calls made for those groups here.
	-- Push our colors through its own config instead, so it always resolves to
	-- what we want regardless of load order, then force an immediate re-derive.
	local ok_config, cd_config = pcall(require, "codediff.config")
	if ok_config then
		cd_config.options.highlights.line_insert = line_insert
		cd_config.options.highlights.line_delete = line_delete
		cd_config.options.highlights.char_insert = char_insert
		cd_config.options.highlights.char_delete = char_delete

		-- Treesitter captures (e.g. @markup.raw.markdown_inline) sit at priority
		-- 100 too, and can render on top of codediff's extmarks depending on
		-- application order. Push codediff above them so diff highlights always
		-- win.
		cd_config.options.diff.highlight_priority = 200

		local ok_hl, cd_highlights = pcall(require, "codediff.ui.highlights")
		if ok_hl then
			cd_highlights.setup()
		end
	end

  -- stylua: ignore
  return {
    -- Line-level add/remove (same wash used by DiffAdd/DiffDelete)
    CodeDiffLineInsert          = { bg = line_insert },
    CodeDiffLineDelete          = { bg = line_delete },

    -- Char-level add/remove: same hue, stronger blend so the intra-line
    -- change reads clearly against the line-level wash
    CodeDiffCharInsert          = { bg = char_insert },
    CodeDiffCharDelete          = { bg = char_delete },

    -- Moved blocks stay on the same neutral tier, distinct from add/remove
    CodeDiffLineMove            = { bg = c.diff.change },
    CodeDiffCharMove            = { bg = Util.blend_bg(c.diff.text, 0.35) },
    CodeDiffMoveFrom            = { fg = c.foreground },
    CodeDiffMoveTo              = { fg = c.foreground },

    CodeDiffFiller              = { fg = c.muted },

    -- Explorer / status panel
    CodeDiffStatusAdded         = { fg = c.bright_foreground },
    CodeDiffStatusModified      = { fg = c.light_foreground },
    CodeDiffStatusDeleted       = { fg = c.accent },
    CodeDiffStatusRenamed       = { fg = c.info },
    CodeDiffStatusUntracked     = { fg = c.info },
    CodeDiffStatusConflict      = { fg = c.error },
    CodeDiffExplorerSelected    = { link = "Visual" },
    CodeDiffExplorerTreeGroup   = { link = "Directory" },
    ExplorerDirectorySmall      = { link = "Comment" },
    NeoTreeIndentMarker         = { link = "Comment" },

    -- Merge conflict signs
    CodeDiffConflictSign         = { fg = c.warning },
    CodeDiffConflictSignResolved = { link = "Comment" },
    CodeDiffConflictSignAccepted = { fg = c.bright_foreground },
    CodeDiffConflictSignRejected = { fg = c.accent },

    CodeDiffHistoryTitle        = { link = "FloatTitle" },
  }
end

return M
