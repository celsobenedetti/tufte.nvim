-- Tufte variant — creamy paper, off-black ink (Tufte-CSS canonical).
--
-- The most literal reading of the source note: text = #111111 exactly, the
-- ramp only faintly warmed. Closest to ink-on-paper, maximally restrained.
-- bg/fg are the paper and ink endpoints; tiers are the ramp between them,
-- faintest (T1) to darkest (T10).
--
--
local fg = "#111111"
---@type tufte.Palette
return {
	bg = "#fffcf0", -- creamy off-white paper
	bg2 = "#f7f3e6", -- slightly darker than bg, creamier
	fg = fg, -- off-black ink
	tiers = {
		"#e9e9e3", -- T1 faintest: gutter, chrome
		"#d4d4ce", -- T2
		"#bebeb9", -- T3
		"#a8a8a4", -- T4
		"#93938f", -- T5
		"#7d7d7a", -- T6
		"#686865", -- T7
		"#525250", -- T8
		"#3c3c3b", -- T9
		"#272726", -- T10 near-ink
	},
	accent = "#a00000", -- vermillion: errors, deletions only (rare, sparing)
	highlight = "#ffec99", -- yellow: search, selection, todo
	highlight_fg = fg, -- yellow: search, selection, todo

	-- Standard diff add/remove colors. Every diff-add/diff-remove highlight
	-- group in the colorscheme (native Diff*/diff*, gitsigns, codediff.nvim,
	-- vim-fugitive terminal patches) resolves to these four — see the diff
	-- convention comment in colors/init.lua.
	diff = {
		add = "#d0ffd0", -- line-level add background
		delete = "#ffd7d7", -- line-level delete background
		add_char = "#afffaf", -- char-level add emphasis (more saturated)
		delete_char = "#ffb6b6", -- char-level delete emphasis (more saturated)
	},

	-- Terminal colors for `:terminal` buffers (incl. vim-fugitive's `-p`
	-- patch prompts, which run through a real terminal, not Vim syntax
	-- highlighting). Real, distinguishable ANSI hues — NOT the editor's
	-- grayscale ramp: ANSI programs (git diff, ls --color, test runners,
	-- docker) rely on color 2 actually looking green, 3 actually looking
	-- yellow, etc. Declared per-palette (like `diff`), not palette-derived.
	-- Contrast-checked (WCAG) against this variant's bg, all >= 4.5:1.
	terminal = {
		black = "#fffcf0",
		black_bright = "#f7f3e6",
		red = "#a00000",
		red_bright = "#a00000",
		green = "#2f6f2f",
		green_bright = "#2f6f2f",
		yellow = "#8a6d1a",
		yellow_bright = "#8a6d1a",
		blue = "#345d8a",
		blue_bright = "#345d8a",
		magenta = "#8a3d6e",
		magenta_bright = "#8a3d6e",
		cyan = "#1f7a6c",
		cyan_bright = "#1f7a6c",
		white = "#111111",
		white_bright = "#111111",
	},
}
