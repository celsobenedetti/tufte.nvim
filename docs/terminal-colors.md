# How tufte.nvim colors terminal buffers

## Summary

- tufte colors `:terminal` buffers through the **ANSI 16-color palette**
  (`g:terminal_color_0`..`15`), set by `theme.lua:M.terminal()` and gated by
  the `terminal_colors` config option (default `true`).
- The palette is mostly fixed hexes chosen for WCAG contrast on the light paper
  background; only `black`/`black_bright`/`red`/`red_bright`/`white`/`white_bright`
  are palette-derived.
- **Confirmed bug:** ANSI slots 2 and 10 ("green") are assigned the *blue* hex
  (`#345d8a`), so green never appears in terminals; the `colors.terminal.green`
  value (`#2f6f2f`) is dead code. Introduced silently by the rename refactor
  commit `2631cf5` ("refactor: ColorScheme extends Palette", 2026-07-24).
- tufte defines **no** `TermNormal`/`TermCursor`/`TermCursorNC`. Terminal default
  text/background falls through to the `Normal` group (paper/ink); the cursor
  keeps the built-in default `TermCursor` (reverse video).
- vim-fugitive's `-p` patch terminals get a special bg-only extmark wash
  (`lua/tufte/groups/git.lua`), priority 200, reusing `DiffAdd`/`DiffDelete`.
- The lualine theme's `terminal` mode is **broken**: it references the pre-refactor
  color names (`light_foreground`, `dark_background`, ...) that no longer exist,
  so every color is `nil`.

---

## 1. ANSI 16-color palette (`g:terminal_color_0`..`15`)

### Assignment code

`M.terminal(colors)` in `lua/tufte/theme.lua:31-58` writes the globals:

- dark: 0 = `black`, 8 = `black_bright` (`theme.lua:33-34`)
- light: 7 = `white`, 15 = `white_bright` (`theme.lua:37-38`)
- colors: 1/9 red, **2/10 blue (bug, see below)**, 3/11 yellow, 4/12 blue,
  5/13 magenta, 6/14 cyan (`theme.lua:41-57`)

### The `colors.terminal` table

Built in `lua/tufte/colors/init.lua:133-150`; the `---@field` doc declaring its
keys is at `lua/tufte/colors/init.lua:34`. The design comment
(`colors/init.lua:121-132`) explains: the editor's syntax palette is
intentionally desaturated into grayscale luminance steps, but "ANSI programs
(git diff, ls --color, test runners, docker) rely on color 2 actually looking
green, 3 actually looking yellow", so the terminal colors are **fixed hex,
not palette-derived**, and were contrast-checked (WCAG) against bg `#fffcf0`,
all ≥ 4.5:1 (`colors/init.lua:126-132`).

