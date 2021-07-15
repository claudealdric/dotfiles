" Location: ~/.config/nvim

" Basic configuration

let mapleader = " "	" remap the leader to space
syntax on		" syntax highlighting
set hlsearch		" highlight all search results
set ignorecase		" do case insensitive search
set incsearch		" show incremental search results as you type
set number		" display line number
set noswapfile		" disable .swp files
inoremap wq <ESC>	" remap escape key in insert mode

" Misc

set spell spelllang=en_us

" Personal shortcuts

" toggle highlight search
nnoremap <leader>/ :set hlsearch!<CR>

" toggle spell checker
nnoremap <leader>s :setlocal spell! spelllang=en_us<CR>

