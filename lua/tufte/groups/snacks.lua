-- Snacks plugin support for tufte colorscheme
local Util = require("tufte.utils")

local M = {}

---@param c ColorScheme
---@param opts tufte.Config
---@return tufte.Highlights
function M.get(c, opts)
  -- stylua: ignore
  return {
    SnacksNormal           = { bg = c.dark_background, fg = c.foreground },
    SnacksWinBar           = { bg = c.dark_background, fg = c.foreground },
    SnacksBackdrop         = { bg = c.dark_background },
    SnacksNormalNC         = { bg = c.dark_background, fg = c.foreground },
    SnacksWinBarNC         = { bg = c.dark_background, fg = c.dark_foreground },
    SnacksNotifierInfo     = { fg = c.info },
    SnacksNotifierWarn     = { fg = c.warning },
    SnacksNotifierError    = { fg = c.error },
    SnacksNotifierDebug    = { fg = c.muted },
    SnacksNotifierTrace    = { fg = c.foreground },
    SnacksNotifierIconInfo = { fg = c.info },
    SnacksNotifierIconWarn = { fg = c.warning },
    SnacksNotifierIconError = { fg = c.error },
    SnacksNotifierIconDebug = { fg = c.muted },
    SnacksNotifierIconTrace = { fg = c.foreground },
    SnacksNotifierTitleInfo = { fg = c.info, bold = true },
    SnacksNotifierTitleWarn = { fg = c.warning, bold = true },
    SnacksNotifierTitleError = { fg = c.error, bold = true },
    SnacksNotifierTitleDebug = { fg = c.muted, bold = true },
    SnacksNotifierTitleTrace = { fg = c.foreground, bold = true },
    SnacksNotifierBorderInfo = { fg = c.info },
    SnacksNotifierBorderWarn = { fg = c.warning },
    SnacksNotifierBorderError = { fg = c.error },
    SnacksNotifierBorderDebug = { fg = c.muted },
    SnacksNotifierBorderTrace = { fg = c.foreground },

    -- Dashboard
    SnacksDashboardNormal     = { bg = c.background, fg = c.foreground },
    SnacksDashboardDesc       = { fg = c.muted },
    SnacksDashboardFile       = { fg = c.foreground },
    SnacksDashboardDir        = { fg = c.muted },
    SnacksDashboardFooter     = { fg = c.muted },
    SnacksDashboardHeader     = { fg = c.foreground, bold = true },
    SnacksDashboardIcon       = { fg = c.foreground },
    SnacksDashboardKey        = { fg = c.foreground, bold = true },
    SnacksDashboardTerminal   = { bg = c.background },
    SnacksDashboardSpecial    = { fg = c.bright_foreground },
    SnacksDashboardTitle      = { fg = c.foreground, bold = true },

    -- Picker
    SnacksPickerNormal        = { bg = c.dark_background, fg = c.foreground },
    SnacksPickerBorder        = { fg = c.bright_foreground, bg = c.dark_background },
    SnacksPickerTitle         = { fg = c.foreground, bold = true },
    SnacksPickerCursorLine    = { bg = c.darker_background },
    SnacksPickerMatch         = { fg = c.bright_foreground, bold = true },
    SnacksPickerSelected      = { fg = c.foreground, bold = true },
    SnacksPickerToggle        = { fg = c.foreground, bold = true },
    SnacksPickerDir           = { fg = c.muted },
    SnacksPickerFile          = { fg = c.foreground },
    SnacksPickerGitAdded      = { fg = c.bright_foreground },
    SnacksPickerGitDeleted    = { fg = c.accent },
    SnacksPickerGitModified   = { fg = c.light_foreground },
    SnacksPickerSearch        = { fg = c.bright_foreground },
    SnacksPickerInputNormal   = { bg = c.dark_background, fg = c.foreground },
    SnacksPickerInputBorder   = { fg = c.bright_foreground, bg = c.dark_background },
    SnacksPickerInputTitle    = { fg = c.foreground, bold = true },
    SnacksPickerListNormal    = { bg = c.dark_background, fg = c.foreground },
    SnacksPickerListBorder    = { fg = c.bright_foreground, bg = c.dark_background },
    SnacksPickerListTitle     = { fg = c.foreground, bold = true },
    SnacksPickerListCursorLine = { bg = c.darker_background },
    SnacksPickerPreviewNormal = { bg = c.dark_background, fg = c.foreground },
    SnacksPickerPreviewBorder = { fg = c.bright_foreground, bg = c.dark_background },
    SnacksPickerPreviewTitle  = { fg = c.foreground, bold = true },

    -- Indent
    SnacksIndent              = { fg = c.muted },
    SnacksIndentScope         = { fg = c.muted },
    SnacksIndentChunk         = { fg = c.muted },

    -- Input
    SnacksInputNormal         = { bg = c.dark_background, fg = c.foreground },
    SnacksInputBorder         = { fg = c.bright_foreground, bg = c.dark_background },
    SnacksInputTitle          = { fg = c.foreground, bold = true },
  }
end

return M