Only three pairs are derived from the active palette; the rest are literal:
`black` = `colors.bg` (paper), `black_bright` = `colors.lighter_bg` (i.e. the
palette's `bg2`, `colors/init.lua:65,134-135`), `red`/`red_bright` =
`colors.accent` (vermillion, `colors/init.lua:136-137`), and
`white`/`white_bright` = `colors.fg` (ink, `colors/init.lua:148-149`).

### The `*_bright` names

By ANSI convention indices 0-7 are the "normal intensity" set and 8-15 the
"bright" set; tufte's `*_bright` keys map to 8-15. There is **no actual
brightness difference** in the palette: every `*_bright` value equals its
non-bright counterpart (`red_bright` = `red`, `green_bright` = `green`,
`yellow_bright` = `yellow`, etc.). The one exception is `black_bright` (ANSI 8),
which is `bg2` — the palette's "near-bg" chrome shade. For the light variants
(`cannonical.lua:11`, `coffee.lua:11`) `bg2` is slightly *darker* than `bg`, but
for the dark variant (`dark.lua:24`) it is slightly *lighter* than `bg`, so
"bright black" is a slightly darker paper tone on light, and a slightly lighter
paper tone on dark — never a gray. Note also `colors.lighter_bg` is named
"lighter" but is slightly darker than `bg` in the light palettes and slightly
lighter than `bg` in the dark palette.

### Resolved values per palette

Verified by running `require("tufte.colors").setup({variant=v})` in a clean
headless nvim (no user config). Fixed hues are identical across palettes;
derived pairs differ.

| ANSI | conventional name | tufte key | coffee | cannonical | dark | source |
|------|-------------------|-----------|--------|-----------|------|--------|
| 0 | black | `black` | `#f5eddf` | `#fffcf0` | `#111111` | = `colors.bg` |
| 1 | red | `red` | `#a00000` | `#a00000` | `#f57f82` | = `colors.accent` |
| 2 | green | `blue` ⚠ | `#345d8a` | `#345d8a` | `#345d8a` | bug: should be `green` |
| 3 | yellow | `yellow` | `#8a6d1a` | `#8a6d1a` | `#8a6d1a` | fixed |
| 4 | blue | `blue` | `#345d8a` | `#345d8a` | `#345d8a` | fixed |
| 5 | magenta | `magenta` | `#8a3d6e` | `#8a3d6e` | `#8a3d6e` | fixed |
| 6 | cyan | `cyan` | `#1f7a6c` | `#1f7a6c` | `#1f7a6c` | fixed |
| 7 | white | `white` | `#2d1c0b` | `#111111` | `#fffcf0` | = `colors.fg` |
| 8 | bright black | `black_bright` | `#E7E0D3` | `#f7f3e6` | `#1b1b1b` | = `colors.lighter_bg` (= `bg2`) |
| 9 | bright red | `red_bright` | `#a00000` | `#a00000` | `#f57f82` | = `accent` |
| 10 | bright green | `blue_bright` ⚠ | `#345d8a` | `#345d8a` | `#345d8a` | bug: should be `green_bright` |
| 11 | bright yellow | `yellow_bright` | `#8a6d1a` | `#8a6d1a` | `#8a6d1a` | fixed |
| 12 | bright blue | `blue_bright` | `#345d8a` | `#345d8a` | `#345d8a` | fixed |
| 13 | bright magenta | `magenta_bright` | `#8a3d6e` | `#8a3d6e` | `#8a3d6e` | fixed |
| 14 | bright cyan | `cyan_bright` | `#1f7a6c` | `#1f7a6c` | `#1f7a6c` | fixed |
| 15 | bright white | `white_bright` | `#2d1c0b` | `#111111` | `#fffcf0` | = `colors.fg` |

Empirically confirmed after `require("tufte").load()` with defaults (coffee):
`terminal_color_0=#f5eddf`, `terminal_color_2=#345d8a`,
`terminal_color_4=#345d8a`, `terminal_color_10=#345d8a`,
`terminal_color_12=#345d8a`, `terminal_color_7=#2d1c0b`, etc.

### The green → blue mapping is a bug

- `lua/tufte/theme.lua:44-45` assigns ANSI 2/10 from `colors.terminal.blue`,
  and `theme.lua:50-51` assigns ANSI 4/12 from the *same* value, so ANSI green
  and ANSI blue are identical (`#345d8a`).
- `colors.terminal.green`/`green_bright` (`#2f6f2f`) are still declared
  (`colors/init.lua:138-139`) and documented in the type (`colors/init.lua:34`)
  but are **never read** — dead code.
- The design comment explicitly states color 2 must "actually look green"
  (`colors/init.lua:129`), so the current mapping contradicts the intent.
- `git blame` on `theme.lua:44-45` shows both lines were introduced by commit
  `2631cf5` ("refactor: ColorScheme extends Palette", 2026-07-24, author Celso
  Benedetti). The commit is otherwise a pure rename of `ColorScheme` fields
  (`background`→`bg`, etc.), with no comment or message about green. Before it,
  ANSI 2/10 were `colors.terminal.green`/`green_bright` (see the `18f7d22`→
  `2631cf5` diff). This is a silent regression introduced during the rename —
  nothing in the surrounding code or commit message suggests it was deliberate.

### Caveat: the fixed hues were only checked against the light paper

The WCAG claim in `colors/init.lua:132` ("all >= 4.5:1") is against `#fffcf0`
(cannonical paper). Recomputed: green 5.95:1, yellow 4.77:1, blue 6.64:1,
magenta 6.87:1, cyan 5.03:1 — all pass on the light variants. Against the dark
variant's `bg` `#111111` they drop to green 3.09:1, yellow 3.85:1, blue 2.77:1,
magenta 2.67:1, cyan 3.65:1 — below WCAG AA. Unlike `accent`/`highlight`/`diff`,
which `dark.lua` explicitly re-picks for a dark background
(`dark.lua:10-15,38-39`), the fixed terminal hues are left unchanged for dark.

---

## 2. The `terminal_colors` config option

- Declared at `lua/tufte/config.lua:10`: `terminal_colors = true` — "Configure
  the colors used when opening a `:terminal` in Neovim". Default **`true`**.
- Read in `lua/tufte/theme.lua:23-25`: `if opts.terminal_colors then
  M.terminal(colors) end`, i.e. it gates only the `vim.g.terminal_color_*`
  assignment. It runs after the highlight groups are applied (`theme.lua:18-21`).
- When disabled, tufte leaves all `g:terminal_color_*` unset; Neovim then uses
  its built-in default ANSI palette (libvterm's defaults, "the VTerm instance"
  source in `terminal.c:630-654`).
- Note: `opts.colors` is deep-merged into the colorscheme at
  `colors/init.lua:90-92`, but that happens *before* `colors.terminal` is
  assigned at `colors/init.lua:133`, so a `colors.terminal.*` entry in
  `opts.colors` would be overwritten. The intended override hook is the
  `on_colors` callback (`config.lua:31`), which runs after the table is built
  (`colors/init.lua:152`).

---

## 3. Highlight groups for terminal buffers

tufte defines **no** `TermNormal`, `TermCursor`, or `TermCursorNC` group —
a repo-wide search for `Term` finds only `SnacksDashboardTerminal`
(`lua/tufte/groups/snacks.lua:47`) and the fugitive termopen code in
`lua/tufte/groups/git.lua`. None of the three groups is set by `nvim_set_hl`
anywhere in `lua/`.

Consequences (verified in a clean headless nvim after `require("tufte").load()`):

- **Background and default text** of a `:terminal` buffer come from the `Normal`
  group (`lua/tufte/groups/base.lua:41`, `Normal = { fg = c.fg, bg = ... }` —
  `c.bg` unless `transparent`). This is because terminal cells that carry the
  *default* color (no ANSI fg/bg escape) are rendered with no color attribute,
  which the screen layer draws as the buffer's `Normal` (see section 6).
  So a terminal shows the paper background and ink text (coffee: `#f5eddf` /
  `#2d1c0b`).
- **Cursor**: tufte never touches `TermCursor`, and `hi clear`
  (`theme.lua:11-13`) resets it to the built-in default, which is `reverse`
  (`runtime/colors/vim.lua:43`, `hi('TermCursor', { reverse = true, ... })`).
  Verified live: after tufte loads, `:hi TermCursor` reports `cterm=reverse
  gui=reverse`.
- `TermCursorNC` no longer exists in Neovim ≥ 0.11 — it is "removed and no
  longer supported" (`runtime/doc/news-0.11.txt:83`, `:367`; `deprecated.txt:85`).
- Non-text chrome around a terminal window (statusline, separators) uses tufte's
  normal groups: `StatusLine`/`StatusLineNC` (`base.lua:63-64`), `VertSplit`/
  `WinSeparator` (`base.lua:26-27`).
- `TermCursor` is the only terminal highlight group documented by Neovim
  (`runtime/doc/syntax.txt:5314-5315`: "TermCursor Cursor in a focused terminal";
  `terminal.txt:105` lists `hl-TermCursor` under Configuration). There is no
  `TermNormal` group in this Neovim version's docs.

---

## 4. Fugitive terminal special-casing (`lua/tufte/groups/git.lua`)

vim-fugitive's `-p`/`--patch` (and `-i`/`--interactive`) prompts run through a
real `:terminal` (termopen), not Vim syntax highlighting, so the theme's diff
washes (`DiffAdd`/`DiffDelete`, `base.lua:20,22`) never apply to them. Git's own
patch output in that terminal is plain ANSI *foreground* color only (no
background) (`git.lua:5-10`). tufte recreates the line-level wash by layering a
**background-only extmark** over the `+`/`-` lines — the same bg-only technique
codediff.nvim uses (comment `git.lua:11-14`; cf. codediff's own bg-only groups
and `highlight_priority = 200`, `lua/tufte/groups/codediff.lua:29-33,44-50`).

Detection (`git.lua:26-28`):
- `is_fugitive_term(bufnr)` = `buftype == "terminal"` **and** `b:git_dir ~= nil`.
- Why not `b:term_title`? Neovim only records the *resolved executable* (e.g.
  `/usr/bin/git`), not fugitive's argv, so "was this `-p`?" isn't recoverable
  from the buffer (`git.lua:17-19`). `b:git_dir` is set by `FugitiveDetect()` on
  every terminal fugitive spawns, and all those render unified-diff `+`/`-`
  lines worth washing (`git.lua:20-25`).
- Why `vim.schedule`? `b:git_dir` is set by a command chained *after* `termopen()`
  in the same `:execute`, so it isn't present when the `TermOpen` autocmd fires
  synchronously; the callback defers to the next tick (`git.lua:23-25,74-78`).

Mechanics:
- Namespace `tufte_fugitive_patch_diff` (`git.lua:15`).
- `classify(line)` (`git.lua:32-43`): skips `+++ ` / `--- ` headers, maps a
  leading `+` → `DiffAdd`, `-` → `DiffDelete`, else `nil`.
- `highlight_range(bufnr, firstline, lastline)` (`git.lua:48-66`) clears the
  namespace, scans lines, and sets one extmark per diff line:
  `nvim_buf_set_extmark(bufnr, ns, row, 0, { end_row = row+1, hl_group = hl,
  hl_eol = true, priority = 200 })` (`git.lua:58-63`).
- `hl_group` is the **same** `DiffAdd`/`DiffDelete` group used for editor diff
  buffers, which tufte defines background-only (`base.lua:20,22`), so the ANSI
  foreground of the cell shows through underneath ("bg-only highlight at an
  elevated priority so the terminal's ANSI foreground color for that cell is
  preserved underneath", `git.lua:13-14`).
- Registered on a `TermOpen` autocmd in augroup `TufteFugitivePatchDiff`
  (`git.lua:68-89`); after the initial wash it attaches `nvim_buf_attach`
  `on_lines` to re-wash new output as it streams in (`git.lua:79-85`).
- The whole module is only loaded when the `vim-fugitive` plugin group is
  active (`lua/tufte/groups/init.lua:23` maps `vim-fugitive` → `git`; the group
  runs when `plugins.all` or the per-plugin flag is set, `init.lua:71-77`);
  `M.get` triggers the autocmd setup at `git.lua:95`.

---

## 5. Lualine terminal theme (`lua/lualine/themes/tufte.lua`)

`M.terminal` (`lua/lualine/themes/tufte.lua:47-51`) is lualine's theme section
for *terminal-mode* statuslines:

```lua
M.terminal = {
  a = { bg = colors.light_foreground, fg = colors.background, gui = "bold" },
  b = { bg = colors.darker_background, fg = colors.light_foreground },
  c = { bg = colors.dark_background, fg = colors.dark_foreground },
}
```

- It is purely a statusline theme; it has **no functional link to the ANSI
  palette** from section 1. Its colors come from `require("tufte.colorscheme")`
  (`tufte.lua:13`; module at `lua/tufte/colorscheme.lua`, a metatable that
  resolves keys to the current `tufte.colors.setup()` result, `colorscheme.lua:7-20`).
- **It is currently broken.** The theme still uses the pre-refactor color names
  (`light_foreground`, `dark_foreground`, `bright_foreground`, `background`,
  `dark_background`, `darker_background`) that the rename refactor
  (`2631cf5`, 2026-07-24) replaced with `light_fg`, `dark_fg`, `bright_fg`,
  `bg`, `dark_bg`, `darker_bg`. Those old keys no longer exist, so every lookup
  returns `nil`. Verified live: `terminal.a.bg = nil`, `terminal.a.fg = nil`,
  and also `normal.a.bg = nil` (i.e. *every* mode, not just terminal, is nil).
  `git log -- lua/lualine/themes/tufte.lua` shows it was last touched in
  `9305b89` ("refactor: 7 -> 10 tiers"), before the rename refactor, and was
  never updated.
- Intended design (header comment `tufte.lua:3-9`): the "a" pill of each mode
  is a distinct grayscale step; terminal mode would be `light_foreground` (the
  "medium, light" step).

---

## 6. Underlying Neovim mechanism (for citation)

Primary sources: local runtime docs (identical to the official master docs at
https://neovim.io/doc/ and
https://github.com/neovim/neovim/blob/master/runtime/doc/terminal.txt) and the
official C source `src/nvim/terminal.c` (master).

**ANSI palette.**
`runtime/doc/terminal.txt:128-135` (section "TERMINAL COLORS"):
> The `{g,b}:terminal_color_x` variables control the terminal color palette,
> where `x` is the color index between 0 and 15 inclusive. The variables are
> read during |TermOpen|. ... Only works for RGB UIs (see 'termguicolors'); for
> 256-color terminals the color index is just forwarded.

The C code confirms the read order and that only indices 0-15 are read:
`terminal.c:630-654` — "Try to get the color from: b:terminal_color_{NUM},
g:terminal_color_{NUM}, the VTerm instance", iterating `i` in `0..15`
(`terminal_color_%d`, `vterm_state_set_palette_color`).

**Highlight groups layer on top.**
`terminal.txt:137-138`: "Editor highlighting (|syntax-highlighting|,
|highlight-groups|, etc.) has higher precedence: it is applied after terminal
colors are resolved." The terminal buffer is not syntax-highlighted, so in
practice the layer on top is the extmark/`nvim_set_hl` highlighting that plugins
(and tufte's fugitive wash) add.

**Default (uncolored) cells → Normal.**
In `terminal.c:1461-1466`, cells using the default color set
`fg_default`/`bg_default` and `vt_fg`/`vt_bg = -1`, i.e. no color attribute is
emitted; `terminal.c:1491-1503` only builds an attribute when `hl_attrs ||
!fg_default || !bg_default`. Uncolored terminal text therefore renders with the
buffer's `Normal` highlight — this is why the terminal background in tufte is
the `Normal` background (paper), as described in section 3.

**Cursor highlight.**
The only terminal highlight group documented is `TermCursor`
(`syntax.txt:5314-5315`, "Cursor in a focused terminal"). `TermCursorNC` was
removed in Neovim 0.11 (`news-0.11.txt:83`, `:367`; `deprecated.txt:85`). The
built-in default colorscheme sets `TermCursor` to `reverse`
(`runtime/colors/vim.lua:43`).

**`NVIM_TERM` / `TERM`.**
The Neovim terminal docs do not discuss an `NVIM_TERM` environment variable in
connection with terminal colors; `terminal.txt` contains no such mention. (Per
instructions: not speculating further.)

---

## Sources

tufte.nvim (this repo, `/home/celso/.local/share/nvim/lazy/tufte.nvim`):
- `lua/tufte/theme.lua:23-25,31-58` — gate + `M.terminal` ANSI assignment
- `lua/tufte/config.lua:10` — `terminal_colors` default
- `lua/tufte/colors/init.lua:34,65,121-150` — terminal palette + design comment
- `lua/tufte/palettes/cannonical.lua:10-12,25`, `coffee.lua:10-12,25`,
  `dark.lua:23-25,38` — bg/bg2/fg/accent per variant
- `lua/tufte/groups/base.lua:20-23,26-27,41,63-64` — DiffAdd/DiffDelete, Normal,
  StatusLine, WinSeparator
- `lua/tufte/groups/git.lua:5-28,32-43,48-66,68-89,95` — fugitive terminal wash
- `lua/tufte/groups/codediff.lua:29-33,44-50` — priority-200 bg-only technique
- `lua/tufte/groups/init.lua:7-30,71-77` — plugin group dispatch
- `lua/lualine/themes/tufte.lua:3-9,13,47-51` — lualine terminal theme (stale)
- `lua/tufte/colorscheme.lua:7-20` — colorscheme accessor
- git: commit `2631cf5` (introduced green→blue regression); `18f7d22` (original
  correct mapping)

Neovim (installed runtime `/usr/local/share/nvim/runtime`, v0.12.1-dev; identical
to official master docs):
- `runtime/doc/terminal.txt:126-138` — `g:terminal_color_*` palette mechanism,
  precedence of editor highlighting
- `runtime/doc/syntax.txt:5314-5315` — `hl-TermCursor`
- `runtime/doc/news-0.11.txt:83,367` and `runtime/doc/deprecated.txt:85` —
  `TermCursorNC` removed
- `runtime/colors/vim.lua:43` — built-in default `TermCursor` = reverse

Official Neovim source:
- https://github.com/neovim/neovim/blob/master/src/nvim/terminal.c
  (`terminal.c:630-654`, `terminal.c:1461-1503`)
- https://github.com/neovim/neovim/blob/master/runtime/doc/terminal.txt
