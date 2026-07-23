-- Flash plugin support for tufte colorscheme

local M = {}

---@param c ColorScheme
---@return tufte.Highlights
function M.get(c)
  -- stylua: ignore
  return {
    FlashBackdrop = { fg = c.comment },
    FlashCurrent  = { fg = c.black, bg = c.orange, bold = true },
    FlashLabel    = { fg = c.black, bg = c.magenta, bold = true },
    FlashMatch    = { fg = c.cyan, bg = c.bg_highlight, bold = true },
    FlashPrompt   = { link = "NormalFloat" },
  }
end

return M
