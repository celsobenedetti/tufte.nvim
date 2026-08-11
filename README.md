# tufte.nvim

A minimal light colorscheme inspired by the discipline of
[white.nvim](https://github.com/bjarneo/white.nvim.git) - bringing it off-white
with a vermillion ![#a00000](https://placehold.co/15x15/a00000/a00000) `#a00000`
accent toward Tufte Design.

## principles

1. **clarity and readibility**: optimize for reading and comprehending
2. **Unified diff colors**: all diffs match [delta](https://github.com/dandavison/delta) default color pallete (dark and light).


## installation

```lua
{
	"celsobenedetti/tufte.nvim",
	priority = 1000,
    opts = {
        -- "coffee" is the default
        -- "cannonical" for the classic Tufte-CSS palette
        -- "dark" for the dark mode
        variant = "coffee",
    }
},
```

## references

- [Tufte CSS](https://edwardtufte.github.io/tufte-css/)
