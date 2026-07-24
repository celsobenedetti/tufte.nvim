-- Dap plugin support for tufte colorscheme
local Util = require("tufte.utils")

local M = {}

---@param c ColorScheme
---@return tufte.Highlights
function M.get(c)
  -- stylua: ignore
  return {
    DapBreakpoint          = { fg = c.accent },
    DapBreakpointCondition = { fg = c.foreground },
    DapBreakpointRejected  = { fg = c.muted },
    DapLogPoint            = { fg = c.foreground },
    DapStopped             = { fg = c.light_foreground },
    DapStoppedLine         = { bg = Util.blend_bg(c.foreground, 0.2) },
    DapUIBreakpointsCurrentLine = { fg = c.light_foreground, bold = true },
    DapUIBreakpointsDisabledLine = { fg = c.muted },
    DapUIBreakpointsInfo   = { fg = c.light_foreground },
    DapUIBreakpointsPath   = { fg = c.bright_foreground },
    DapUIDecoration        = { fg = c.foreground },
    DapUIFloatBorder       = { fg = c.bright_foreground },
    DapUILineNumber        = { fg = c.bright_foreground },
    DapUIModifiedValue     = { fg = c.bright_foreground, bold = true },
    DapUIPlayPause         = { fg = c.light_foreground },
    DapUIRestart           = { fg = c.light_foreground },
    DapUIScope             = { fg = c.bright_foreground },
    DapUISource            = { fg = c.foreground },
    DapUIStepBack          = { fg = c.bright_foreground },
    DapUIStepInto          = { fg = c.bright_foreground },
    DapUIStepOut           = { fg = c.bright_foreground },
    DapUIStepOver          = { fg = c.bright_foreground },
    DapUIStop              = { fg = c.accent },
    DapUIStoppedThread     = { fg = c.bright_foreground },
    DapUIThread            = { fg = c.light_foreground },
    DapUIType              = { fg = c.foreground },
    DapUIValue             = { fg = c.foreground },
    DapUIVariable          = { fg = c.foreground },
    DapUIWatchesEmpty      = { fg = c.accent },
    DapUIWatchesError      = { fg = c.accent },
    DapUIWatchesValue      = { fg = c.light_foreground },
  }
end

return M
