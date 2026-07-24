local Util = require("tufte.utils")

local M = {}

---@param c ColorScheme
---@param opts tufte.Config
---@return tufte.Highlights
function M.get(c, opts)
  -- stylua: ignore
  return {
    Comment                     = { fg = c.muted, style = opts.styles.comments }, -- any comment
    ColorColumn                 = { bg = c.darker_background }, -- used for the columns set with 'colorcolumn'
    Conceal                     = { fg = c.muted }, -- placeholder characters substituted for concealed text
    Cursor                      = { fg = c.background, bg = c.foreground }, -- character under the cursor
    lCursor                     = { fg = c.background, bg = c.foreground },
    CursorIM                    = { fg = c.background, bg = c.foreground },
    CursorColumn                = { bg = c.darker_background },
    CursorLine                  = { bg = c.darker_background },
    Directory                   = { fg = c.foreground },
    DiffAdd                     = { bg = c.diff.add },
    DiffChange                  = { bg = c.diff.change },
    DiffDelete                  = { bg = c.diff.delete },
    DiffText                    = { bg = c.diff.text },
    EndOfBuffer                 = { fg = c.background },
    ErrorMsg                    = { fg = c.error, bold = true },
    VertSplit                   = { fg = c.dark_foreground },
    WinSeparator                = { fg = c.dark_foreground },
    Folded                      = { bg = "#F4F0E4" }, -- WIP: come up with better way to handle folded
    FoldColumn                  = { bg = opts.transparent and "NONE" or c.background, fg = c.muted },
    SignColumn                  = { bg = opts.transparent and "NONE" or c.background, fg = c.muted },
    SignColumnSB                = { bg = c.dark_background, fg = c.muted },
    Substitute                  = { bg = c.foreground, fg = c.background },
    LineNr                      = { fg = c.muted },
    CursorLineNr                = { fg = c.light_foreground, bold = true },
    LineNrAbove                 = { fg = c.muted },
    LineNrBelow                 = { fg = c.muted },
    MatchParen                  = { fg = c.light_foreground, bold = true },
    ModeMsg                     = { fg = c.foreground },
    MoreMsg                     = { fg = c.foreground },
    NonText                     = { fg = c.muted },
    Normal                      = { fg = c.foreground, bg = opts.transparent and "NONE" or c.background },
    NormalNC                    = { fg = c.foreground, bg = opts.transparent and "NONE" or opts.dim_inactive and c.dark_background or c.background },
    NormalSB                    = { fg = c.foreground, bg = opts.styles.sidebars == "transparent" and "NONE" or opts.styles.sidebars == "dark" and c.dark_background or c.background },
    NormalFloat                 = { fg = c.foreground, bg = opts.styles.floats == "transparent" and "NONE" or opts.styles.floats == "dark" and c.dark_background or c.background },
    FloatBorder                 = { fg = c.bright_foreground, bg = opts.styles.floats == "transparent" and "NONE" or opts.styles.floats == "dark" and c.dark_background or c.background },
    FloatTitle                  = { fg = c.bright_foreground, bg = opts.styles.floats == "transparent" and "NONE" or opts.styles.floats == "dark" and c.dark_background or c.background, bold = true },
    Pmenu                       = { bg = c.dark_background, fg = c.foreground },
    PmenuMatch                  = { bg = c.dark_background, fg = c.bright_foreground },
    PmenuSel                    = { bg = Util.blend_bg(c.darker_background, 0.8) },
    PmenuMatchSel               = { bg = Util.blend_bg(c.darker_background, 0.8), fg = c.bright_foreground },
    PmenuSbar                   = { bg = Util.blend_fg(c.dark_background, 0.95) },
    PmenuThumb                  = { bg = c.darker_background },
    Question                    = { fg = c.foreground },
    QuickFixLine                = { bg = c.selection, bold = true },
    Search                      = { bg = c.highlight, fg = c.foreground, bold = true },
    IncSearch                   = { bg = c.light_foreground, fg = c.background, bold = true },
    CurSearch                   = "IncSearch",
    SpecialKey                  = { fg = c.muted },
    SpellBad                    = { sp = c.error, undercurl = true },
    SpellCap                    = { sp = c.warning, undercurl = true },
    SpellLocal                  = { sp = c.info, undercurl = true },
    SpellRare                   = { sp = c.hint, undercurl = true },
    StatusLine                  = { fg = c.foreground, bg = c.background },
    StatusLineNC                = { fg = c.muted, bg = c.background },
    TabLine                     = { bg = c.dark_background, fg = c.foreground },
    TabLineFill                 = { bg = c.background },
    TabLineSel                  = { fg = c.background, bg = c.foreground },
    Title                       = { fg = c.foreground, bold = true },
    Visual                      = { bg = c.selection },
    VisualNOS                   = { bg = c.selection },
    WarningMsg                  = { fg = c.warning, bold = true },
    Whitespace                  = { fg = c.muted },
    WildMenu                    = { bg = c.selection },
    WinBar                      = { fg = c.foreground, bg = c.background },
    WinBarNC                    = { fg = c.dark_foreground, bg = c.background },
    MsgArea                     = { fg = c.dark_foreground, bg = c.background },
    Cmdline                     = { fg = c.foreground, bg = c.background },

    -- Syntax
    Constant                    = { fg = c.foreground },
    String                      = { fg = c.light_foreground },
    Character                   = { fg = c.light_foreground },
    Number                      = { fg = c.light_foreground },
    Boolean                     = { fg = c.light_foreground },
    Float                       = { fg = c.light_foreground },
    Identifier                  = { fg = c.bright_foreground, style = opts.styles.variables },
    Function                    = { fg = c.foreground, bold = true, style = opts.styles.functions },
    Statement                   = { fg = c.foreground, bold = true },
    Conditional                 = { fg = c.foreground },
    Repeat                      = { fg = c.foreground },
    Label                       = { fg = c.foreground },
    Operator                    = { fg = c.foreground },
    Keyword                     = { fg = c.foreground, bold = true, style = opts.styles.keywords },
    Exception                   = { fg = c.bright_foreground },
    PreProc                     = { fg = c.bright_foreground },
    Include                     = { fg = c.foreground },
    Define                      = { fg = c.foreground },
    Macro                       = { fg = c.bright_foreground },
    PreCondit                   = { fg = c.bright_foreground },
    Type                        = { fg = c.foreground, bold = true },
    StorageClass                = { fg = c.foreground },
    Structure                   = { fg = c.foreground },
    Typedef                     = { fg = c.foreground },
    Special                     = { fg = c.bright_foreground },
    SpecialChar                 = { fg = c.bright_foreground },
    Tag                         = { fg = c.foreground },
    Delimiter                   = { fg = c.foreground },
    SpecialComment              = { fg = c.muted, style = opts.styles.comments },
    Debug                       = { fg = c.foreground },
    Underlined                  = { underline = true },
    Ignore                      = { fg = c.muted },
    Error                       = { fg = c.error, bold = true },
    Todo                        = { bg = c.highlight, fg = c.foreground, bold = true },

    debugBreakpoint             = { bg = Util.blend_bg(c.info, 0.1), fg = c.info },
    debugPC                     = { bg = c.dark_background },
    dosIniLabel                 = "@property",
    helpCommand                 = { bg = c.darker_background, fg = c.foreground },
    htmlH1                      = { fg = c.bright_foreground, bold = true },
    htmlH2                      = { fg = c.foreground, bold = true },
    qfFileName                  = { fg = c.foreground },
    qfLineNr                    = { fg = c.muted },

    -- LSP
    LspReferenceText            = { bg = c.darker_background },
    LspReferenceRead            = { bg = c.darker_background },
    LspReferenceWrite           = { bg = c.darker_background },
    LspSignatureActiveParameter = { bg = Util.blend_bg(c.selection, 0.4), bold = true },
    LspCodeLens                 = { fg = c.muted },
    LspInlayHint                = { bg = Util.blend_bg(c.foreground, 0.1), fg = c.muted },
    LspInfoBorder               = { fg = c.bright_foreground, bg = c.dark_background },

    -- Diagnostics (only groups not in lsp.lua)
    DiagnosticUnnecessary       = { fg = c.lighter_background },

    -- Health
    healthError                 = { fg = c.error },
    healthSuccess                = { fg = c.bright_foreground },
    healthWarning                = { fg = c.warning },

    -- Git
    -- diff add/remove/change washes come from colors.diff (see colors/init.lua)
    -- so DiffAdd/DiffDelete/DiffText above, these, and codediff.nvim's groups
    -- all agree. Vim's stock syntax/diff.vim (included by vim-fugitive) uses
    -- exactly these group names for its diffAdded/diffRemoved/diffChanged
    -- syntax matches, so :Gdiff/:Git diff buffers and expanded :Git status
    -- hunks pick this up for free.
    diffAdded                   = { bg = c.diff.add, fg = c.bright_foreground },
    diffRemoved                 = { bg = c.diff.delete, fg = c.accent },
    diffChanged                 = { bg = c.diff.change, fg = c.light_foreground },
    diffOldFile                 = { fg = c.bright_foreground, bg = c.diff.delete },
    diffNewFile                 = { fg = c.bright_foreground, bg = c.diff.add },
    diffFile                    = { fg = c.foreground },
    diffLine                    = { fg = c.muted },
    diffIndexLine               = { fg = c.bright_foreground },
  }
end

return M
