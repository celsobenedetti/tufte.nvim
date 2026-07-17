-- tufte colorscheme for Neovim
-- Maintainer: Bjarne Øverli
-- License: MIT

local config = require("tufte.config")

local M = {}

---@param opts? tufte.Config
function M.load(opts)
	opts = require("tufte.config").extend(opts)
	return require("tufte.theme").setup(opts)
end

M.setup = config.setup

return M
