-- Dap plugin support for tufte colorscheme
local Util = require("tufte.utils")

local M = {}

---@param c tufte.ColorScheme
---@return tufte.Highlights
function M.get(c)
  -- stylua: ignore
  return {
    DapBreakpoint          = { fg = c.accent },
    DapBreakpointCondition = { fg = c.fg },
    DapBreakpointRejected  = { fg = c.muted },
    DapLogPoint            = { fg = c.fg },
    DapStopped             = { fg = c.light_fg },
    DapStoppedLine         = { bg = Util.blend_bg(c.fg, 0.2) },
    DapUIBreakpointsCurrentLine = { fg = c.light_fg, bold = true },
    DapUIBreakpointsDisabledLine = { fg = c.muted },
    DapUIBreakpointsInfo   = { fg = c.light_fg },
    DapUIBreakpointsPath   = { fg = c.bright_fg },
    DapUIDecoration        = { fg = c.fg },
    DapUIFloatBorder       = { fg = c.bright_fg },
    DapUILineNumber        = { fg = c.bright_fg },
    DapUIModifiedValue     = { fg = c.bright_fg, bold = true },
    DapUIPlayPause         = { fg = c.light_fg },
    DapUIRestart           = { fg = c.light_fg },
    DapUIScope             = { fg = c.bright_fg },
    DapUISource            = { fg = c.fg },
    DapUIStepBack          = { fg = c.bright_fg },
    DapUIStepInto          = { fg = c.bright_fg },
    DapUIStepOut           = { fg = c.bright_fg },
    DapUIStepOver          = { fg = c.bright_fg },
    DapUIStop              = { fg = c.accent },
    DapUIStoppedThread     = { fg = c.bright_fg },
    DapUIThread            = { fg = c.light_fg },
    DapUIType              = { fg = c.fg },
    DapUIValue             = { fg = c.fg },
    DapUIVariable          = { fg = c.fg },
    DapUIWatchesEmpty      = { fg = c.accent },
    DapUIWatchesError      = { fg = c.accent },
    DapUIWatchesValue      = { fg = c.light_fg },
  }
end

return M
