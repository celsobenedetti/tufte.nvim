local Util = require("tufte.utils")

local M = {}

---@class tufte.PaletteDiff
---@field add string -- line-level add background
---@field delete string -- line-level delete background
---@field add_char string -- char-level add emphasis
---@field delete_char string -- char-level delete emphasis

---@class tufte.Palette
---@field bg string
---@field tiers string[] -- 7 entries, T1 faint chrome -> T7 focus
---@field accent string  -- vermillion, used sparingly
---@field highlight string -- yellow highlight
---@field secondary string -- Special, function calls
---@field diff tufte.PaletteDiff -- standard diff add/remove colors

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
--- Every syntax name maps onto a luminance tier; only errors/deletions get the
--- vermillion accent, only search/selection/todo get the yellow highlight.
---@param p tufte.Palette
local function build_palette(p)
	local t = p.tiers
	local bg = p.bg

	return {
		bg = bg,
		bg_dark = Util.blend(t[7], 0.03, bg),
		bg_dark1 = Util.blend(t[7], 0.03, bg),
		bg_highlight = Util.blend(t[7], 0.07, bg),

		-- Luminance tiers mapped onto the syntax names the groups already use.
		blue = t[6], -- statements, directories, titles
		blue0 = p.highlight, -- selection / search background (yellow)
		blue1 = t[5], -- borders, pmenu match
		blue2 = t[4], -- info diagnostic
		blue5 = t[3], -- operators, punctuation delimiters
		blue6 = t[4], -- string.regexp
		blue7 = Util.blend(t[7], 0.09, bg), -- diff change bg (light)

		comment = t[2],
		cyan = p.secondary, -- preprocessor, macros, special

		dark3 = Util.blend(t[2], 0.45, t[1]), -- nontext, ignored
		dark5 = Util.blend(t[2], 0.7, t[1]), -- concealed text

		fg = t[7],
		fg_dark = t[6],
		fg_lightgray = t[3],
		fg_gutter = t[1],

		green = t[4], -- strings, characters
		green1 = t[5], -- properties, variable.member
		green2 = t[5], -- git add

		magenta = t[5], -- constructors
		magenta2 = t[5], -- variables, identifiers

		orange = t[4], -- numbers, booleans
		purple = t[7], -- keywords, constants, conditionals

		red = t[6], -- tags (a tier, NOT the accent)
		red1 = p.accent, -- error, git delete -> vermillion (rare)

		teal = t[3], -- hints, markup links
		terminal_black = t[1],

		yellow = t[6], -- types, labels, parameters, warnings

		git = {},

		special_char = t[5],

		accent = p.accent,
		highlight = p.highlight,
		secondary = p.secondary,
	}
end

---@param opts? tufte.Config
function M.setup(opts)
	opts = require("tufte.config").extend(opts)

	local palette = load_palette(opts.variant or "coffee")

	---@class ColorScheme
	local colors = build_palette(palette)

	if opts.colors and next(opts.colors) then
		colors = vim.tbl_deep_extend("force", colors, opts.colors)
	end

	Util.bg = colors.bg
	Util.fg = colors.fg

	colors.none = "NONE"

	-- Git colors derived from the palette. Deletion uses the vermillion accent.
	colors.git.add = colors.green2
	colors.git.delete = colors.red1
	colors.git.change = colors.orange

	-- Diff add/remove convention: every diff-add/diff-remove highlight group
	-- across the colorscheme (native Diff*/diff*, gitsigns, codediff.nvim,
	-- vim-fugitive via stock diff.vim and its terminal patch prompts)
	-- resolves to these four standard colors, declared per-palette (see
	-- palettes/*.lua). `add`/`delete` are the line-level background;
	-- `add_char`/`delete_char` are a more saturated version of the same hue
	-- for intra-line (char-level) emphasis on top of that background.
	colors.diff = {
		add = palette.diff.add,
		delete = palette.diff.delete,
		add_char = palette.diff.add_char,
		delete_char = palette.diff.delete_char,
		change = Util.blend_bg(colors.blue7, 0.15),
		text = colors.blue7,
	}

	colors.git.ignore = colors.dark3
	colors.black = Util.blend_bg(colors.bg, 0.8, colors.bg)
	colors.border_highlight = Util.blend_bg(colors.blue1, 0.8)
	colors.border = Util.blend_bg(colors.fg, 0.15)

	-- Popups and statusline get a subtle background
	colors.bg_popup = colors.bg_dark
	colors.bg_statusline = colors.bg_dark

	colors.bg_sidebar = opts.styles.sidebars == "transparent" and colors.none
		or opts.styles.sidebars == "dark" and colors.bg_dark
		or colors.bg

	colors.bg_float = opts.styles.floats == "transparent" and colors.none
		or opts.styles.floats == "dark" and colors.bg_dark
		or colors.bg

	colors.bg_visual = Util.blend_bg(colors.blue0, 0.4) -- soft yellow selection
	colors.bg_search = colors.blue0 -- yellow search
	colors.fg_sidebar = colors.fg
	colors.fg_float = colors.fg

	colors.error = colors.red1 -- vermillion
	colors.todo = colors.blue
	colors.warning = colors.yellow
	colors.info = colors.blue2
	colors.hint = colors.teal

	-- Subtle blended backgrounds
	colors.subtle_bg = Util.blend_bg(colors.fg, 0.06)
	colors.cursorline_bg = colors.fg_gutter -- T1 faint chrome (coffee: #d1cdc4)
	colors.selection_bg = Util.blend_bg(colors.fg, 0.12)
	colors.float_bg = Util.blend_bg(colors.fg, 0.04)

	colors.rainbow = {
		colors.blue,
		colors.yellow,
		colors.green,
		colors.teal,
		colors.magenta,
		colors.purple,
		colors.orange,
		colors.red,
	}

	-- Terminal colors for `:terminal` buffers (incl. vim-fugitive's `-p`
	-- patch prompts, which run through a real terminal, not Vim syntax
	-- highlighting — see groups/base.lua's diff comment).
	--
	-- These are real, distinguishable hues, NOT the editor's syntax tiers.
	-- The syntax palette intentionally desaturates "green"/"cyan"/etc. into
	-- grayscale luminance tiers (only errors/deletions get real color, per
	-- build_palette above) — that's fine for Vim highlighting, but ANSI
	-- programs (git diff, ls --color, test runners, docker) rely on color
	-- 2 actually looking green, 3 actually looking yellow, etc. Reusing the
	-- grayscale tiers there made e.g. `git add -p` additions render as
	-- indistinguishable-from-plain-text gray. Fixed hex, not palette-derived,
	-- for the same reason as colors.diff: both variants share the same `bg`.
	-- Contrast-checked (WCAG) against bg #fffcf0, all >= 4.5:1.
	colors.terminal = {
		black = colors.bg,
		black_bright = colors.terminal_black,
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
