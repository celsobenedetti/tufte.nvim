-- Todo-comments plugin support for tufte colorscheme
local M = {}

---@param c tufte.ColorScheme
---@param opts tufte.Config
---@return tufte.Highlights
function M.get(c, opts)
  -- stylua: ignore
  return {
    TodoBgFIX      = { bg = c.error, fg = c.bg, bold = true },
    TodoBgHACK     = { bg = c.warning, fg = c.bg, bold = true },
    TodoBgNOTE     = { bg = c.hint, fg = c.bg, bold = true },
    TodoBgPERF     = { bg = c.fg, fg = c.bg, bold = true },
    TodoBgTODO     = { bg = c.highlight, fg = c.bg, bold = true },
    TodoBgWARN     = { bg = c.warning, fg = c.bg, bold = true },
    TodoFgFIX      = { fg = c.error },
    TodoFgHACK     = { fg = c.warning },
    TodoFgNOTE     = { fg = c.hint },
    TodoFgPERF     = { fg = c.fg },
    TodoFgTODO     = { fg = c.highlight },
    TodoFgWARN     = { fg = c.warning },
    TodoSignFIX    = { fg = c.error },
    TodoSignHACK   = { fg = c.warning },
    TodoSignNOTE   = { fg = c.hint },
    TodoSignPERF   = { fg = c.fg },
    TodoSignTODO   = { fg = c.highlight },
    TodoSignWARN   = { fg = c.warning },
  }
end

return M
