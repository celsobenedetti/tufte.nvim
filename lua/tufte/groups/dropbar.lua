-- dropbar.nvim support for tufte colorscheme
--
-- dropbar links most of its symbols to existing groups (WinBar, WinBarNC,
-- Visual, etc.), so this file mainly ensures the menu background matches the
-- main editor background rather than the float background.

local M = {}

---@param c ColorScheme
---@return tufte.Highlights
function M.get(c)
  -- stylua: ignore
  return {
    DropBarMenuNormalFloat = { fg = c.foreground, bg = c.background },
    DropBarMenuFloatBorder = { fg = c.bright_foreground, bg = c.background },
  }
end

return M
