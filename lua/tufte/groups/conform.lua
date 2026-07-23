-- Conform plugin support for tufte colorscheme

local M = {}

---@param c ColorScheme
---@return tufte.Highlights
function M.get(c)
  -- stylua: ignore
  return {
    ConformProgress = { fg = c.blue },
    ConformDone     = { fg = c.green },
    ConformError    = { fg = c.error },
  }
end

return M
