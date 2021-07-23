" Plugins will be downloaded under the specified directory
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'cohama/lexima.vim'

if has("nvim")
  Plug 'neovim/nvim-lspconfig'
endif

" List ends here; plugins become visible to Vim after this call
call plug#end()

