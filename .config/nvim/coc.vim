" COC config
"____________________________________________________________

let g:coc_node_path = '~/.volta/bin/node'

let g:coc_global_extensions = [
  \ 'coc-prettier',
  \ 'coc-eslint',
  \ 'coc-json',
  \ 'coc-tsserver',
  \ 'coc-spell-checker',
  \ 'coc-tabnine',
  \ 'coc-html',
  \ 'coc-emmet',
  \ 'coc-css',
  \ 'coc-prisma',
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

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
