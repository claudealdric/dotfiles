" Plugins will be downloaded under the specified directory
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'cohama/lexima.vim' " auto-close parentheses
Plug 'tpope/vim-surround' " easily delete, change, and add surroundings in pairs
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'kaicataldo/material.vim', {'branch': 'main'} " Material theme
Plug 'wakatime/vim-wakatime' " time tracker
Plug 'mattn/emmet-vim' 

if has("nvim")
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  " For fuzzy find functionality
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

  " lua fork of vim-devicons; add icons to plugins
  Plug 'kyazdani42/nvim-web-devicons' 

  " Neovim statusline written in pure lua
  Plug 'hoob3rt/lualine.nvim'

  Plug 'ggandor/lightspeed.nvim'
endif

" List ends here; plugins become visible to Vim after this call
call plug#end()
