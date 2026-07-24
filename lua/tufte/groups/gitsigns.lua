-- Gitsigns plugin support for tufte colorscheme

local M = {}

---@param c tufte.ColorScheme
---@return tufte.Highlights
function M.get(c)
	return {
		GitSignsAdd = { fg = c.bright_fg },
		GitSignsChange = { fg = c.light_fg },
		GitSignsDelete = { fg = c.accent },
	}
end

return M
