local Util = require("tufte.utils")

local M = {}

---@class tufte.PaletteDiff
---@field add string -- line-level add background
---@field delete string -- line-level delete background
---@field add_char string -- char-level add emphasis
---@field delete_char string -- char-level delete emphasis

---@class tufte.Palette
---@field bg string
---@field bg2 string
---@field fg string
---@field tiers string[] -- 10 entries, T1 faintest (near bg) -> T10 (near fg)
---@field accent string  -- vermillion, used sparingly
---@field highlight string -- yellow highlight
---@field highlight_fg string -- yellow highlight
---@field diff tufte.PaletteDiff -- standard diff add/remove colors
---@field terminal tufte.TerminalColors -- ANSI palette for `:terminal` buffers

---@class tufte.TerminalColors
---@field black string
---@field black_bright string
---@field red string
---@field red_bright string
---@field green string
---@field green_bright string
---@field yellow string
---@field yellow_bright string
---@field blue string
---@field blue_bright string
---@field magenta string
---@field magenta_bright string
---@field cyan string
---@field cyan_bright string
---@field white string
---@field white_bright string

---@class tufte.ColorScheme : tufte.Palette
---@field muted string -- comments, secondary/faint text
---@field dark_bg string -- popups, statusline, sidebars
---@field darker_bg string -- cursorline, colorcolumn, reference highlights
---@field lighter_bg string -- faintest chrome: gutter, line numbers
---@field dark_fg string -- least emphasized readable text
---@field light_fg string -- lightly emphasized text
---@field bright_fg string -- strongly emphasized text (just under foreground)
---@field diff { add: string, delete: string, add_char: string, delete_char: string, change: string, text: string }
---@field error string
---@field warning string
---@field info string
---@field hint string

---@param variant string
---@return tufte.Palette
local function load_palette(variant)
	local ok, palette = pcall(require, "tufte.palettes." .. variant)
	if not ok or type(palette) ~= "table" then
		vim.notify(
			("tufte.nvim: unknown variant %q, falling back to 'coffee'"):format(tostring(variant)),
			vim.log.levels.WARN
		)
		palette = require("tufte.palettes.coffee")
	end
	return palette
end

--- Build the flat color table the highlight groups consume.
--- Every UI/syntax role maps onto a luminance step of the bg -> fg ramp;
--- only errors/deletions get the vermillion accent, only search/selection/
--- todo get the yellow highlight. `tiers` holds 10 steps (T1 faintest, near
--- `bg`, -> T10 darkest, near `fg`); the fields below each pin one step.
---@param p tufte.Palette
---@return tufte.ColorScheme
local function build_colorscheme(p)
	local t = p.tiers

	local colorscheme = vim.tbl_extend(
		"force",
		p,
		--- @type tufte.ColorScheme
		{
			lighter_bg = p.bg2, -- faintest chrome: gutter, line numbers
			dark_bg = t[2],
			darker_bg = t[3],

			muted = t[5], -- comments, faint secondary text
			dark_fg = t[6], -- least emphasized readable text
			light_fg = t[8], -- lightly emphasized text
			bright_fg = t[10], -- strongly emphasized text

			accent = p.accent,
			highlight = p.highlight,
		}
	)
	return colorscheme
end

---@param opts? tufte.Config
function M.setup(opts)
	opts = require("tufte.config").extend(opts)

	local palette = load_palette(opts.variant or "coffee")

	---@class tufte.ColorScheme
	local colors = build_colorscheme(palette)

	if opts.colors and next(opts.colors) then
		colors = vim.tbl_deep_extend("force", colors, opts.colors)
	end

	Util.bg = colors.bg
	Util.fg = colors.fg


	-- Diff add/remove convention: every diff-add/diff-remove highlight group
	-- across the colorscheme (native Diff*/diff*, gitsigns, codediff.nvim,
	-- vim-fugitive via stock diff.vim and its terminal patch prompts)
	-- resolves to these four standard colors, declared per-palette (see
	-- palettes/*.lua). `add`/`delete` are the line-level background;
	-- `add_char`/`delete_char` are a more saturated version of the same hue
	-- for intra-line (char-level) emphasis on top of that background.
	local diff_text = Util.blend(colors.fg, 0.09, colors.bg)
	colors.diff = {
		add = palette.diff.add,
		delete = palette.diff.delete,
		add_char = palette.diff.add_char,
		delete_char = palette.diff.delete_char,
		change = Util.blend_bg(diff_text, 0.15, colors.bg),
		text = diff_text,
	}

	colors.error = colors.accent -- vermillion
	colors.warning = colors.fg
	colors.info = colors.light_fg
	colors.hint = colors.dark_fg

	-- Terminal colors come from the palette itself (see palettes/*.lua), so
	-- each variant declares its own ANSI palette — the same convention as
	-- `diff`. Flows through via the palette extend above.
	opts.on_colors(colors)

	return colors, opts
end

return M
