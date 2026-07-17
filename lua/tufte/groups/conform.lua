-- Conform plugin support for tufte colorscheme
local Util = require("tufte.utils")

local M = {}

---@type tufte.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    ConformProgress = { fg = c.blue },
    ConformDone     = { fg = c.green },
    ConformError    = { fg = c.error },
  }
end

return M
