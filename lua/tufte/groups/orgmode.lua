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

---@param c ColorScheme
---@param opts tufte.Config
---@return tufte.Highlights
function M.get(c, opts)
  -- stylua: ignore
  return {
    -- Headlines (mirror markdown heading colors)
    ["@org.headline.level1"] = { fg = c.foreground, bold = true },
    ["@org.headline.level2"] = { fg = c.bright_foreground, bold = true },
    ["@org.headline.level3"] = { fg = c.light_foreground, bold = true },
    ["@org.headline.level4"] = { fg = c.dark_foreground, bold = true },
    ["@org.headline.level5"] = { fg = c.foreground, bold = true },
    ["@org.headline.level6"] = { fg = c.bright_foreground, bold = true },
    ["@org.headline.level7"] = { fg = c.bright_foreground, bold = true },
    ["@org.headline.level8"] = { fg = c.dark_foreground, bold = true },
    ["@org.leading_stars"]   = {}, -- cleared: stars fall back to the headline group instead of being hidden (orgmode's default is guifg=bg)

    -- Priorities
    ["@org.priority.highest"] = { fg = c.error },

    -- Tags and plan
    ["@org.tag"]  = { fg = c.bright_foreground },
    ["@org.plan"] = { fg = c.foreground },

    -- Timestamps
    ["@org.timestamp.active"]   = { fg = c.foreground, bold = true },
    ["@org.timestamp.inactive"] = { fg = c.muted },

    -- Lists / checkboxes
    ["@org.bullet"]                = { fg = c.dark_foreground },
    ["@org.checkbox"]              = { fg = c.foreground },
    ["@org.checkbox.halfchecked"]  = { fg = c.foreground },
    ["@org.checkbox.checked"]      = { fg = c.bright_foreground },

    -- Drawers / properties
    ["@org.properties"]      = { fg = c.bright_foreground },
    ["@org.properties.name"] = { fg = c.bright_foreground },
    ["@org.drawer"]          = { fg = c.bright_foreground },

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
    ["@org.code"]                    = { fg = c.light_foreground },
    ["@org.code.delimiter"]          = { fg = c.light_foreground },
    ["@org.verbatim"]                = { fg = c.light_foreground },
    ["@org.verbatim.delimiter"]      = { fg = c.light_foreground },
    ["@org.hyperlink"]               = { fg = c.dark_foreground, underline = true },
    ["@org.hyperlink.url"]           = { fg = c.dark_foreground, underline = true },
    ["@org.hyperlink.desc"]          = { fg = c.foreground },
    ["@org.latex"]                   = { fg = c.light_foreground },
    ["@org.latex_env"]               = { fg = c.bright_foreground },
    ["@org.footnote"]                = { fg = c.dark_foreground, underline = true },
    ["@org.footnote.reference"]      = { fg = c.dark_foreground, underline = true },

    -- Tables
    ["@org.table.delimiter"] = { fg = c.dark_foreground },
    ["@org.table.heading"]   = { fg = c.foreground, bold = true },

    -- Source block edit buffer
    ["@org.edit_src"] = { bg = c.selection },

    -- Keywords
    ["@org.keyword.todo"] = { fg = c.error, bold = true },
    ["@org.keyword.done"] = { fg = c.bright_foreground, bold = true },

    -- Agenda
    ["@org.agenda.deadline"]          = { fg = c.error },
    ["@org.agenda.deadline.upcoming"] = { fg = c.warning },
    ["@org.agenda.scheduled"]         = { fg = c.bright_foreground },
    ["@org.agenda.scheduled_past"]    = { fg = c.warning },
    ["@org.agenda.time_grid"]         = { fg = c.warning },
    ["@org.agenda.separator"]         = { fg = c.dark_foreground },
  }
end

return M
