local M = {}

---@class tufte.Config
---@field on_colors fun(colors: tufte.ColorScheme)
---@field on_highlights fun(highlights: tufte.Highlights, colors: tufte.ColorScheme)
M.defaults = {
	name = "tufte", -- The name of the colorscheme (useful for creating variants)
	variant = "coffee", -- Palette variant: "coffee" (warm ink) or "cannonical" (off-black)
	transparent = false, -- Enable this to disable setting the background color
	terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
	styles = {
		-- Style to be applied to different syntax groups
		-- Value is any valid attr-list value for `:help nvim_set_hl`
		comments = { italic = true },
		keywords = { italic = true },
		functions = {},
		variables = {},
		-- Background styles. Can be "dark", "transparent" or "normal"
		sidebars = "dark", -- style for sidebars, see below
		floats = "dark", -- style for floating windows
	},
	dim_inactive = false, -- dims inactive windows
	lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

	colors = {},

	--- You can override specific color groups to use other groups or a hex color
	--- function will be called with a tufte.ColorScheme table
	---@param colors tufte.ColorScheme
	---@diagnostic disable-next-line: unused-local
	on_colors = function(colors) end,

	--- You can override specific highlights to use other groups or a hex color
	--- function will be called with a Highlights and tufte.ColorScheme table
	---@param highlights tufte.Highlights
	---@param colors tufte.ColorScheme
	---@diagnostic disable-next-line: unused-local
	on_highlights = function(highlights, colors) end,

	cache = true, -- When set to true, the theme will be cached for better performance

	---@type table<string, boolean|{enabled:boolean}>
	plugins = {
		-- enable all plugins when not using lazy.nvim
		-- set to false to manually enable/disable plugins
		all = package.loaded.lazy == nil,
		-- uses your plugin manager to automatically enable needed plugins
		-- currently only lazy.nvim is supported
		auto = true,
	},
}

---@type tufte.Config
M.options = nil

---@param options? tufte.Config
function M.setup(options)
	M.options = vim.tbl_deep_extend("force", {}, M.defaults, options or {})
end

---@param opts? tufte.Config
function M.extend(opts)
	return opts and vim.tbl_deep_extend("force", {}, M.options, opts) or M.options
end

setmetatable(M, {
	__index = function(_, k)
		if k == "options" then
			return M.defaults
		end
	end,
})

return M
