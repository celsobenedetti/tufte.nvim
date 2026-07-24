-- Lazy.nvim plugin support for tufte colorscheme
local M = {}

---@param c tufte.ColorScheme
---@param opts tufte.Config
---@return tufte.Highlights
function M.get(c, opts)
  -- stylua: ignore
  return {
    LazyButton                = { bg = c.darker_bg, fg = c.fg },
    LazyButtonActive          = { bg = c.fg, fg = c.bg, bold = true },
    LazyComment               = { fg = c.muted },
    LazyCommit                = { fg = c.muted },
    LazyCommitIssue           = { fg = c.fg },
    LazyCommitScope           = { fg = c.fg, italic = true },
    LazyCommitType            = { fg = c.fg, bold = true },
    LazyDimmed                = { fg = c.muted },
    LazyDir                   = { fg = c.fg },
    LazyH1                    = { fg = c.fg, bold = true },
    LazyH2                    = { fg = c.fg },
    LazyNormal                = { fg = c.fg, bg = c.dark_bg },
    LazyOperator              = { fg = c.dark_fg },
    LazyProp                  = { fg = c.bright_fg },
    LazyReasonCmd             = { fg = c.muted },
    LazyReasonEvent           = { fg = c.muted },
    LazyReasonFt              = { fg = c.muted },
    LazyReasonImport          = { fg = c.muted },
    LazyReasonKeys            = { fg = c.muted },
    LazyReasonPlugin          = { fg = c.muted },
    LazyReasonRequire         = { fg = c.muted },
    LazyReasonRuntime         = { fg = c.muted },
    LazyReasonSource          = { fg = c.muted },
    LazyReasonStart           = { fg = c.muted },
    LazySpecial               = { fg = c.bright_fg },
    LazyProgressDone          = { fg = c.fg },
    LazyProgressTodo          = { fg = c.muted },
    LazyTaskError             = { fg = c.error },
    LazyTaskOutput            = { fg = c.fg },
    LazyUrl                   = { fg = c.fg, underline = true },
    LazyValue                 = { fg = c.light_fg },
  }
end

return M
