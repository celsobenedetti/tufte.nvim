-- Mason plugin support for tufte colorscheme
local Util = require("tufte.utils")

local M = {}

---@param c ColorScheme
---@param opts tufte.Config
---@return tufte.Highlights
function M.get(c, opts)
  -- stylua: ignore
  return {
    MasonHeader                  = { fg = c.background, bg = c.foreground, bold = true },
    MasonHeaderSecondary         = { fg = c.background, bg = c.bright_foreground, bold = true },
    MasonHighlight               = { fg = c.foreground },
    MasonHighlightBlock          = { fg = c.background, bg = c.foreground },
    MasonHighlightBlockBold      = { fg = c.background, bg = c.foreground, bold = true },
    MasonHighlightSecondary      = { fg = c.bright_foreground },
    MasonHighlightBlockSecondary = { fg = c.background, bg = c.bright_foreground },
    MasonHighlightBlockBoldSecondary = { fg = c.background, bg = c.bright_foreground, bold = true },
    MasonMuted                   = { fg = c.muted },
    MasonMutedBlock              = { fg = c.foreground, bg = c.dark_background },
    MasonMutedBlockBold          = { fg = c.foreground, bg = c.dark_background, bold = true },
    MasonError                   = { fg = c.error },
    MasonWarning                 = { fg = c.warning },
    MasonHeading                 = { fg = c.foreground, bold = true },
  }
end

return M
