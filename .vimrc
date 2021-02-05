"-------------------------------------------------------------------------------
" Plugins
"-------------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')
  Plug 'Shougo/unite.vim'
  Plug 'Shougo/vimfiler.vim'
call plug#end()


"-------------------------------------------------------------------------------
" Powerline
"-------------------------------------------------------------------------------
"
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup


"-------------------------------------------------------------------------------
" Keyboard shortcuts
"-------------------------------------------------------------------------------

let mapleader=" "

nmap <leader>q :q<Return>

" Tabs
nmap te :tabedit<Return>
nmap <S-Tab> :tabprev<Return>
nmap <Tab> :tabnext<Return>

" Split window
nmap <leader>s :split<Return><C-w>w
nmap <leader>v :vsplit<Return><C-w>w

" Move window
map <leader>h <C-w>h
map <leader>k <C-w>k
map <leader>j <C-w>j
map <leader>l <C-w>l

" Resize window
nmap <C-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-

" vim-plug
nmap <leader>p :PlugInstall

" vimfiler
nmap <leader>f :VimFilerBufferDir<Return>
nmap <leader>F :VimFilerExplorer -find<Return>
nmap <leader>b :Unite buffer<Return>
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_enable_auto_cd = 0
let g:vimfiler_tree_leaf_icon = ''
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_marked_file_icon = '✓'

"-------------------------------------------------------------------------------
" Options
"-------------------------------------------------------------------------------

set number " show line numbers
set tabstop=2 " number of visual spaces per TAB
set softtabstop=2 " number of spaces in tab when editing
set shiftwidth=2 " number of spaces when indenting
set shiftround " use multiple of shiftwidth when indenting with '<' and '>'
set expandtab " tabs are spaces
set showcmd " show command in bottom bar
set showmatch " highlight matching parentheses, brackets, etc.
set incsearch " search as characters are entered
set hlsearch " highlight matches
set smarttab " lets tab key insert 'tab stops,' and Backspace deletes tabs
set gdefault " use the 'g' flag by default
set backspace=indent,eol,start
set splitbelow " open horizontal splits on the bottom by default
set splitright " open vertical splits on the right by default
set history=10000 " set command history log to 1,000 commands
set ruler " see status bar that displays line and column position
set wildmenu " shows a menu when using tab completion
set scrolloff=2 " keep [2] lines when doing z[Enter]
set autoindent " copy indent from current line when starting new line
set smartindent " do smart autoindenting when starting a new line
set bg=dark " use colors that go well with a dark background

syntax enable " enable syntax processing
filetype plugin indent on " load filetype-specific indent files
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Disable Arrow Keys
nmap <Left> <Esc>
nmap <Up> <Esc>
nmap <Right> <Esc>
nmap <Down> <Esc>

