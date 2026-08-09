-- Dark variant — inverted canonical (Tufte-CSS off-black, paper <-> ink swapped).
--
-- Same neutral, restrained ramp as `cannonical.lua`, luminance-inverted for a
-- dark `background`: the canonical off-black ink (#111111) becomes the paper,
-- the canonical cream paper becomes the ink. Tiers are the per-channel
-- inverse of the canonical ramp (then rounded to clean neutral grays, since
-- the cream's faint warmth would otherwise invert into an equally faint,
-- meaningless cool tint). bg/fg are the paper and ink endpoints; tiers are
-- the ramp between them, faintest (T1, near bg) to darkest (T10, near fg).
-- accent/highlight/diff keep their hue but are re-picked (not inverted) for
-- legibility against a dark background: the canonical highlight/diff
-- backgrounds are near-white pastel washes meant to sit *under* dark ink,
-- which would look wrong (and under-contrast light ink) on a dark bg, so this
-- variant uses dark, muted washes instead.
--
-- tiers: T1 faint chrome -> T10 near-ink. Contrast vs bg (WCAG):
--   T1 1.24  T2 1.80  T3 2.68  T4 3.95  T5 6.41  T6 7.99  T7 9.29
--   T8 11.27  T9 12.72  T10 14.25
--
---@type tufte.Palette
return {
	bg = "#2d1c0b", -- near-black paper (canonical's ink, promoted to bg)
	bg2 = "#241609", -- slightly darker than bg
	fg = "#fffcf0", -- canonical's paper, promoted to ink
	tiers = {
		"#241609", -- T1
		"#534535", -- T2
		"#665949", -- T3
		"#796d5e", -- T4
		"#8c8273", -- T5
		"#a09688", -- T6
		"#b3ab9d", -- T7
		"#c6bfb2", -- T8
		"#d9d3c6", -- T9
		"#ece8db", -- T10
	},
	accent = "#f57f82", -- vermillion: errors, deletions only (rare, sparing)
	highlight = "#ffec99", -- dark gold: search, selection, todo (a wash, not a pastel — dark ink washes don't invert to a light bg)

	-- Standard diff add/remove colors. Dark, muted washes (not canonical's
	-- pastels) so the theme's light ink stays legible drawn on top — see the
	-- diff convention comment in colors/init.lua.
	diff = {
		add = "#002800", -- line-level add background
		delete = "#3f0000", -- line-level delete background
		add_char = "#006000", -- char-level add emphasis (more saturated)
		delete_char = "#901011", -- char-level delete emphasis (more saturated)
	},
}
