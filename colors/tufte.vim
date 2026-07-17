" tufte colorscheme for Vim/Neovim
" Maintainer: Bjarne Øverli
" License: MIT

" Neovim-only Lua colorscheme
if !has('nvim')
  echohl ErrorMsg
  echom "tufte.nvim requires Neovim"
  echohl None
  finish
endif

lua require('tufte').load()
