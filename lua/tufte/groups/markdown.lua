-- Markdown plugin support for tufte colorscheme
local Util = require("tufte.utils")

local M = {}

---@param c tufte.ColorScheme
---@param opts tufte.Config
---@return tufte.Highlights
function M.get(c, opts)
  -- stylua: ignore
  return {
    -- Headings
    ["@markup.heading.1.markdown"] = { fg = c.fg, bold = true },
    ["@markup.heading.2.markdown"] = { fg = c.bright_fg, bold = true },
    ["@markup.heading.3.markdown"] = { fg = c.light_fg, bold = true },
    ["@markup.heading.4.markdown"] = { fg = c.dark_fg, bold = true },
    ["@markup.heading.5.markdown"] = { fg = c.fg, bold = true },
    ["@markup.heading.6.markdown"] = { fg = c.bright_fg, bold = true },

    -- Text styles
    ["@markup.strong"]       = { bold = true },
    ["@markup.italic"]       = { italic = true },
    ["@markup.strikethrough"] = { strikethrough = true },
    ["@markup.underline"]    = { underline = true },

    -- Links and references
    ["@markup.link"]         = { fg = c.fg, underline = true },
    ["@markup.link.url"]     = { fg = c.bright_fg, underline = true },
    ["@markup.link.label"]   = { fg = c.fg },

    -- Code blocks
    ["@markup.raw"]          = { fg = c.light_fg },
    ["@markup.raw.block"]    = { fg = c.fg },

    -- Lists
    ["@markup.list"]         = { fg = c.bright_fg },
    ["@markup.list.checked"] = { fg = c.light_fg },
    ["@markup.list.unchecked"] = { fg = c.fg },

    -- Quotes
    ["@markup.quote"]        = { fg = c.muted, italic = true },

    -- Math
    ["@markup.math"]         = { fg = c.light_fg },
  }
end

return M
