-- dropbar.nvim support for tufte colorscheme
--
-- dropbar links most of its symbols to existing groups (WinBar, WinBarNC,
-- Visual, etc.), so this file mainly ensures the menu background matches the
-- main editor background rather than the float background.
local Util = require("tufte.utils")

local M = {}

---@param c ColorScheme
---@param opts tufte.Config
---@return tufte.Highlights
function M.get(c, opts)
  -- stylua: ignore
  return {
    DropBarMenuNormalFloat = { fg = c.fg, bg = c.bg },
    DropBarMenuFloatBorder = { fg = c.border_highlight, bg = c.bg },
  }
end

return M
