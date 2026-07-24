-- Blink plugin support for tufte colorscheme
local Util = require("tufte.utils")

local M = {}

---@param c ColorScheme
---@para  tufte.Config
---@return tufte.Highlights
function M.get(c)
  -- stylua: ignore
  return {
    BlinkCmpMenu              = { bg = c.dark_background, fg = c.foreground },
    BlinkCmpMenuBorder        = { bg = c.dark_background, fg = c.bright_foreground },
    BlinkCmpMenuSelection     = { bg = Util.blend_bg(c.darker_background, 0.8) },
    BlinkCmpLabel             = { fg = c.foreground },
    BlinkCmpLabelDeprecated   = { fg = c.muted, strikethrough = true },
    BlinkCmpLabelMatch        = { fg = c.bright_foreground, bold = true },
    BlinkCmpLabelDescription  = { fg = c.dark_foreground },
    BlinkCmpLabelDetail       = { fg = c.muted },
    BlinkCmpKind              = { fg = c.foreground },
    BlinkCmpKindClass         = { fg = c.foreground },
    BlinkCmpKindColor         = { fg = c.bright_foreground },
    BlinkCmpKindConstant      = { fg = c.light_foreground },
    BlinkCmpKindConstructor   = { fg = c.foreground },
    BlinkCmpKindEnum          = { fg = c.foreground },
    BlinkCmpKindEnumMember    = { fg = c.dark_foreground },
    BlinkCmpKindEvent         = { fg = c.foreground },
    BlinkCmpKindField         = { fg = c.dark_foreground },
    BlinkCmpKindFile          = { fg = c.foreground },
    BlinkCmpKindFolder        = { fg = c.foreground },
    BlinkCmpKindFunction      = { fg = c.foreground },
    BlinkCmpKindInterface     = { fg = c.foreground },
    BlinkCmpKindKeyword       = { fg = c.foreground },
    BlinkCmpKindMethod        = { fg = c.foreground },
    BlinkCmpKindModule        = { fg = c.foreground },
    BlinkCmpKindOperator      = { fg = c.bright_foreground },
    BlinkCmpKindProperty      = { fg = c.dark_foreground },
    BlinkCmpKindReference     = { fg = c.light_foreground },
    BlinkCmpKindSnippet       = { fg = c.light_foreground },
    BlinkCmpKindStruct        = { fg = c.foreground },
    BlinkCmpKindText          = { fg = c.foreground },
    BlinkCmpKindTypeParameter = { fg = c.foreground },
    BlinkCmpKindUnit          = { fg = c.light_foreground },
    BlinkCmpKindValue         = { fg = c.light_foreground },
    BlinkCmpKindVariable      = { fg = c.foreground },
    BlinkCmpDoc               = { bg = c.dark_background, fg = c.foreground },
    BlinkCmpDocBorder         = { bg = c.dark_background, fg = c.bright_foreground },
    BlinkCmpSignatureHelp     = { bg = c.dark_background, fg = c.foreground },
    BlinkCmpSignatureHelpBorder = { bg = c.dark_background, fg = c.bright_foreground },
    BlinkCmpSignatureHelpActiveParameter = { fg = c.foreground, bold = true },
  }
end

return M
