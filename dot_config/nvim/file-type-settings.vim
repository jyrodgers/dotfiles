"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File Type Specific Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"autocmd VimEnter * RainbowParentheses
filetype indent on " Enable file-type-specific indenting

"" Default file settings
" setlocal fo+=t
" setlocal tw=79
" setlocal wm=79
" setlocal ts=3
" setlocal shiftwidth=3
" setlocal shiftround
" setlocal smartindent
" setlocal smarttab
" setlocal expandtab
" setlocal commentstring=//\ %s
setlocal matchpairs+=<:>| " can % between matching braces

"" Git specific settings
autocmd Filetype gitcommit setlocal spell textwidth=72

"" Vim specific settings
autocmd Filetype vim setlocal tw=0
autocmd Filetype vim setlocal ts=2
autocmd Filetype vim setlocal shiftwidth=2
autocmd FileType vim setlocal commentstring=\"%s

"" Zsh specific settings
autocmd Filetype zsh setlocal tw=0
autocmd Filetype zsh setlocal ts=4
autocmd Filetype zsh setlocal shiftwidth=4
autocmd FileType zsh setlocal commentstring=\#%s

"" terraform specific settings

"" C specific settings
autocmd Filetype c setlocal tw=0
autocmd Filetype c setlocal ts=3
autocmd Filetype c setlocal shiftwidth=3 
autocmd FileType c setlocal commentstring=\//%s
autocmd Filetype c setlocal expandtab
autocmd Filetype c setlocal shiftround
autocmd Filetype c setlocal smarttab
autocmd Filetype c setlocal textwidth=0
autocmd Filetype c setlocal wrap
autocmd Filetype c setlocal wrapmargin=0

"" C++ specific settings
autocmd Filetype cpp setlocal tw=0
autocmd Filetype cpp setlocal ts=3
autocmd Filetype cpp setlocal shiftwidth=3 
autocmd FileType cpp setlocal commentstring=\//%s
autocmd Filetype cpp setlocal expandtab
autocmd Filetype cpp setlocal shiftround
autocmd Filetype cpp setlocal smarttab
autocmd Filetype cpp setlocal textwidth=0
autocmd Filetype cpp setlocal wrap
autocmd Filetype cpp setlocal wrapmargin=0

"" JSON specific settings
autocmd FileType json setlocal commentstring=#\ %s

"" YAML specific settings
autocmd FileType yaml setlocal commentstring=#\ %s
autocmd Filetype yaml setlocal tw=0
autocmd Filetype yaml setlocal ts=2
autocmd Filetype yaml setlocal shiftwidth=2
autocmd FileType yaml setlocal commentstring=\"%s

"" markdown specific settings
autocmd Filetype markdown setlocal tw=0
autocmd Filetype markdown setlocal tabstop=4
autocmd Filetype markdown setlocal shiftwidth=4
autocmd Filetype markdown setlocal wrap
autocmd Filetype markdown setlocal linebreak
autocmd Filetype markdown setlocal nolist
autocmd Filetype markdown setlocal textwidth=0
autocmd Filetype markdown setlocal wrapmargin=0
autocmd Filetype markdown setlocal shiftround
autocmd Filetype markdown setlocal expandtab
autocmd Filetype markdown setlocal smarttab
autocmd FileType markdown setlocal commentstring=#\ %s

"" TXT file specific settings
autocmd Filetype text setlocal shiftwidth=4
autocmd Filetype text setlocal expandtab
autocmd Filetype text setlocal shiftround
autocmd Filetype text setlocal smartindent
autocmd Filetype text setlocal smarttab

"zsh file specific settings
au BufRead,BufNewFile dot_zshrc set filetype=zsh
