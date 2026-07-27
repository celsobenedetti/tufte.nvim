-- nvim-treesitter-context support for tufte colorscheme

local M = {}

---@param c tufte.ColorScheme
---@return tufte.Highlights
function M.get(c)
  -- stylua: ignore
  return {
    TreesitterContext           = { fg = c.fg, bg = c.dark_bg },
    TreesitterContextLineNumber = { fg = c.muted, bg = c.dark_bg },
    TreesitterContextSeparator  = { fg = c.dark_fg },
  }
end

return M
