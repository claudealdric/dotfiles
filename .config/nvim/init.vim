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
Plug 'kaicataldo/material.vim', {'branch': 'main'}
Plug 'wakatime/vim-wakatime'

if has("nvim")
  Plug 'neovim/nvim-lspconfig'
  Plug 'glepnir/lspsaga.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-lua/completion-nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'hoob3rt/lualine.nvim'
endif

" List ends here; plugins become visible to Vim after this call
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcuts
nmap <F2> <Plug>(coc-rename)

" Set up `Prettier` command
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" COC config
let g:coc_global_extensions = [
  \ 'coc-prettier',
  \ 'coc-eslint',
  \ 'coc-json',
  \ 'coc-tsserver',
\]

" TextEdit might fail if hidden is not set
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Give more space for displaying messages
set cmdheight=2

" Having longer updatetime (default is 4000ms = 4s) leads to noticeable
" delays and poor user performance
set updatetime=300

" Don't pass messages to |ins-completion-menu|
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Self configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Basic

let mapleader = " "       " remap the leader to space

syntax on		              " syntax highlighting
set hlsearch		          " highlight all search results
set ignorecase		        " do case insensitive search
set incsearch		          " show incremental search results as you type
set number relativenumber " display line number
set noswapfile		        " disable .swp files
set expandtab		          " replace the tabs with whitespace
set shiftwidth=2	        " number of spaces when indenting
set tabstop=2 		        " number of visual spaces per TAB
set softtabstop=2         " number of spaces in tab when editing
set autoindent 		        " copy indent from current line when starting new line
set smartindent 	        " do smart autoindenting when starting a new line
set shell=fish

" Personal shortcuts

" Insert mode
"
inoremap wq <ESC>	" remap escape key in insert mode

" Normal mode
"
nnoremap <leader>/ :set hlsearch!<CR> " toggle highlight search
nnoremap <leader>f :Prettier<CR> " auto-format with Prettier
nnoremap <leader>s :w<CR> " save
nnoremap <leader>x :wq<CR> " save and exit
nnoremap <leader>v :vsplit<CR> " create a vertical split
nnoremap <leader>h :split<CR> " create a horizontal split

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax theme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if exists("&termguicolors") && exists("&winblend")
  syntax enable
  set termguicolors
  set winblend=0
  set wildoptions=pum
  set pumblend=5
  set background=dark
  colorscheme material
  let g:material_terminal_italics = 1
  let g:material_theme_style = 'darker_community'
endif

