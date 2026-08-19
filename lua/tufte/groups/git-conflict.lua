-- git-conflict.nvim support for tufte colorscheme
--
-- git-conflict.nvim derives its conflict section colors from `config.highlights`
-- (defaults: current -> DiffText, incoming -> DiffAdd, ancestor -> none) and
-- then sets the GitConflict{Current,Incoming,Ancestor}[Label] groups with
-- `default = true` on every ColorScheme event. Defining them here pins tufte's
-- own washes: tufte's non-default set always wins, regardless of load order.

local Util = require("tufte.utils")

local M = {}

---@param c tufte.ColorScheme
---@return tufte.Highlights
function M.get(c)
	-- Section bodies stay on the unified diff convention (see colors/init.lua):
	-- current is the neutral DiffText wash, incoming is the add wash, and the
	-- ancestor — which the plugin would otherwise paint purple (off-palette for
	-- tufte) — gets the neutral change wash instead.
	local current_label = Util.blend_bg(c.diff.text, 0.35)
	local ancestor_label = Util.blend_bg(c.diff.change, 0.35)

	return {
		GitConflictCurrent = { bg = c.diff.text },
		GitConflictIncoming = { bg = c.diff.add },
		GitConflictAncestor = { bg = c.diff.change },

		-- Label rows are the conflict marker lines ("<<<<<<< HEAD (Current
		-- changes)"), drawn by the plugin as overlay virt_text spanning the
		-- whole row. Step each wash up from its section body and pin the ink
		-- so the marker text always reads on top of the band.
		GitConflictCurrentLabel = { bg = current_label, fg = c.fg },
		GitConflictIncomingLabel = { bg = c.diff.add_char, fg = c.fg },
		GitConflictAncestorLabel = { bg = ancestor_label, fg = c.fg },
	}
end

return M
