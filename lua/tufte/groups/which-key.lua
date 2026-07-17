-- Which key plugin support for tufte colorscheme
local Util = require("tufte.utils")

local M = {}

---@type tufte.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    WhichKey                = { fg = c.cyan },
    WhichKeyGroup           = { fg = c.blue, bold = true },
    WhichKeyDesc            = { fg = c.magenta },
    WhichKeySeparator       = { fg = c.comment },
    WhichKeyFloat           = { bg = c.bg_popup },
    WhichKeyBorder          = { bg = c.bg_popup, fg = c.border_highlight },
    WhichKeyValue           = { fg = c.comment },
  }
end

return M
