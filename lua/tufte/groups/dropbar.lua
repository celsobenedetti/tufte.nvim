-- dropbar.nvim support for tufte colorscheme
--
-- dropbar links most of its symbols to existing groups (WinBar, WinBarNC,
-- Visual, etc.), so this file mainly ensures the menu background matches the
-- main editor background rather than the float background.

local M = {}

---@param c tufte.ColorScheme
---@return tufte.Highlights
function M.get(c)
  -- stylua: ignore
  return {
    DropBarMenuNormalFloat = { fg = c.fg, bg = c.bg },
    DropBarMenuFloatBorder = { fg = c.bright_fg, bg = c.bg },
  }
end

return M
