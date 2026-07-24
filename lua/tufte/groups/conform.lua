-- Conform plugin support for tufte colorscheme

local M = {}

---@param c tufte.ColorScheme
---@return tufte.Highlights
function M.get(c)
  -- stylua: ignore
  return {
    ConformProgress = { fg = c.fg },
    ConformDone     = { fg = c.light_fg },
    ConformError    = { fg = c.error },
  }
end

return M
