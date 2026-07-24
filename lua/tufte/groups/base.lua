local Util = require("tufte.utils")

local M = {}

---@param c tufte.ColorScheme
---@param opts tufte.Config
---@return tufte.Highlights
function M.get(c, opts)
  -- stylua: ignore
  return {
    Comment                     = { fg = c.muted, style = opts.styles.comments }, -- any comment
    ColorColumn                 = { bg = c.darker_bg }, -- used for the columns set with 'colorcolumn'
    Conceal                     = { fg = c.muted }, -- placeholder characters substituted for concealed text
    Cursor                      = { fg = c.bg, bg = c.fg }, -- character under the cursor
    lCursor                     = { fg = c.bg, bg = c.fg },
    CursorIM                    = { fg = c.bg, bg = c.fg },
    CursorColumn                = { bg = c.darker_bg },
    CursorLine                  = { bg = c.dark_bg },
    Directory                   = { fg = c.fg },
    DiffAdd                     = { bg = c.diff.add },
    DiffChange                  = { bg = c.diff.change },
    DiffDelete                  = { bg = c.diff.delete },
    DiffText                    = { bg = c.diff.text },
    EndOfBuffer                 = { fg = c.bg },
    ErrorMsg                    = { fg = c.error, bold = true },
    VertSplit                   = { fg = c.dark_fg },
    WinSeparator                = { fg = c.dark_fg },
    Folded                      = { bg = c.lighter_bg }, 
    FoldColumn                  = { bg = opts.transparent and "NONE" or c.bg, fg = c.muted },
    SignColumn                  = { bg = opts.transparent and "NONE" or c.bg, fg = c.muted },
    SignColumnSB                = { bg = c.dark_bg, fg = c.muted },
    Substitute                  = { bg = c.fg, fg = c.bg },
    LineNr                      = { fg = c.muted },
    CursorLineNr                = { fg = c.light_fg, bold = true },
    LineNrAbove                 = { fg = c.muted },
    LineNrBelow                 = { fg = c.muted },
    MatchParen                  = { fg = c.light_fg, bold = true },
    ModeMsg                     = { fg = c.fg },
    MoreMsg                     = { fg = c.fg },
    NonText                     = { fg = c.muted },
    Normal                      = { fg = c.fg, bg = opts.transparent and "NONE" or c.bg },
    NormalNC                    = { fg = c.fg, bg = opts.transparent and "NONE" or opts.dim_inactive and c.dark_bg or c.bg },
    NormalSB                    = { fg = c.fg, bg = opts.styles.sidebars == "transparent" and "NONE" or opts.styles.sidebars == "dark" and c.dark_bg or c.bg },
    NormalFloat                 = { fg = c.fg, bg = opts.styles.floats == "transparent" and "NONE" or opts.styles.floats == "dark" and c.dark_bg or c.bg },
    FloatBorder                 = { fg = c.bright_fg, bg = opts.styles.floats == "transparent" and "NONE" or opts.styles.floats == "dark" and c.dark_bg or c.bg },
    FloatTitle                  = { fg = c.bright_fg, bg = opts.styles.floats == "transparent" and "NONE" or opts.styles.floats == "dark" and c.dark_bg or c.bg, bold = true },
    Pmenu                       = { bg = c.dark_bg, fg = c.fg },
    PmenuMatch                  = { bg = c.dark_bg, fg = c.bright_fg },
    PmenuSel                    = { bg = Util.blend_bg(c.darker_bg, 0.8) },
    PmenuMatchSel               = { bg = Util.blend_bg(c.darker_bg, 0.8), fg = c.bright_fg },
    PmenuSbar                   = { bg = Util.blend_fg(c.dark_bg, 0.95) },
    PmenuThumb                  = { bg = c.darker_bg },
    Question                    = { fg = c.fg },
    QuickFixLine                = { bg = c.selection, bold = true },
    Search                      = { bg = c.highlight, fg = c.fg, bold = true },
    IncSearch                   = { bg = c.light_fg, fg = c.bg, bold = true },
    CurSearch                   = "IncSearch",
    SpecialKey                  = { fg = c.muted },
    SpellBad                    = { sp = c.error, undercurl = true },
    SpellCap                    = { sp = c.warning, undercurl = true },
    SpellLocal                  = { sp = c.info, undercurl = true },
    SpellRare                   = { sp = c.hint, undercurl = true },
    StatusLine                  = { fg = c.bright_fg, bg = c.bg },
    StatusLineNC                = { fg = c.muted, bg = c.bg },
    TabLine                     = { bg = c.dark_bg, fg = c.fg },
    TabLineFill                 = { bg = c.bg },
    TabLineSel                  = { fg = c.bg, bg = c.fg },
    Title                       = { fg = c.fg, bold = true },
    Visual                      = { bg = c.selection },
    VisualNOS                   = { bg = c.selection },
    WarningMsg                  = { fg = c.warning, bold = true },
    Whitespace                  = { fg = c.muted },
    WildMenu                    = { bg = c.selection },
    WinBar                      = { fg = c.fg, bg = c.bg },
    WinBarNC                    = { fg = c.dark_fg, bg = c.bg },
    MsgArea                     = { fg = c.dark_fg, bg = c.bg },
    Cmdline                     = { fg = c.fg, bg = c.bg },

    -- Syntax
    Constant                    = { fg = c.fg },
    String                      = { fg = c.light_fg },
    Character                   = { fg = c.light_fg },
    Number                      = { fg = c.light_fg },
    Boolean                     = { fg = c.light_fg },
    Float                       = { fg = c.light_fg },
    Identifier                  = { fg = c.bright_fg, style = opts.styles.variables },
    Function                    = { fg = c.fg, bold = true, style = opts.styles.functions },
    Statement                   = { fg = c.fg, bold = true },
    Conditional                 = { fg = c.fg },
    Repeat                      = { fg = c.fg },
    Label                       = { fg = c.fg },
    Operator                    = { fg = c.fg },
    Keyword                     = { fg = c.fg, bold = true, style = opts.styles.keywords },
    Exception                   = { fg = c.bright_fg },
    PreProc                     = { fg = c.bright_fg },
    Include                     = { fg = c.fg },
    Define                      = { fg = c.fg },
    Macro                       = { fg = c.bright_fg },
    PreCondit                   = { fg = c.bright_fg },
    Type                        = { fg = c.fg, bold = true },
    StorageClass                = { fg = c.fg },
    Structure                   = { fg = c.fg },
    Typedef                     = { fg = c.fg },
    Special                     = { fg = c.bright_fg },
    SpecialChar                 = { fg = c.bright_fg },
    Tag                         = { fg = c.fg },
    Delimiter                   = { fg = c.fg },
    SpecialComment              = { fg = c.muted, style = opts.styles.comments },
    Debug                       = { fg = c.fg },
    Underlined                  = { underline = true },
    Ignore                      = { fg = c.muted },
    Error                       = { fg = c.error, bold = true },
    Todo                        = { bg = c.highlight, fg = c.fg, bold = true },

    debugBreakpoint             = { bg = Util.blend_bg(c.info, 0.1), fg = c.info },
    debugPC                     = { bg = c.dark_bg },
    dosIniLabel                 = "@property",
    helpCommand                 = { bg = c.darker_bg, fg = c.fg },
    htmlH1                      = { fg = c.bright_fg, bold = true },
    htmlH2                      = { fg = c.fg, bold = true },
    qfFileName                  = { fg = c.fg },
    qfLineNr                    = { fg = c.muted },

    -- LSP
    LspReferenceText            = { bg = c.darker_bg },
    LspReferenceRead            = { bg = c.darker_bg },
    LspReferenceWrite           = { bg = c.darker_bg },
    LspSignatureActiveParameter = { bg = Util.blend_bg(c.selection, 0.4), bold = true },
    LspCodeLens                 = { fg = c.muted },
    LspInlayHint                = { bg = Util.blend_bg(c.fg, 0.1), fg = c.muted },
    LspInfoBorder               = { fg = c.bright_fg, bg = c.dark_bg },

    -- Diagnostics (only groups not in lsp.lua)
    DiagnosticUnnecessary       = { fg = c.lighter_bg },

    -- Health
    healthError                 = { fg = c.error },
    healthSuccess                = { fg = c.bright_fg },
    healthWarning                = { fg = c.warning },

    -- Git
    -- diff add/remove/change washes come from colors.diff (see colors/init.lua)
    -- so DiffAdd/DiffDelete/DiffText above, these, and codediff.nvim's groups
    -- all agree. Vim's stock syntax/diff.vim (included by vim-fugitive) uses
    -- exactly these group names for its diffAdded/diffRemoved/diffChanged
    -- syntax matches, so :Gdiff/:Git diff buffers and expanded :Git status
    -- hunks pick this up for free.
    diffAdded                   = { bg = c.diff.add, fg = c.bright_fg },
    diffRemoved                 = { bg = c.diff.delete, fg = c.accent },
    diffChanged                 = { bg = c.diff.change, fg = c.light_fg },
    diffOldFile                 = { fg = c.bright_fg, bg = c.diff.delete },
    diffNewFile                 = { fg = c.bright_fg, bg = c.diff.add },
    diffFile                    = { fg = c.fg },
    diffLine                    = { fg = c.muted },
    diffIndexLine               = { fg = c.bright_fg },
  }
end

return M
