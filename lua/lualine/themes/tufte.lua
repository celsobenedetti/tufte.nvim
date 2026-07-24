-- Lualine theme for tufte colorscheme
--
-- Each mode uses a distinct step of the grayscale ramp for the "a" pill so
-- they are immediately distinguishable in a monochrome palette:
--   NORMAL  foreground        — darkest, grounded
--   COMMAND bright_foreground — near-black, authoritative
--   REPLACE light_foreground  — medium, heavy feel
--   INSERT  dark_foreground   — medium-light, open
--   VISUAL  muted             — softest active mode
--
-- Sections gradient: a (dark pill) → b (light) → c (paper)

local colors = require("tufte.colorscheme")

local M = {}

M.normal = {
	a = { bg = colors.foreground, fg = colors.background, gui = "bold" },
	b = { bg = colors.darker_background, fg = colors.dark_foreground },
	c = { bg = colors.dark_background, fg = colors.dark_foreground },
}

M.insert = {
	a = { bg = colors.dark_foreground, fg = colors.background, gui = "bold" },
	b = { bg = colors.darker_background, fg = colors.dark_foreground },
	c = { bg = colors.dark_background, fg = colors.dark_foreground },
}

M.command = {
	a = { bg = colors.bright_foreground, fg = colors.background, gui = "bold" },
	b = { bg = colors.darker_background, fg = colors.bright_foreground },
	c = { bg = colors.dark_background, fg = colors.dark_foreground },
}

M.visual = {
	a = { bg = colors.muted, fg = colors.background, gui = "bold" },
	b = { bg = colors.darker_background, fg = colors.muted },
	c = { bg = colors.dark_background, fg = colors.dark_foreground },
}

M.replace = {
	a = { bg = colors.light_foreground, fg = colors.background, gui = "bold" },
	b = { bg = colors.darker_background, fg = colors.light_foreground },
	c = { bg = colors.dark_background, fg = colors.dark_foreground },
}

M.terminal = {
	a = { bg = colors.light_foreground, fg = colors.background, gui = "bold" },
	b = { bg = colors.darker_background, fg = colors.light_foreground },
	c = { bg = colors.dark_background, fg = colors.dark_foreground },
}

M.inactive = {
	a = { bg = colors.darker_background, fg = colors.muted },
	b = { bg = colors.dark_background, fg = colors.muted },
	c = { bg = colors.dark_background, fg = colors.muted },
}

return M
