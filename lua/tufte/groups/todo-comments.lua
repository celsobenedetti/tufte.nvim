-- Todo-comments plugin support for tufte colorscheme
local M = {}

---@param c ColorScheme
---@param opts tufte.Config
---@return tufte.Highlights
function M.get(c, opts)
  -- stylua: ignore
  return {
    TodoBgFIX      = { bg = c.error, fg = c.background, bold = true },
    TodoBgHACK     = { bg = c.warning, fg = c.background, bold = true },
    TodoBgNOTE     = { bg = c.hint, fg = c.background, bold = true },
    TodoBgPERF     = { bg = c.foreground, fg = c.background, bold = true },
    TodoBgTODO     = { bg = c.highlight, fg = c.background, bold = true },
    TodoBgWARN     = { bg = c.warning, fg = c.background, bold = true },
    TodoFgFIX      = { fg = c.error },
    TodoFgHACK     = { fg = c.warning },
    TodoFgNOTE     = { fg = c.hint },
    TodoFgPERF     = { fg = c.foreground },
    TodoFgTODO     = { fg = c.highlight },
    TodoFgWARN     = { fg = c.warning },
    TodoSignFIX    = { fg = c.error },
    TodoSignHACK   = { fg = c.warning },
    TodoSignNOTE   = { fg = c.hint },
    TodoSignPERF   = { fg = c.foreground },
    TodoSignTODO   = { fg = c.highlight },
    TodoSignWARN   = { fg = c.warning },
  }
end

return M
