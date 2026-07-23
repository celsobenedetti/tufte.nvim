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
    ["@org.headline.level1"] = { fg = c.red, bold = true },
    ["@org.headline.level2"] = { fg = c.orange, bold = true },
    ["@org.headline.level3"] = { fg = c.yellow, bold = true },
    ["@org.headline.level4"] = { fg = c.green, bold = true },
    ["@org.headline.level5"] = { fg = c.blue, bold = true },
    ["@org.headline.level6"] = { fg = c.purple, bold = true },
    ["@org.headline.level7"] = { fg = c.cyan, bold = true },
    ["@org.headline.level8"] = { fg = c.teal, bold = true },
    ["@org.leading_stars"]   = {}, -- cleared: stars fall back to the headline group instead of being hidden (orgmode's default is guifg=bg)

    -- Priorities
    ["@org.priority.highest"] = { fg = c.error },

    -- Tags and plan
    ["@org.tag"]  = { fg = c.green1 },
    ["@org.plan"] = { fg = c.purple },

    -- Timestamps
    ["@org.timestamp.active"]   = { fg = c.purple, bold = true },
    ["@org.timestamp.inactive"] = { fg = c.comment },

    -- Lists / checkboxes
    ["@org.bullet"]                = { fg = c.blue5 },
    ["@org.checkbox"]              = { fg = c.blue },
    ["@org.checkbox.halfchecked"]  = { fg = c.yellow },
    ["@org.checkbox.checked"]      = { fg = c.green1 },

    -- Drawers / properties
    ["@org.properties"]      = { fg = c.green1 },
    ["@org.properties.name"] = { fg = c.green1 },
    ["@org.drawer"]          = { fg = c.green1 },

    -- Comments / directives / blocks
    ["@org.comment"]   = { fg = c.comment, style = opts.styles.comments },
    ["@org.directive"] = { fg = c.comment, style = opts.styles.comments },
    ["@org.block"]     = { fg = c.comment, style = opts.styles.comments },

    -- Markup
    ["@org.bold"]                    = { bold = true },
    ["@org.bold.delimiter"]          = { bold = true },
    ["@org.italic"]                  = { italic = true },
    ["@org.italic.delimiter"]        = { italic = true },
    ["@org.strikethrough"]           = { strikethrough = true },
    ["@org.strikethrough.delimiter"] = { strikethrough = true },
    ["@org.underline"]               = { underline = true },
    ["@org.underline.delimiter"]     = { underline = true },
    ["@org.code"]                    = { fg = c.green },
    ["@org.code.delimiter"]          = { fg = c.green },
    ["@org.verbatim"]                = { fg = c.green },
    ["@org.verbatim.delimiter"]      = { fg = c.green },
    ["@org.hyperlink"]               = { fg = c.teal, underline = true },
    ["@org.hyperlink.url"]           = { fg = c.teal, underline = true },
    ["@org.hyperlink.desc"]          = { fg = c.blue },
    ["@org.latex"]                   = { fg = c.orange },
    ["@org.latex_env"]               = { fg = c.cyan },
    ["@org.footnote"]                = { fg = c.teal, underline = true },
    ["@org.footnote.reference"]      = { fg = c.teal, underline = true },

    -- Tables
    ["@org.table.delimiter"] = { fg = c.blue5 },
    ["@org.table.heading"]   = { fg = c.blue, bold = true },

    -- Source block edit buffer
    ["@org.edit_src"] = { bg = c.bg_visual },

    -- Keywords
    ["@org.keyword.todo"] = { fg = c.error, bold = true },
    ["@org.keyword.done"] = { fg = c.green1, bold = true },

    -- Agenda
    ["@org.agenda.deadline"]          = { fg = c.error },
    ["@org.agenda.deadline.upcoming"] = { fg = c.warning },
    ["@org.agenda.scheduled"]         = { fg = c.green1 },
    ["@org.agenda.scheduled_past"]    = { fg = c.warning },
    ["@org.agenda.time_grid"]         = { fg = c.warning },
    ["@org.agenda.separator"]         = { fg = c.border },
  }
end

return M
