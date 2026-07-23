-- Dark variant — inverted canonical (Tufte-CSS off-black, paper <-> ink swapped).
--
-- Same neutral, restrained ramp as `cannonical.lua`, luminance-inverted for a
-- dark `background`: the canonical off-black ink (#111111) becomes the paper,
-- the canonical cream paper becomes the ink. Tiers are the per-channel
-- inverse of the canonical ramp (then rounded to clean neutral grays, since
-- the cream's faint warmth would otherwise invert into an equally faint,
-- meaningless cool tint). accent/secondary/highlight/diff keep their hue but
-- are re-picked (not inverted) for legibility against a dark background: the
-- canonical highlight/diff backgrounds are near-white pastel washes meant to
-- sit *under* dark ink, which would look wrong (and under-contrast light ink)
-- on a dark bg, so this variant uses dark, muted washes instead.
--
-- tiers: T1 faint chrome -> T7 focus. Contrast vs bg (WCAG):
--   T1 1.47  T2 5.13  T3 7.61  T4 9.48  T5 11.03  T6 13.37  T7 16.75
--   secondary 10.41 (bright teal, same family as canonical's deep teal)
--
---@type tufte.Palette
return {
	bg = "#2d1c0b", -- near-black paper (canonical's ink, promoted to bg)
	tiers = {
		"#303030", -- T1 faint chrome: gutter, line numbers
		"#838383", -- T2 comments
		"#a2a2a2", -- T3 operators, punctuation, hints
		"#b5b5b5", -- T4 strings, numbers, secondary data
		"#c3c3c3", -- T5 variables, properties, constructors
		"#d6d6d6", -- T6 types, statements, titles
		"#fffcf0", -- T7 functions, keywords, main foreground (canonical's paper, promoted to ink)
	},
	accent = "#D50000", -- vermillion: errors, deletions only (rare, sparing)
	highlight = "#ffec99", -- dark gold: search, selection, todo (a wash, not a pastel — dark ink washes don't invert to a light bg)
	secondary = "#fffcf0", -- bright teal: Special, function calls

	-- Standard diff add/remove colors. Dark, muted washes (not canonical's
	-- pastels) so the theme's light ink stays legible drawn on top — see the
	-- diff convention comment in colors/init.lua.
	diff = {
		add = "#3E4843", -- line-level add background
		delete = "#45383B", -- line-level delete background
		add_char = "#56645D", -- char-level add emphasis (more saturated)
		delete_char = "#45383B", -- char-level delete emphasis (more saturated)
	},
}
