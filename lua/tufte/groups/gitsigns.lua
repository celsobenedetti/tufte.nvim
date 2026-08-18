-- Gitsigns plugin support for tufte colorscheme
local Util = require("tufte.utils")

local M = {}

---@param c tufte.ColorScheme
---@return tufte.Highlights
function M.get(c)
	-- Intra-line word-diff regions (inline hunk previews, `word_diff = true`,
	-- deleted-line previews) use the same char-level add/delete convention as
	-- codediff.nvim (see groups/codediff.lua): the more saturated
	-- `add_char`/`delete_char` washes sit on top of the line-level
	-- `add`/`delete` wash. Change regions are the neutral blend, stepped up
	-- from the line-level `change` wash so they read against it.
	local char_change = Util.blend_bg(c.diff.text, 0.35)

	return {
		GitSignsAdd = { fg = c.diff.add_contrast },
		GitSignsChange = { fg = c.light_fg },
		GitSignsDelete = { fg = c.accent },

		-- Char-level word-diff regions (inline hunk previews)
		GitSignsAddInline = { bg = c.diff.add_char },
		GitSignsChangeInline = { bg = char_change },
		GitSignsDeleteInline = { bg = c.diff.delete_char },

		-- Char-level word-diff regions on the buffer line (`word_diff = true`)
		GitSignsAddLnInline = { bg = c.diff.add_char },
		GitSignsChangeLnInline = { bg = char_change },
		GitSignsDeleteLnInline = { bg = c.diff.delete_char },

		-- Char-level word-diff regions in deleted-line previews
		GitSignsDeleteVirtLnInLine = { bg = c.diff.delete_char },
	}
end

return M
