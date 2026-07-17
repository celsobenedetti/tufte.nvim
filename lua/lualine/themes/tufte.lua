-- Lualine theme for tufte colorscheme
--
-- Each mode uses a distinct luminance tier for the "a" pill so they
-- are immediately distinguishable in a monochrome palette:
--   NORMAL  T7  — darkest, grounded
--   COMMAND T6  — near-black, authoritative
--   REPLACE T5  — dark, heavy feel
--   INSERT  T3  — medium, lighter/open
--   VISUAL  T2  — softest active mode
--
-- Tiers follow the active variant (coffee / tufte).
-- Sections gradient: a (dark pill) → b (light) → c (paper)

local colors = require("tufte.colorscheme")

local M = {}

M.normal = {
	a = { bg = colors.fg, fg = colors.bg, gui = "bold" },
	b = { bg = colors.bg_highlight, fg = colors.fg_dark },
	c = { bg = colors.bg_dark, fg = colors.blue5 },
}

M.insert = {
	a = { bg = colors.blue5, fg = colors.bg, gui = "bold" },
	b = { bg = colors.bg_highlight, fg = colors.blue5 },
	c = { bg = colors.bg_dark, fg = colors.blue5 },
}

M.command = {
	a = { bg = colors.fg_dark, fg = colors.bg, gui = "bold" },
	b = { bg = colors.bg_highlight, fg = colors.fg_dark },
	c = { bg = colors.bg_dark, fg = colors.blue5 },
}

M.visual = {
	a = { bg = colors.comment, fg = colors.bg, gui = "bold" },
	b = { bg = colors.bg_highlight, fg = colors.comment },
	c = { bg = colors.bg_dark, fg = colors.blue5 },
}

M.replace = {
	a = { bg = colors.magenta, fg = colors.bg, gui = "bold" },
	b = { bg = colors.bg_highlight, fg = colors.magenta },
	c = { bg = colors.bg_dark, fg = colors.blue5 },
}

M.terminal = {
	a = { bg = colors.green, fg = colors.bg, gui = "bold" },
	b = { bg = colors.bg_highlight, fg = colors.green },
	c = { bg = colors.bg_dark, fg = colors.blue5 },
}

M.inactive = {
	a = { bg = colors.bg_highlight, fg = colors.dark3 },
	b = { bg = colors.bg_dark, fg = colors.dark3 },
	c = { bg = colors.bg_dark, fg = colors.fg_gutter },
}

return M
