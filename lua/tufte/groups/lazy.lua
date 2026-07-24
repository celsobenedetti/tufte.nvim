-- Lazy.nvim plugin support for tufte colorscheme
local M = {}

---@param c ColorScheme
---@param opts tufte.Config
---@return tufte.Highlights
function M.get(c, opts)
  -- stylua: ignore
  return {
    LazyButton                = { bg = c.darker_background, fg = c.foreground },
    LazyButtonActive          = { bg = c.foreground, fg = c.background, bold = true },
    LazyComment               = { fg = c.muted },
    LazyCommit                = { fg = c.muted },
    LazyCommitIssue           = { fg = c.foreground },
    LazyCommitScope           = { fg = c.foreground, italic = true },
    LazyCommitType            = { fg = c.foreground, bold = true },
    LazyDimmed                = { fg = c.muted },
    LazyDir                   = { fg = c.foreground },
    LazyH1                    = { fg = c.foreground, bold = true },
    LazyH2                    = { fg = c.foreground },
    LazyNormal                = { fg = c.foreground, bg = c.dark_background },
    LazyOperator              = { fg = c.dark_foreground },
    LazyProp                  = { fg = c.bright_foreground },
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
    LazySpecial               = { fg = c.bright_foreground },
    LazyProgressDone          = { fg = c.foreground },
    LazyProgressTodo          = { fg = c.muted },
    LazyTaskError             = { fg = c.error },
    LazyTaskOutput            = { fg = c.foreground },
    LazyUrl                   = { fg = c.foreground, underline = true },
    LazyValue                 = { fg = c.light_foreground },
  }
end

return M
