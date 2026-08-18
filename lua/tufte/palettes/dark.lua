-- Dark variant — inverted canonical (Tufte-CSS off-black, paper <-> ink swapped).
--
-- A strict luminance-inversion of `cannonical.lua` (not `coffee.lua`): the
-- canonical off-black ink (#111111) becomes the paper, the canonical cream
-- paper becomes the ink. Tiers are the per-channel inverse of the canonical
-- ramp, rounded to clean neutral grays — the cream's faint warmth would
-- otherwise invert into an equally faint, meaningless cool tint, so the dark
-- ramp is a pure neutral gray (canonical's restraint, inverted). bg/fg are
-- the paper and ink endpoints; tiers are the ramp between them, faintest
-- (T1, near bg) to darkest (T10, near fg). accent/highlight/diff keep their
-- hue but are re-picked (not inverted) for legibility against a dark
-- background: the canonical highlight/diff backgrounds are near-white pastel
-- washes meant to sit *under* dark ink, which would look wrong (and
-- under-contrast light ink) on a dark bg, so this variant uses dark, muted
-- washes instead.
--
-- tiers: T1 faint chrome -> T10 near-ink. Contrast vs bg #111111 (WCAG):
--   T1 1.06  T2 1.37  T3 1.88  T4 2.65  T5 3.65  T6 4.98  T7 6.55
--   T8 8.41  T9 10.71  T10 13.25
--
---@type tufte.Palette
return {
	bg = "#111111", -- canonical's off-black ink, promoted to paper
	bg2 = "#1b1b1b", -- slightly lighter than bg: floats, folded, tabline
	fg = "#fffcf0", -- canonical's cream paper, promoted to ink
	tiers = {
		"#181818", -- T1
		"#2d2d2d", -- T2
		"#424242", -- T3
		"#585858", -- T4
		"#6d6d6d", -- T5
		"#838383", -- T6
		"#989898", -- T7
		"#adadad", -- T8
		"#c3c3c3", -- T9
		"#d8d8d8", -- T10
	},
	accent = "#f57f82", -- vermillion: errors, deletions only (rare, sparing)
	highlight = "#b3a56f", -- dark gold: search, selection, todo (a wash, not a pastel — dark ink washes don't invert to a light bg)

	-- Standard diff add/remove colors. Dark, muted washes (not canonical's
	-- pastels) so the theme's light ink stays legible drawn on top — see the
	-- diff convention comment in colors/init.lua.
	diff = {
		add = "#005f00", -- line-level add background
		delete = "#5f0000", -- line-level delete background
		add_char = "#008b00", -- char-level add emphasis (more saturated)
		delete_char = "#a91011", -- char-level delete emphasis (more saturated)
		add_contrast = "#afffaf", -- color for "git added" with contrast
	},

	-- Terminal colors for `:terminal` buffers. Same rationale as the light
	-- variants (see cannonical.lua) — real ANSI hues, declared per-palette —
	-- but re-picked here, like accent/diff, for legibility against the dark
	-- bg: the canonical mid-dark hues would drop below WCAG AA, so the dark
	-- terminal uses brighter, saturated hues. black/black_bright are the
	-- palette's paper shades (#111111 / #1b1b1b); red is the accent. The
	-- fixed hues (green..cyan) are the shared canonical hexes, unchanged.
	terminal = {
		black = "#111111",
		black_bright = "#1b1b1b",
		red = "#f57f82",
		red_bright = "#f57f82",
		green = "#6fbf6f",
		green_bright = "#6fbf6f",
		yellow = "#c9a25a",
		yellow_bright = "#c9a25a",
		blue = "#5f8fc7",
		blue_bright = "#5f8fc7",
		magenta = "#c77ba0",
		magenta_bright = "#c77ba0",
		cyan = "#5fb8a8",
		cyan_bright = "#5fb8a8",
		white = "#fffcf0",
		white_bright = "#fffcf0",
	},
}
