-- Mini plugin support for tufte colorscheme
local Util = require("tufte.utils")

local M = {}

---@param c ColorScheme
---@param opts tufte.Config
---@return tufte.Highlights
function M.get(c, opts)
  -- stylua: ignore
  return {
    -- Mini.nvim modules
    MiniCompletionActiveParameter = { underline = true },
    MiniCursorword                = { bg = c.darker_background },
    MiniCursorwordCurrent         = { bg = c.darker_background },
    MiniIndentscopeSymbol         = { fg = c.bright_foreground, nocombine = true },
    MiniIndentscopePrefix         = { nocombine = true },
    MiniJump                      = { bg = c.bright_foreground, fg = c.background },
    MiniJump2dSpot                = { fg = c.bright_foreground, bold = true, nocombine = true },
    MiniStarterCurrent            = { nocombine = true },
    MiniStarterFooter             = { fg = c.foreground, italic = true },
    MiniStarterHeader             = { fg = c.foreground, bold = true },
    MiniStarterInactive           = { fg = c.muted },
    MiniStarterItem               = { fg = c.foreground },
    MiniStarterItemBullet         = { fg = c.bright_foreground },
    MiniStarterItemPrefix         = { fg = c.warning },
    MiniStarterSection            = { fg = c.foreground, bold = true },
    MiniStarterQuery              = { fg = c.info },
    MiniStatuslineDevinfo         = { fg = c.dark_foreground, bg = c.darker_background },
    MiniStatuslineFileinfo        = { fg = c.dark_foreground, bg = c.darker_background },
    MiniStatuslineFilename        = { fg = c.foreground, bg = c.darker_background },
    MiniStatuslineInactive        = { fg = c.foreground, bg = c.dark_background },
    MiniStatuslineModeCommand     = { fg = c.background, bg = c.foreground, bold = true },
    MiniStatuslineModeInsert      = { fg = c.background, bg = c.light_foreground, bold = true },
    MiniStatuslineModeNormal      = { fg = c.background, bg = c.foreground, bold = true },
    MiniStatuslineModeOther       = { fg = c.background, bg = c.dark_foreground, bold = true },
    MiniStatuslineModeReplace     = { fg = c.background, bg = c.foreground, bold = true },
    MiniStatuslineModeVisual      = { fg = c.background, bg = c.bright_foreground, bold = true },
    MiniSurround                  = { bg = c.light_foreground, fg = c.background },
    MiniTablineCurrent            = { fg = c.foreground, bg = c.darker_background, bold = true },
    MiniTablineFill               = { bg = c.darker_background },
    MiniTablineHidden             = { fg = c.muted, bg = c.dark_background },
    MiniTablineModifiedCurrent    = { fg = c.warning, bg = c.darker_background, bold = true },
    MiniTablineModifiedHidden     = { fg = c.muted, bg = c.dark_background },
    MiniTablineModifiedVisible    = { fg = c.warning, bg = c.dark_background },
    MiniTablineTabpagesection     = { fg = c.background, bg = c.foreground, bold = true },
    MiniTablineVisible            = { fg = c.foreground, bg = c.dark_background },
    MiniTestEmphasis              = { bold = true },
    MiniTestFail                  = { fg = c.accent, bold = true },
    MiniTestPass                  = { fg = c.light_foreground, bold = true },
    MiniTrailspace                = { bg = c.accent },
  }
end

return M
