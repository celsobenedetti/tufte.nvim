vim.api.nvim_create_autocmd('OptionSet', {
  pattern = 'background',
  callback = function()
    local bg = vim.o.background
    local variant = bg == 'dark' and 'dark' or 'coffee'

    -- Update the variant in config so the next load picks the right palette
    local config = require('tufte.config')
    config.options.variant = variant

    -- Reload the colorscheme with the new variant
    require('tufte').load()
  end,
})
