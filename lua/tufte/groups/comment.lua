-- Comment plugin support for tufte colorscheme

local M = {}

---@param c tufte.ColorScheme
---@param opts tufte.Config
---@return tufte.Highlights
function M.get(c, opts)
  -- stylua: ignore
  return {
    CommentNormal = { fg = c.muted, style = opts.styles.comments },
    CommentBold   = { fg = c.muted, bold = true },
    CommentItalic = { fg = c.muted, italic = true },
    CommentURL    = { fg = c.fg, underline = true },
  }
end

return M
