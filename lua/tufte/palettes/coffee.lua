-- Coffee variant — creamy paper, warm "black coffee" ink.
--
-- A whisper of warmth over the canonical Tufte ramp: ten steps from cream to
-- lightened-coffee, with the mid-tones nudged warm so grays read as coffee,
-- not gray. bg/fg are the paper and ink endpoints; tiers are the ramp
-- between them, faintest (T1) to darkest (T10).
--
---@type tufte.Palette
return {
	bg = "#f5eddf", -- creamy off-white paper
	bg2 = "#E5DCCE", -- slightly darker than bg, creamier
	fg = "#2d1c0b", -- black coffee ink
	tiers = {
		"#E5DCCE",
		"#D4CBBC",
		"#C4B9AB",
		"#B3A89A",
		"#A39788",
		"#928677",
		"#827565",
		"#716454",
		"#615243",
		"#504131",
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
		add_contrast = "#00b100", -- color for "git added" with contrast
	},

	-- Terminal colors for `:terminal` buffers (incl. vim-fugitive's `-p`
	-- patch prompts, which run through a real terminal, not Vim syntax
	-- highlighting). Real, distinguishable ANSI hues — NOT the editor's
	-- grayscale ramp: ANSI programs (git diff, ls --color, test runners,
	-- docker) rely on color 2 actually looking green, 3 actually looking
	-- yellow, etc. Declared per-palette (like `diff`), not palette-derived.
	-- Contrast-checked (WCAG) against this variant's bg, all >= 4.5:1.
	terminal = {
		black = "#f5eddf",
		black_bright = "#E7E0D3",
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
		white = "#2d1c0b",
		white_bright = "#2d1c0b",
	},
}
