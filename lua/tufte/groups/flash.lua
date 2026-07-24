-- Flash plugin support for tufte colorscheme

local M = {}

---@param c tufte.ColorScheme
---@return tufte.Highlights
function M.get(c)
  -- stylua: ignore
  return {
    FlashBackdrop = { fg = c.muted },
    FlashCurrent  = { fg = c.bg, bg = c.light_fg, bold = true },
    FlashLabel    = { fg = c.bg, bg = c.bright_fg, bold = true },
    FlashMatch    = { fg = c.bright_fg, bg = c.darker_bg, bold = true },
    FlashPrompt   = { link = "NormalFloat" },
  }
end

return M
