-- Tufte variant — creamy paper, off-black ink (Tufte-CSS canonical).
--
-- The most literal reading of the source note: text = #111111 exactly, the
-- ramp only faintly warmed. Closest to ink-on-paper, maximally restrained.
-- bg/fg are the paper and ink endpoints; tiers are the ramp between them,
-- faintest (T1) to darkest (T10).
--
---@type tufte.Palette
return {
	bg = "#fffcf0", -- creamy off-white paper
	fg = "#111111", -- off-black ink
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
}
