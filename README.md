# tufte.nvim

Tufte Design with a sip of caffeine; compliant to her Grand Cenobite's will.

Inspired by the discipline of [white.nvim], bringing it off white and a bit of
inspiration.

A disciplined, minimal colorscheme for Neovim — paper, coffee, and a rare drop
of vermillion. Inspired by Edward Tufte's book design: a creamy off-white
`#fffff8` page, coffee-dark ink, and a 7-tier luminance hierarchy that builds
structure through darkness alone. Important code is dark; everything else fades.
Color is spent only where it carries meaning — vermillion `#a00000` for errors
and deletions, yellow `#ffec99` for search and selection.

## Variants

Two palettes, same architecture — choose the ink:

```
coffee  — warm "black coffee" ink (#2d1c0b), a whisper of warmth in every tier
tufte   — off-black ink (#111111), Tufte-CSS canonical, closest to ink-on-paper
```

```
       coffee                              tufte
T1  #d1cdc4  gutter, line numbers      T1  #cfcfca
T2  #857b6f  comments                  T2  #7c7c79
T3  #6c6052  operators, brackets       T3  #5d5d5b
T4  #5d5042  strings, numbers          T4  #4a4a48
T5  #514333  variables, properties     T5  #3c3c3b
T6  #403020  keywords, types           T6  #292928
T7  #2d1c0b  functions, foreground     T7  #111111
```

Both sit on `#fffff8` paper, accented by vermillion `#a00000` and highlighted
with `#ffec99`.

Bold is reserved for structural elements: functions, keywords, types. Comments
are italic. Your eyes land on what matters.

## Install

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "tufte.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tufte").setup({ variant = "coffee" })
    vim.cmd.colorscheme("tufte")
  end,
}
```

## Configuration

```lua
require("tufte").setup({
  variant = "coffee", -- "coffee" (warm ink) or "tufte" (off-black)
  transparent = false,
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    sidebars = "dark",
    floats = "dark",
  },
  dim_inactive = false,

  -- Override palette colors
  on_colors = function(colors) end,

  -- Override specific highlight groups
  on_highlights = function(hl, colors) end,
})
```

## Plugin Support

Works out of the box with LazyVim and these plugins:

blink.cmp, bufferline.nvim, conform.nvim, diffview.nvim, flash.nvim,
fidget.nvim, gitsigns.nvim, indent-blankline.nvim, lazy.nvim, mason.nvim,
mini.nvim, neo-tree.nvim, noice.nvim, nvim-dap, nvim-lint, nvim-tree.lua,
render-markdown.nvim, snacks.nvim, telescope.nvim, todo-comments.nvim,
trouble.nvim, which-key.nvim

Plus full treesitter and LSP semantic token support.

## Lualine

The lualine theme loads automatically when you set the colorscheme.

## License

MIT — a fork of [white.nvim](https://github.com/bjarneo/white.nvim).
