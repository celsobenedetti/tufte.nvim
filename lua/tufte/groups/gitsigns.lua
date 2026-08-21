local M = {}

---@param c tufte.ColorScheme
---@return tufte.Highlights
function M.get(c)
	return {
		GitSignsAdd = { fg = c.diff.add },
		GitSignsChange = { fg = c.light_fg },
		GitSignsDelete = { fg = c.accent },

		-- Char-level word-diff regions (inline hunk previews)
		GitSignsAddInline = { bg = c.diff.add_char },
		GitSignsChangeInline = { bg = c.diff.add_char },
		GitSignsDeleteInline = { bg = c.diff.delete_char },

		-- Char-level word-diff regions on the buffer line (`word_diff = true`)
		GitSignsAddLnInline = { bg = c.diff.add_char },
		GitSignsChangeLnInline = { bg = c.diff.add_char },
		GitSignsDeleteLnInline = { bg = c.diff.delete_char },

		-- Char-level word-diff regions in deleted-line previews
		GitSignsDeleteVirtLnInLine = { bg = c.diff.delete_char },
	}
end

return M
