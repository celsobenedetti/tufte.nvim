-- Gitsigns plugin support for tufte colorscheme

local M = {}

---@param c ColorScheme
---@return tufte.Highlights
function M.get(c)
	return {
		GitSignsAdd = { fg = c.git.add },
		GitSignsChange = { fg = c.git.change },
		GitSignsDelete = { fg = c.git.delete },
	}
end

return M
