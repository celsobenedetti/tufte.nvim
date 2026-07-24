-- nvim-orgmode support for tufte colorscheme
--
-- Covers every highlight group orgmode defines in
-- orgmode/colors/highlights.lua:
--   * @org.headline.level1..8 (linked to Title/Constant/... by default)
--   * markup, list/checkbox, drawer, timestamp and table groups
--   * agenda + todo-keyword groups, which orgmode otherwise derives
--     dynamically from Error/WarningMsg/DiffAdd via parse_hl_fg_color().
-- Defining them here (non-default) makes tufte win over orgmode's
-- `hi default` fallbacks so the palette stays consistent.
local M = {}

---@param c tufte.ColorScheme
---@param opts tufte.Config
---@return tufte.Highlights
function M.get(c, opts)
  -- stylua: ignore
  return {
    -- Headlines (mirror markdown heading colors)
    ["@org.headline.level1"] = { fg = c.fg, bold = true },
    ["@org.headline.level2"] = { fg = c.bright_fg, bold = true },
    ["@org.headline.level3"] = { fg = c.light_fg, bold = true },
    ["@org.headline.level4"] = { fg = c.dark_fg, bold = true },
    ["@org.headline.level5"] = { fg = c.fg, bold = true },
    ["@org.headline.level6"] = { fg = c.bright_fg, bold = true },
    ["@org.headline.level7"] = { fg = c.bright_fg, bold = true },
    ["@org.headline.level8"] = { fg = c.dark_fg, bold = true },
    ["@org.leading_stars"]   = {}, -- cleared: stars fall back to the headline group instead of being hidden (orgmode's default is guifg=bg)

    -- Priorities
    ["@org.priority.highest"] = { fg = c.error },

    -- Tags and plan
    ["@org.tag"]  = { fg = c.bright_fg },
    ["@org.plan"] = { fg = c.fg },

    -- Timestamps
    ["@org.timestamp.active"]   = { fg = c.fg, bold = true },
    ["@org.timestamp.inactive"] = { fg = c.muted },

    -- Lists / checkboxes
    ["@org.bullet"]                = { fg = c.dark_fg },
    ["@org.checkbox"]              = { fg = c.fg },
    ["@org.checkbox.halfchecked"]  = { fg = c.fg },
    ["@org.checkbox.checked"]      = { fg = c.bright_fg },

    -- Drawers / properties
    ["@org.properties"]      = { fg = c.bright_fg },
    ["@org.properties.name"] = { fg = c.bright_fg },
    ["@org.drawer"]          = { fg = c.bright_fg },

    -- Comments / directives / blocks
    ["@org.comment"]   = { fg = c.muted, style = opts.styles.comments },
    ["@org.directive"] = { fg = c.muted, style = opts.styles.comments },
    ["@org.block"]     = { fg = c.muted, style = opts.styles.comments },

    -- Markup
    ["@org.bold"]                    = { bold = true },
    ["@org.bold.delimiter"]          = { bold = true },
    ["@org.italic"]                  = { italic = true },
    ["@org.italic.delimiter"]        = { italic = true },
    ["@org.strikethrough"]           = { strikethrough = true },
    ["@org.strikethrough.delimiter"] = { strikethrough = true },
    ["@org.underline"]               = { underline = true },
    ["@org.underline.delimiter"]     = { underline = true },
    ["@org.code"]                    = { fg = c.light_fg },
    ["@org.code.delimiter"]          = { fg = c.light_fg },
    ["@org.verbatim"]                = { fg = c.light_fg },
    ["@org.verbatim.delimiter"]      = { fg = c.light_fg },
    ["@org.hyperlink"]               = { fg = c.dark_fg, underline = true },
    ["@org.hyperlink.url"]           = { fg = c.dark_fg, underline = true },
    ["@org.hyperlink.desc"]          = { fg = c.fg },
    ["@org.latex"]                   = { fg = c.light_fg },
    ["@org.latex_env"]               = { fg = c.bright_fg },
    ["@org.footnote"]                = { fg = c.dark_fg, underline = true },
    ["@org.footnote.reference"]      = { fg = c.dark_fg, underline = true },

    -- Tables
    ["@org.table.delimiter"] = { fg = c.dark_fg },
    ["@org.table.heading"]   = { fg = c.fg, bold = true },

    -- Source block edit buffer
    ["@org.edit_src"] = { bg = c.selection },

    -- Keywords
    ["@org.keyword.todo"] = { fg = c.error, bold = true },
    ["@org.keyword.done"] = { fg = c.bright_fg, bold = true },

    -- Agenda
    ["@org.agenda.deadline"]          = { fg = c.error },
    ["@org.agenda.deadline.upcoming"] = { fg = c.warning },
    ["@org.agenda.scheduled"]         = { fg = c.bright_fg },
    ["@org.agenda.scheduled_past"]    = { fg = c.warning },
    ["@org.agenda.time_grid"]         = { fg = c.warning },
    ["@org.agenda.separator"]         = { fg = c.dark_fg },
  }
end

return M
