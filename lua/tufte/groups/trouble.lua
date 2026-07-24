-- Trouble plugin support for tufte colorscheme
local Util = require("tufte.utils")

local M = {}

---@param c tufte.ColorScheme
---@param opts tufte.Config
---@return tufte.Highlights
function M.get(c, opts)
  -- stylua: ignore
  return {
    TroubleText        = { fg = c.dark_fg },
    TroubleCount       = { fg = c.bright_fg, bg = c.darker_bg },
    TroubleNormal      = { fg = c.fg, bg = c.dark_bg },
    TroubleTextInformation = { fg = c.info },
    TroubleSignWarning = { fg = c.warning },
    TroubleSignInformation = { fg = c.info },
    TroubleSignHint    = { fg = c.hint },
    TroubleSignError   = { fg = c.error },
    TroubleSignOther   = { fg = c.fg },
    TroubleIndent      = { fg = c.muted },
    TroubleLocation    = { fg = c.muted },
    TroubleFoldIcon    = { fg = c.muted },
    TroubleFile        = { fg = c.fg },
    TroubleCode        = { fg = c.muted },
  }
end

return M
