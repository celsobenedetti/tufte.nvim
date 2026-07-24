-- Flash plugin support for tufte colorscheme

local M = {}

---@param c ColorScheme
---@return tufte.Highlights
function M.get(c)
  -- stylua: ignore
  return {
    FlashBackdrop = { fg = c.muted },
    FlashCurrent  = { fg = c.background, bg = c.light_foreground, bold = true },
    FlashLabel    = { fg = c.background, bg = c.bright_foreground, bold = true },
    FlashMatch    = { fg = c.bright_foreground, bg = c.darker_background, bold = true },
    FlashPrompt   = { link = "NormalFloat" },
  }
end

return M
