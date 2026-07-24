-- Coffee variant — creamy paper, warm "black coffee" ink.
--
-- A whisper of warmth over the canonical Tufte ramp: ten steps from cream to
-- lightened-coffee, with the mid-tones nudged warm so grays read as coffee,
-- not gray. bg/fg are the paper and ink endpoints; tiers are the ramp
-- between them, faintest (T1) to darkest (T10).
--
---@type tufte.Palette
return {
	bg = "#fffcf0", -- creamy off-white paper
	fg = "#2d1c0b", -- black coffee ink
	tiers = {
		"#ece8db", -- T1 faintest: gutter, chrome
		"#d9d3c6", -- T2
		"#c6bfb2", -- T3
		"#b3ab9d", -- T4
		"#a09688", -- T5
		"#8c8273", -- T6
		"#796d5e", -- T7
		"#665949", -- T8
		"#534535", -- T9
		"#403020", -- T10 near-ink
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
