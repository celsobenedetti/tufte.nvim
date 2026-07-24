-- Which key plugin support for tufte colorscheme
local Util = require("tufte.utils")

local M = {}

---@param c ColorScheme
---@param opts tufte.Config
---@return tufte.Highlights
function M.get(c, opts)
  -- stylua: ignore
  return {
    WhichKey                = { fg = c.bright_foreground },
    WhichKeyGroup           = { fg = c.foreground, bold = true },
    WhichKeyDesc            = { fg = c.bright_foreground },
    WhichKeySeparator       = { fg = c.muted },
    WhichKeyFloat           = { bg = c.dark_background },
    WhichKeyBorder          = { bg = c.dark_background, fg = c.bright_foreground },
    WhichKeyValue           = { fg = c.muted },
  }
end

return M
