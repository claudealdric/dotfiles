" Location: ~/.config/nvim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Self configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Basic

let mapleader = " "	" remap the leader to space
syntax on		" syntax highlighting
set hlsearch		" highlight all search results
set ignorecase		" do case insensitive search
set incsearch		" show incremental search results as you type
set number		" display line number
set noswapfile		" disable .swp files
set expandtab		" replace the tabs with whitespace
set shiftwidth=2	" number of spaces when indenting
set tabstop=2 		" number of visual spaces per TAB
set softtabstop=2 	" number of spaces in tab when editing
set autoindent 		" copy indent from current line when starting new line
set smartindent 	" do smart autoindenting when starting a new line


"
inoremap wq <ESC>	" remap escape key in insert mode

" Misc

set spell spelllang=en_us

" Personal shortcuts

" toggle highlight search
nnoremap <leader>/ :set hlsearch!<CR>

" toggle spell checker
nnoremap <leader>s :setlocal spell! spelllang=en_us<CR>

