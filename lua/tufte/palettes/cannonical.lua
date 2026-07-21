-- Tufte variant — creamy paper, off-black ink (Tufte-CSS canonical).
--
-- The most literal reading of the source note: text = #111111 exactly, the
-- ramp only faintly warmed. Closest to ink-on-paper, maximally restrained.
-- Values generated in the prototype (prototype/tufte-colors.html, variant C).
--
-- tiers: T1 faint chrome -> T7 focus. Contrast vs bg (WCAG):
--   T1 1.56  T2 4.17  T3 6.57  T4 8.84  T5 11.00  T6 14.50  T7 18.80
--   secondary 8.46 (deep teal, neutral — no warm cast to match the ramp)
--
---@type tufte.Palette
return {
	bg = "#fffcf0", -- creamy off-white paper
	tiers = {
		"#cfcfca", -- T1 faint chrome: gutter, line numbers
		"#7c7c79", -- T2 comments
		"#5d5d5b", -- T3 operators, punctuation, hints
		"#4a4a48", -- T4 strings, numbers, secondary data
		"#3c3c3b", -- T5 variables, properties, constructors
		"#292928", -- T6 types, statements, titles
		"#111111", -- T7 functions, keywords, main foreground (off-black)
	},
	accent = "#a00000", -- vermillion: errors, deletions only (rare, sparing)
	highlight = "#ffec99", -- yellow: search, selection, todo
	secondary = "#055656", -- deep teal: Special, function calls

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
