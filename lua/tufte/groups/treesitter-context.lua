-- nvim-treesitter-context support for tufte colorscheme

local M = {}

---@param c tufte.ColorScheme
---@return tufte.Highlights
function M.get(c)
  -- stylua: ignore
  return {
    TreesitterContext           = { fg = c.fg, bg = c.bg2 },
    TreesitterContextLineNumber = { fg = c.muted, bg = c.bg2 },
    TreesitterContextSeparator  = { fg = c.dark_fg },
  }
end

return M
