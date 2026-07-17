-- Coffee variant — creamy paper, warm "black coffee" ink.
--
-- A whisper of warmth over the canonical Tufte ramp: the seven tiers are a
-- cream -> lightened-coffee (#2e1c0a) blend with the mid-tones nudged warm,
-- so grays read as coffee, not gray. Values generated in the prototype
-- (prototype/tufte-colors.html, variant B) and pasted here verbatim.
--
-- tiers: T1 faint chrome -> T7 focus. Contrast vs bg (WCAG):
--   T1 1.58  T2 4.13  T3 6.09  T4 7.77  T5 9.50  T6 12.58  T7 16.31
--
---@type tufte.Palette
return {
  bg = "#fffff8", -- creamy off-white paper
  tiers = {
    "#d1cdc4", -- T1 faint chrome: gutter, line numbers
    "#857b6f", -- T2 comments
    "#6c6052", -- T3 operators, punctuation, hints
    "#5d5042", -- T4 strings, numbers, secondary data
    "#514333", -- T5 variables, properties, constructors
    "#403020", -- T6 types, statements, titles
    "#2d1c0b", -- T7 functions, keywords, main foreground (black coffee)
  },
  accent = "#a00000", -- vermillion: errors, deletions only (rare, sparing)
  highlight = "#ffec99", -- yellow: search, selection, todo
}
