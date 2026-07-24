-- Mini plugin support for tufte colorscheme
local Util = require("tufte.utils")

local M = {}

---@param c tufte.ColorScheme
---@param opts tufte.Config
---@return tufte.Highlights
function M.get(c, opts)
  -- stylua: ignore
  return {
    -- Mini.nvim modules
    MiniCompletionActiveParameter = { underline = true },
    MiniCursorword                = { bg = c.darker_bg },
    MiniCursorwordCurrent         = { bg = c.darker_bg },
    MiniIndentscopeSymbol         = { fg = c.bright_fg, nocombine = true },
    MiniIndentscopePrefix         = { nocombine = true },
    MiniJump                      = { bg = c.bright_fg, fg = c.bg },
    MiniJump2dSpot                = { fg = c.bright_fg, bold = true, nocombine = true },
    MiniStarterCurrent            = { nocombine = true },
    MiniStarterFooter             = { fg = c.fg, italic = true },
    MiniStarterHeader             = { fg = c.fg, bold = true },
    MiniStarterInactive           = { fg = c.muted },
    MiniStarterItem               = { fg = c.fg },
    MiniStarterItemBullet         = { fg = c.bright_fg },
    MiniStarterItemPrefix         = { fg = c.warning },
    MiniStarterSection            = { fg = c.fg, bold = true },
    MiniStarterQuery              = { fg = c.info },
    MiniStatuslineDevinfo         = { fg = c.dark_fg, bg = c.darker_bg },
    MiniStatuslineFileinfo        = { fg = c.dark_fg, bg = c.darker_bg },
    MiniStatuslineFilename        = { fg = c.fg, bg = c.darker_bg },
    MiniStatuslineInactive        = { fg = c.fg, bg = c.dark_bg },
    MiniStatuslineModeCommand     = { fg = c.bg, bg = c.fg, bold = true },
    MiniStatuslineModeInsert      = { fg = c.bg, bg = c.light_fg, bold = true },
    MiniStatuslineModeNormal      = { fg = c.bg, bg = c.fg, bold = true },
    MiniStatuslineModeOther       = { fg = c.bg, bg = c.dark_fg, bold = true },
    MiniStatuslineModeReplace     = { fg = c.bg, bg = c.fg, bold = true },
    MiniStatuslineModeVisual      = { fg = c.bg, bg = c.bright_fg, bold = true },
    MiniSurround                  = { bg = c.light_fg, fg = c.bg },
    MiniTablineCurrent            = { fg = c.fg, bg = c.darker_bg, bold = true },
    MiniTablineFill               = { bg = c.darker_bg },
    MiniTablineHidden             = { fg = c.muted, bg = c.dark_bg },
    MiniTablineModifiedCurrent    = { fg = c.warning, bg = c.darker_bg, bold = true },
    MiniTablineModifiedHidden     = { fg = c.muted, bg = c.dark_bg },
    MiniTablineModifiedVisible    = { fg = c.warning, bg = c.dark_bg },
    MiniTablineTabpagesection     = { fg = c.bg, bg = c.fg, bold = true },
    MiniTablineVisible            = { fg = c.fg, bg = c.dark_bg },
    MiniTestEmphasis              = { bold = true },
    MiniTestFail                  = { fg = c.accent, bold = true },
    MiniTestPass                  = { fg = c.light_fg, bold = true },
    MiniTrailspace                = { bg = c.accent },
  }
end

return M
