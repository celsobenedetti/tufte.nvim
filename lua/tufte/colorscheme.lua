-- tufte colorscheme colors for use by external tools like lualine
-- This module provides access to the currently active color palette

local M = {}

local current = nil

--- Compute the palette from the current config. Only used as a fallback
--- when queried before the colorscheme has actually been loaded.
local function compute()
  local config = require("tufte.config")
  local colors_module = require("tufte.colors")
  local opts = config.extend()
  return colors_module.setup(opts)
end

-- Get the currently active color palette (the one actually applied to
-- highlight groups), falling back to a fresh computation if nothing has
-- loaded yet.
---@return tufte.ColorScheme
function M.get()
  return current or compute()
end

--- Called by tufte.theme right after it computes and applies a
--- colorscheme, so this module always reflects what's on screen instead
--- of recomputing (and potentially drifting from) it on every access.
---@param colors tufte.ColorScheme
function M.set(colors)
  current = colors
end

-- For compatibility with simple require() calls, e.g. `colors.fg`
setmetatable(M, {
  __index = function(_, key)
    return M.get()[key]
  end,
})

return M
