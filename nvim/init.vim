" Location: ~/.config/nvim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Plugins will be downloaded under the specified directory
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'cohama/lexima.vim'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

if has("nvim")
  Plug 'neovim/nvim-lspconfig'
  Plug 'glepnir/lspsaga.nvim'
endif

" List ends here; plugins become visible to Vim after this call
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set up `Prettier` command
command! -nargs=0 Prettier :CocCommand prettier.formatFile

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Self configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Basic

let mapleader = " " " remap the leader to space

syntax on		      " syntax highlighting
set hlsearch		  " highlight all search results
set ignorecase		" do case insensitive search
set incsearch		  " show incremental search results as you type
set number        " display line number
set noswapfile		" disable .swp files
set expandtab		  " replace the tabs with whitespace
set shiftwidth=2	" number of spaces when indenting
set tabstop=2 		" number of visual spaces per TAB
set softtabstop=2 " number of spaces in tab when editing
set autoindent 		" copy indent from current line when starting new line
set smartindent 	" do smart autoindenting when starting a new line
set shell=fish

" Misc

set spell spelllang=en_us

" Personal shortcuts

" toggle highlight search
nnoremap <leader>/ :set hlsearch!<CR>
inoremap wq <ESC>	" remap escape key in insert mode
nnoremap <leader>f :Prettier<CR>

" toggle spell checker
nnoremap <leader>s :setlocal spell! spelllang=en_us<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax theme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if exists("&termguicolors") && exists("&winblend")
  syntax enable
  set termguicolors
  set winblend=0
  set wildoptions=pum
  set pumblend=5
  set background=dark
  " Use NeoSolarized
  let g:neosolarized_termtrans=1
  runtime ./colors/NeoSolarized.vim
  colorscheme NeoSolarized
endif

