-- render-markdown.nvim support for tufte colorscheme
--
-- All groups render-markdown references are defined with `default = true`
-- links by the plugin itself (@see :h render-markdown-colors); defining them
-- here with explicit tufte colors overrides those defaults so the rendered
-- document stays on the paper ramp.

local M = {}

---@param c tufte.ColorScheme
---@param opts tufte.Config
---@return tufte.Highlights
function M.get(c, opts)
  -- stylua: ignore
  return {
    -- Headings (icon + sign foregrounds). Mirrors the heading ramp used by
    -- groups/markdown.lua so icons agree with the treesitter heading text.
    RenderMarkdownH1 = { fg = c.fg, bold = true },
    RenderMarkdownH2 = { fg = c.bright_fg, bold = true },
    RenderMarkdownH3 = { fg = c.light_fg, bold = true },
    RenderMarkdownH4 = { fg = c.dark_fg, bold = true },
    RenderMarkdownH5 = { fg = c.fg, bold = true },
    RenderMarkdownH6 = { fg = c.bright_fg, bold = true },

    -- Heading background bands. A single faint cream wash instead of the
    -- plugin default (DiffText/DiffAdd/DiffChange/DiffDelete/Visual/...):
    -- the diff pastels and selection yellow are reserved for their own
    -- meanings, and hierarchy is carried by the icon/text colors, so title
    -- bands stay gentle and Tufte-minimal.
    RenderMarkdownH1Bg = { bg = c.bg },
    RenderMarkdownH2Bg = { bg = c.bg },
    RenderMarkdownH3Bg = { bg = c.bg },
    RenderMarkdownH4Bg = { bg = c.bg },
    RenderMarkdownH5Bg = { bg = c.bg },
    RenderMarkdownH6Bg = { bg = c.bg },

    -- Code blocks. Body band uses the same step as ColorColumn (the plugin
    -- default link) but pinned so user ColorColumn overrides can't move it.
    RenderMarkdownCode         = { bg = c.bg2, fg = c.fg },
    RenderMarkdownCodeInfo     = { bg = c.bg2, fg = c.muted, italic = true },
    RenderMarkdownCodeBorder   = { bg = c.bg2, fg = c.light_fg },
    RenderMarkdownCodeFallback = { bg = c.bg2, fg = c.fg },

    -- Inline code: bright ink on a lighter wash than block code, matching
    -- tufte's @markup.raw.markdown_inline.
    RenderMarkdownCodeInline    = { fg = c.bright_fg, bg = c.bg2 },
    RenderMarkdownInlineHighlight = { fg = c.bright_fg, bg = c.bg2 },

    -- Block quotes and their level markers.
    RenderMarkdownQuote  = { fg = c.muted, italic = true },
    RenderMarkdownQuote1 = { fg = c.muted, italic = true },
    RenderMarkdownQuote2 = { fg = c.muted, italic = true },
    RenderMarkdownQuote3 = { fg = c.muted, italic = true },
    RenderMarkdownQuote4 = { fg = c.muted, italic = true },
    RenderMarkdownQuote5 = { fg = c.muted, italic = true },
    RenderMarkdownQuote6 = { fg = c.muted, italic = true },

    -- List markers and thematic breaks.
    RenderMarkdownBullet  = { fg = c.bright_fg },
    RenderMarkdownDash    = { fg = c.muted },
    RenderMarkdownIndent  = { fg = c.muted },

    -- Sign column markers and math.
    RenderMarkdownSign   = { fg = c.muted },
    RenderMarkdownMath   = { fg = c.light_fg },

    -- Inline HTML comments.
    RenderMarkdownHtmlComment = { fg = c.muted, style = opts.styles.comments },

    -- Links and wiki links.
    RenderMarkdownLink      = { fg = c.accent },
    RenderMarkdownLinkTitle = { fg = c.accent, underline = true },
    RenderMarkdownWikiLink  = "RenderMarkdownLink",

    -- Checkboxes and custom todo items.
    RenderMarkdownUnchecked = { fg = c.dark_fg },
    RenderMarkdownChecked   = { fg = c.bright_fg },
    RenderMarkdownTodo      = { fg = c.light_fg },

    -- Pipe tables.
    RenderMarkdownTableHead = { fg = c.fg, bold = true },
    RenderMarkdownTableRow  = { fg = c.fg },

    -- Callouts. Defined explicitly because tufte has no DiagnosticOk group
    -- and the other diagnostics map to the ramp fields below.
    RenderMarkdownSuccess = { fg = c.bright_fg },
    RenderMarkdownInfo    = { fg = c.info },
    RenderMarkdownHint    = { fg = c.hint },
    RenderMarkdownWarn    = { fg = c.warning },
    RenderMarkdownError   = { fg = c.error },
  }
end

return M
