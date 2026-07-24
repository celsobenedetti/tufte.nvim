local Util = require("tufte.utils")

local M = {}

---@class tufte.PaletteDiff
---@field add string -- line-level add background
---@field delete string -- line-level delete background
---@field add_char string -- char-level add emphasis
---@field delete_char string -- char-level delete emphasis

---@class tufte.Palette
---@field bg string
---@field fg string
---@field tiers string[] -- 10 entries, T1 faintest (near bg) -> T10 (near fg)
---@field accent string  -- vermillion, used sparingly
---@field highlight string -- yellow highlight
---@field diff tufte.PaletteDiff -- standard diff add/remove colors

---@class tufte.ColorScheme : tufte.Palette
---@field selection string -- soft yellow selection/visual background
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
---@field terminal { black: string, black_bright: string, red: string, red_bright: string, yellow: string, yellow_bright: string, blue: string, blue_bright: string, magenta: string, magenta_bright: string, cyan: string, cyan_bright: string, white: string, white_bright: string }

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
			lighter_bg = t[1], -- faintest chrome: gutter, line numbers
			darker_bg = t[2],
			dark_bg = t[3],

			muted = t[4], -- comments, faint secondary text
			dark_fg = t[5], -- least emphasized readable text
			light_fg = t[7], -- lightly emphasized text
			bright_fg = t[9], -- strongly emphasized text

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

	colors.selection = Util.blend_bg(colors.highlight, 0.4, colors.bg) -- soft yellow selection

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

	-- Terminal colors for `:terminal` buffers (incl. vim-fugitive's `-p`
	-- patch prompts, which run through a real terminal, not Vim syntax
	-- highlighting — see groups/base.lua's diff comment).
	--
	-- These are real, distinguishable hues, NOT the editor's grayscale ramp.
	-- The syntax palette intentionally desaturates everything into
	-- luminance steps (only errors/highlight get real color) — that's fine
	-- for Vim highlighting, but ANSI programs (git diff, ls --color, test
	-- runners, docker) rely on color 2 actually looking green, 3 actually
	-- looking yellow, etc. Fixed hex, not palette-derived, for the same
	-- reason as colors.diff: both variants share the same background.
	-- Contrast-checked (WCAG) against bg #fffcf0, all >= 4.5:1.
	colors.terminal = {
		black = colors.bg,
		black_bright = colors.lighter_bg,
		red = colors.accent,
		red_bright = colors.accent,
		green = "#2f6f2f",
		green_bright = "#2f6f2f",
		yellow = "#8a6d1a",
		yellow_bright = "#8a6d1a",
		blue = "#345d8a",
		blue_bright = "#345d8a",
		magenta = "#8a3d6e",
		magenta_bright = "#8a3d6e",
		cyan = "#1f7a6c",
		cyan_bright = "#1f7a6c",
		white = colors.fg,
		white_bright = colors.fg,
	}

	opts.on_colors(colors)

	return colors, opts
end

return M
