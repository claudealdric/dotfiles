" Version 2.1
colorscheme slate " UI theme
"set guifont=Consolas:h10:cANSI:qDRAFT " font face, size, etc.
set guifont=Fira\ Code\ 10 " font face, size, etc.
syntax enable " enable syntax processing
set number " show line numbers
set tabstop=2 " number of visual spaces per TAB
set softtabstop=2 " number of spaces in tab when editing
set shiftwidth=2 " number of spaces when indenting
set shiftround " use multiple of shiftwidth when indenting with '<' and '>'
set expandtab " tabs are spaces
set showcmd " show command in bottom bar
filetype plugin indent on " load filetype-specific indent files
set showmatch " highlight matching parentheses, brackets, etc.
set incsearch " search as characters are entered
set hlsearch " highlight matches
set smarttab " lets tab key insert 'tab stops,' and Backspace deletes tabs
set gdefault " use the 'g' flag by default
set backspace=indent,eol,start
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
set splitbelow " open horizontal splits on the bottom by default
set splitright " open vertical splits on the right by default
set history=1000 " set command history log to 1,000 commands
set ruler " see status bar that displays line and column position
set wildmenu " shows a menu when using tab completion
set scrolloff=2 " keep [2] lines when doing z[Enter]
set autoindent " copy indent from current line when starting new line
set smartindent " do smart autoindenting when starting a new line
set bg=dark " use colors that go well with a dark background

" Disable Arrow Keys
nmap <Left> <Esc>
nmap <Up> <Esc>
nmap <Right> <Esc>
nmap <Down> <Esc>

