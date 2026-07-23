-- Gitsigns plugin support for tufte colorscheme
local Util = require("tufte.utils")

local M = {}

---@param c ColorScheme
---@param opts tufte.Config
---@return tufte.Highlights
function M.get(c, opts)
  return {
    GitSignsAdd = { fg = c.git.add },
    GitSignsChange = { fg = c.git.change },
    GitSignsDelete = { fg = c.git.delete },
  }
end

return M
