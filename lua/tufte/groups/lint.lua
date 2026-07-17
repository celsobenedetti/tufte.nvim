-- Lint plugin support for tufte colorscheme
local Util = require("tufte.utils")

local M = {}

---@type tufte.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    LintError   = { fg = c.error },
    LintWarning = { fg = c.warning },
    LintInfo    = { fg = c.info },
    LintHint    = { fg = c.hint },
  }
end

return M
