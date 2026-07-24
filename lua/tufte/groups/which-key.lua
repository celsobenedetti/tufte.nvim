-- Which key plugin support for tufte colorscheme
local Util = require("tufte.utils")

local M = {}

---@param c tufte.ColorScheme
---@param opts tufte.Config
---@return tufte.Highlights
function M.get(c, opts)
  -- stylua: ignore
  return {
    WhichKey                = { fg = c.bright_fg },
    WhichKeyGroup           = { fg = c.fg, bold = true },
    WhichKeyDesc            = { fg = c.bright_fg },
    WhichKeySeparator       = { fg = c.muted },
    WhichKeyFloat           = { bg = c.dark_bg },
    WhichKeyBorder          = { bg = c.dark_bg, fg = c.bright_fg },
    WhichKeyValue           = { fg = c.muted },
  }
end

return M
