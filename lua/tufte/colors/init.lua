local Util = require("tufte.utils")

local M = {}

---@class tufte.Palette
---@field bg string
---@field tiers string[] -- 7 entries, T1 faint chrome -> T7 focus
---@field accent string  -- vermillion, used sparingly
---@field highlight string -- yellow highlight

---@param variant string
---@return tufte.Palette
local function load_palette(variant)
  local ok, palette = pcall(require, "tufte.palettes." .. variant)
  if not ok or type(palette) ~= "table" then
    vim.notify(
      ("tufte.nvim: unknown variant %q, falling back to 'coffee'"):format(tostring(variant)),
      vim.log.levels.WARN
    )
    palette = require("tufte.palettes.coffee")
  end
  return palette
end

--- Build the flat color table the highlight groups consume.
--- Every syntax name maps onto a luminance tier; only errors/deletions get the
--- vermillion accent, only search/selection/todo get the yellow highlight.
---@param p tufte.Palette
local function build_palette(p)
  local t = p.tiers
  local bg = p.bg

  return {
    bg = bg,
    bg_dark = Util.blend(t[7], 0.03, bg),
    bg_dark1 = Util.blend(t[7], 0.03, bg),
    bg_highlight = Util.blend(t[7], 0.07, bg),

    -- Luminance tiers mapped onto the syntax names the groups already use.
    blue = t[6],  -- statements, directories, titles
    blue0 = p.highlight, -- selection / search background (yellow)
    blue1 = t[5], -- borders, pmenu match
    blue2 = t[4], -- info diagnostic
    blue5 = t[3], -- operators, punctuation delimiters
    blue6 = t[4], -- string.regexp
    blue7 = Util.blend(t[7], 0.09, bg), -- diff change bg (light)

    comment = t[2],
    cyan = t[4], -- preprocessor, macros, special

    dark3 = Util.blend(t[2], 0.45, t[1]), -- nontext, ignored
    dark5 = Util.blend(t[2], 0.7, t[1]),  -- concealed text

    fg = t[7],
    fg_dark = t[6],
    fg_gutter = t[1],

    green = t[4],  -- strings, characters
    green1 = t[5], -- properties, variable.member
    green2 = t[5], -- git add

    magenta = t[5],  -- constructors
    magenta2 = t[5], -- variables, identifiers

    orange = t[4], -- numbers, booleans
    purple = t[7], -- keywords, constants, conditionals

    red = t[6],       -- tags (a tier, NOT the accent)
    red1 = p.accent,  -- error, git delete -> vermillion (rare)

    teal = t[3], -- hints, markup links
    terminal_black = t[1],

    yellow = t[6], -- types, labels, parameters, warnings

    git = {},

    special_char = t[5],

    accent = p.accent,
    highlight = p.highlight,
  }
end

---@param opts? tufte.Config
function M.setup(opts)
  opts = require("tufte.config").extend(opts)

  local palette = load_palette(opts.variant or "coffee")

  ---@class ColorScheme
  local colors = build_palette(palette)

  if opts.colors and next(opts.colors) then
    colors = vim.tbl_deep_extend("force", colors, opts.colors)
  end

  Util.bg = colors.bg
  Util.fg = colors.fg

  colors.none = "NONE"

  -- Git colors derived from the palette. Deletion uses the vermillion accent.
  colors.git.add = colors.green2
  colors.git.delete = colors.red1
  colors.git.change = colors.orange

  colors.diff = {
    add = Util.blend_bg(colors.green2, 0.25),
    delete = Util.blend_bg(colors.red1, 0.25),
    change = Util.blend_bg(colors.blue7, 0.15),
    text = colors.blue7,
  }

  colors.git.ignore = colors.dark3
  colors.black = Util.blend_bg(colors.bg, 0.8, colors.bg)
  colors.border_highlight = Util.blend_bg(colors.blue1, 0.8)
  colors.border = Util.blend_bg(colors.fg, 0.15)

  -- Popups and statusline get a subtle background
  colors.bg_popup = colors.bg_dark
  colors.bg_statusline = colors.bg_dark

  colors.bg_sidebar = opts.styles.sidebars == "transparent" and colors.none
    or opts.styles.sidebars == "dark" and colors.bg_dark
    or colors.bg

  colors.bg_float = opts.styles.floats == "transparent" and colors.none
    or opts.styles.floats == "dark" and colors.bg_dark
    or colors.bg

  colors.bg_visual = Util.blend_bg(colors.blue0, 0.4) -- soft yellow selection
  colors.bg_search = colors.blue0 -- yellow search
  colors.fg_sidebar = colors.fg
  colors.fg_float = colors.fg

  colors.error = colors.red1 -- vermillion
  colors.todo = colors.blue
  colors.warning = colors.yellow
  colors.info = colors.blue2
  colors.hint = colors.teal

  -- Subtle blended backgrounds
  colors.subtle_bg = Util.blend_bg(colors.fg, 0.06)
  colors.cursorline_bg = Util.blend_bg(colors.fg, 0.05)
  colors.selection_bg = Util.blend_bg(colors.fg, 0.12)
  colors.float_bg = Util.blend_bg(colors.fg, 0.04)

  colors.rainbow = {
    colors.blue,
    colors.yellow,
    colors.green,
    colors.teal,
    colors.magenta,
    colors.purple,
    colors.orange,
    colors.red,
  }

  -- Terminal colors: monochrome tiers, with the one accent on red.
  colors.terminal = {
    black = colors.bg,
    black_bright = colors.terminal_black,
    red = colors.accent,
    red_bright = colors.accent,
    green = colors.green,
    green_bright = colors.green,
    yellow = colors.green1,
    yellow_bright = colors.green1,
    blue = colors.blue,
    blue_bright = colors.blue,
    magenta = colors.magenta,
    magenta_bright = colors.magenta,
    cyan = colors.teal,
    cyan_bright = colors.teal,
    white = colors.fg,
    white_bright = colors.fg,
  }

  opts.on_colors(colors)

  return colors, opts
end

return M
