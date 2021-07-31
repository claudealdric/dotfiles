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

