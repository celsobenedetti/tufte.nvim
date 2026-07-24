-- Gitsigns plugin support for tufte colorscheme

local M = {}

---@param c ColorScheme
---@return tufte.Highlights
function M.get(c)
	return {
		GitSignsAdd = { fg = c.bright_foreground },
		GitSignsChange = { fg = c.light_foreground },
		GitSignsDelete = { fg = c.accent },
	}
end

return M
