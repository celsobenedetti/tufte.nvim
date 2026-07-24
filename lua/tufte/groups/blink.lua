-- Blink plugin support for tufte colorscheme
local Util = require("tufte.utils")

local M = {}

---@param c tufte.ColorScheme
---@para  tufte.Config
---@return tufte.Highlights
function M.get(c)
  -- stylua: ignore
  return {
    BlinkCmpMenu              = { bg = c.dark_bg, fg = c.fg },
    BlinkCmpMenuBorder        = { bg = c.dark_bg, fg = c.bright_fg },
    BlinkCmpMenuSelection     = { bg = Util.blend_bg(c.darker_bg, 0.8) },
    BlinkCmpLabel             = { fg = c.fg },
    BlinkCmpLabelDeprecated   = { fg = c.muted, strikethrough = true },
    BlinkCmpLabelMatch        = { fg = c.bright_fg, bold = true },
    BlinkCmpLabelDescription  = { fg = c.dark_fg },
    BlinkCmpLabelDetail       = { fg = c.muted },
    BlinkCmpKind              = { fg = c.fg },
    BlinkCmpKindClass         = { fg = c.fg },
    BlinkCmpKindColor         = { fg = c.bright_fg },
    BlinkCmpKindConstant      = { fg = c.light_fg },
    BlinkCmpKindConstructor   = { fg = c.fg },
    BlinkCmpKindEnum          = { fg = c.fg },
    BlinkCmpKindEnumMember    = { fg = c.dark_fg },
    BlinkCmpKindEvent         = { fg = c.fg },
    BlinkCmpKindField         = { fg = c.dark_fg },
    BlinkCmpKindFile          = { fg = c.fg },
    BlinkCmpKindFolder        = { fg = c.fg },
    BlinkCmpKindFunction      = { fg = c.fg },
    BlinkCmpKindInterface     = { fg = c.fg },
    BlinkCmpKindKeyword       = { fg = c.fg },
    BlinkCmpKindMethod        = { fg = c.fg },
    BlinkCmpKindModule        = { fg = c.fg },
    BlinkCmpKindOperator      = { fg = c.bright_fg },
    BlinkCmpKindProperty      = { fg = c.dark_fg },
    BlinkCmpKindReference     = { fg = c.light_fg },
    BlinkCmpKindSnippet       = { fg = c.light_fg },
    BlinkCmpKindStruct        = { fg = c.fg },
    BlinkCmpKindText          = { fg = c.fg },
    BlinkCmpKindTypeParameter = { fg = c.fg },
    BlinkCmpKindUnit          = { fg = c.light_fg },
    BlinkCmpKindValue         = { fg = c.light_fg },
    BlinkCmpKindVariable      = { fg = c.fg },
    BlinkCmpDoc               = { bg = c.dark_bg, fg = c.fg },
    BlinkCmpDocBorder         = { bg = c.dark_bg, fg = c.bright_fg },
    BlinkCmpSignatureHelp     = { bg = c.dark_bg, fg = c.fg },
    BlinkCmpSignatureHelpBorder = { bg = c.dark_bg, fg = c.bright_fg },
    BlinkCmpSignatureHelpActiveParameter = { fg = c.fg, bold = true },
  }
end

return M
