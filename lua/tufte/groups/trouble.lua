-- Trouble plugin support for tufte colorscheme
local Util = require("tufte.utils")

local M = {}

---@param c ColorScheme
---@param opts tufte.Config
---@return tufte.Highlights
function M.get(c, opts)
  -- stylua: ignore
  return {
    TroubleText        = { fg = c.dark_foreground },
    TroubleCount       = { fg = c.bright_foreground, bg = c.darker_background },
    TroubleNormal      = { fg = c.foreground, bg = c.dark_background },
    TroubleTextInformation = { fg = c.info },
    TroubleSignWarning = { fg = c.warning },
    TroubleSignInformation = { fg = c.info },
    TroubleSignHint    = { fg = c.hint },
    TroubleSignError   = { fg = c.error },
    TroubleSignOther   = { fg = c.foreground },
    TroubleIndent      = { fg = c.muted },
    TroubleLocation    = { fg = c.muted },
    TroubleFoldIcon    = { fg = c.muted },
    TroubleFile        = { fg = c.foreground },
    TroubleCode        = { fg = c.muted },
  }
end

return M
