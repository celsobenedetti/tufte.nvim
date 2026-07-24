-- Mason plugin support for tufte colorscheme
local Util = require("tufte.utils")

local M = {}

---@param c tufte.ColorScheme
---@param opts tufte.Config
---@return tufte.Highlights
function M.get(c, opts)
  -- stylua: ignore
  return {
    MasonHeader                  = { fg = c.bg, bg = c.fg, bold = true },
    MasonHeaderSecondary         = { fg = c.bg, bg = c.bright_fg, bold = true },
    MasonHighlight               = { fg = c.fg },
    MasonHighlightBlock          = { fg = c.bg, bg = c.fg },
    MasonHighlightBlockBold      = { fg = c.bg, bg = c.fg, bold = true },
    MasonHighlightSecondary      = { fg = c.bright_fg },
    MasonHighlightBlockSecondary = { fg = c.bg, bg = c.bright_fg },
    MasonHighlightBlockBoldSecondary = { fg = c.bg, bg = c.bright_fg, bold = true },
    MasonMuted                   = { fg = c.muted },
    MasonMutedBlock              = { fg = c.fg, bg = c.dark_bg },
    MasonMutedBlockBold          = { fg = c.fg, bg = c.dark_bg, bold = true },
    MasonError                   = { fg = c.error },
    MasonWarning                 = { fg = c.warning },
    MasonHeading                 = { fg = c.fg, bold = true },
  }
end

return M
