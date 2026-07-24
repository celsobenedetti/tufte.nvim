-- Snacks plugin support for tufte colorscheme
local Util = require("tufte.utils")

local M = {}

---@param c tufte.ColorScheme
---@param opts tufte.Config
---@return tufte.Highlights
function M.get(c, opts)
  -- stylua: ignore
  return {
    SnacksNormal           = { bg = c.dark_bg, fg = c.fg },
    SnacksWinBar           = { bg = c.dark_bg, fg = c.fg },
    SnacksBackdrop         = { bg = c.dark_bg },
    SnacksNormalNC         = { bg = c.dark_bg, fg = c.fg },
    SnacksWinBarNC         = { bg = c.dark_bg, fg = c.dark_fg },
    SnacksNotifierInfo     = { fg = c.info },
    SnacksNotifierWarn     = { fg = c.warning },
    SnacksNotifierError    = { fg = c.error },
    SnacksNotifierDebug    = { fg = c.muted },
    SnacksNotifierTrace    = { fg = c.fg },
    SnacksNotifierIconInfo = { fg = c.info },
    SnacksNotifierIconWarn = { fg = c.warning },
    SnacksNotifierIconError = { fg = c.error },
    SnacksNotifierIconDebug = { fg = c.muted },
    SnacksNotifierIconTrace = { fg = c.fg },
    SnacksNotifierTitleInfo = { fg = c.info, bold = true },
    SnacksNotifierTitleWarn = { fg = c.warning, bold = true },
    SnacksNotifierTitleError = { fg = c.error, bold = true },
    SnacksNotifierTitleDebug = { fg = c.muted, bold = true },
    SnacksNotifierTitleTrace = { fg = c.fg, bold = true },
    SnacksNotifierBorderInfo = { fg = c.info },
    SnacksNotifierBorderWarn = { fg = c.warning },
    SnacksNotifierBorderError = { fg = c.error },
    SnacksNotifierBorderDebug = { fg = c.muted },
    SnacksNotifierBorderTrace = { fg = c.fg },

    -- Dashboard
    SnacksDashboardNormal     = { bg = c.bg, fg = c.fg },
    SnacksDashboardDesc       = { fg = c.muted },
    SnacksDashboardFile       = { fg = c.fg },
    SnacksDashboardDir        = { fg = c.muted },
    SnacksDashboardFooter     = { fg = c.muted },
    SnacksDashboardHeader     = { fg = c.fg, bold = true },
    SnacksDashboardIcon       = { fg = c.fg },
    SnacksDashboardKey        = { fg = c.fg, bold = true },
    SnacksDashboardTerminal   = { bg = c.bg },
    SnacksDashboardSpecial    = { fg = c.bright_fg },
    SnacksDashboardTitle      = { fg = c.fg, bold = true },

    -- Picker
    SnacksPickerNormal        = { bg = c.dark_bg, fg = c.fg },
    SnacksPickerBorder        = { fg = c.bright_fg, bg = c.dark_bg },
    SnacksPickerTitle         = { fg = c.fg, bold = true },
    SnacksPickerCursorLine    = { bg = c.darker_bg },
    SnacksPickerMatch         = { fg = c.bright_fg, bold = true },
    SnacksPickerSelected      = { fg = c.fg, bold = true },
    SnacksPickerToggle        = { fg = c.fg, bold = true },
    SnacksPickerDir           = { fg = c.muted },
    SnacksPickerFile          = { fg = c.fg },
    SnacksPickerGitAdded      = { fg = c.bright_fg },
    SnacksPickerGitDeleted    = { fg = c.accent },
    SnacksPickerGitModified   = { fg = c.light_fg },
    SnacksPickerSearch        = { fg = c.bright_fg },
    SnacksPickerInputNormal   = { bg = c.dark_bg, fg = c.fg },
    SnacksPickerInputBorder   = { fg = c.bright_fg, bg = c.dark_bg },
    SnacksPickerInputTitle    = { fg = c.fg, bold = true },
    SnacksPickerListNormal    = { bg = c.dark_bg, fg = c.fg },
    SnacksPickerListBorder    = { fg = c.bright_fg, bg = c.dark_bg },
    SnacksPickerListTitle     = { fg = c.fg, bold = true },
    SnacksPickerListCursorLine = { bg = c.darker_bg },
    SnacksPickerPreviewNormal = { bg = c.dark_bg, fg = c.fg },
    SnacksPickerPreviewBorder = { fg = c.bright_fg, bg = c.dark_bg },
    SnacksPickerPreviewTitle  = { fg = c.fg, bold = true },

    -- Indent
    SnacksIndent              = { fg = c.muted },
    SnacksIndentScope         = { fg = c.muted },
    SnacksIndentChunk         = { fg = c.muted },

    -- Input
    SnacksInputNormal         = { bg = c.dark_bg, fg = c.fg },
    SnacksInputBorder         = { fg = c.bright_fg, bg = c.dark_bg },
    SnacksInputTitle          = { fg = c.fg, bold = true },
  }
end

return M
