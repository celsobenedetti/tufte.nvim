-- Gitsigns plugin support for tufte colorscheme
local Util = require("tufte.utils")

local M = {}

---@type tufte.HighlightsFn
function M.get(c, opts)
  return {
    GitSignsAdd = { fg = c.git.add },
    GitSignsChange = { fg = c.git.change },
    GitSignsDelete = { fg = c.git.delete },
  }
end

return M
