-- Markdown plugin support for tufte colorscheme
local Util = require("tufte.utils")

local M = {}

---@param c ColorScheme
---@param opts tufte.Config
---@return tufte.Highlights
function M.get(c, opts)
  -- stylua: ignore
  return {
    -- Headings
    ["@markup.heading.1.markdown"] = { fg = c.foreground, bold = true },
    ["@markup.heading.2.markdown"] = { fg = c.bright_foreground, bold = true },
    ["@markup.heading.3.markdown"] = { fg = c.light_foreground, bold = true },
    ["@markup.heading.4.markdown"] = { fg = c.dark_foreground, bold = true },
    ["@markup.heading.5.markdown"] = { fg = c.foreground, bold = true },
    ["@markup.heading.6.markdown"] = { fg = c.bright_foreground, bold = true },

    -- Text styles
    ["@markup.strong"]       = { bold = true },
    ["@markup.italic"]       = { italic = true },
    ["@markup.strikethrough"] = { strikethrough = true },
    ["@markup.underline"]    = { underline = true },

    -- Links and references
    ["@markup.link"]         = { fg = c.foreground, underline = true },
    ["@markup.link.url"]     = { fg = c.bright_foreground, underline = true },
    ["@markup.link.label"]   = { fg = c.foreground },

    -- Code blocks
    ["@markup.raw"]          = { fg = c.light_foreground },
    ["@markup.raw.block"]    = { fg = c.foreground },

    -- Lists
    ["@markup.list"]         = { fg = c.bright_foreground },
    ["@markup.list.checked"] = { fg = c.light_foreground },
    ["@markup.list.unchecked"] = { fg = c.foreground },

    -- Quotes
    ["@markup.quote"]        = { fg = c.muted, italic = true },

    -- Math
    ["@markup.math"]         = { fg = c.light_foreground },
  }
end

return M
