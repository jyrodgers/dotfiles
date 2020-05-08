" Make sure colored syntax mode is on, and make it Just Work with newer 256
" color terminals like iTerm2.
":"set background=dark
":"let g:rehash256 = 1
":"colorscheme gruvbox
":"if !has('gui_running')
":"  if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
":"    set t_Co=256
":"  elseif has("terminfo")
":"    colorscheme default
":"    set t_Co=8
":"    set t_Sf=[3%p1%dm
":"    set t_Sb=[4%p1%dm
":"  else
":"    colorscheme default
":"    set t_Co=8
":"    set t_Sf=[3%dm
":"    set t_Sb=[4%dm
":"  endif
":"  " Disable Background Color Erase when within tmux - https://stackoverflow.com/q/6427650/102704
":"  if $TMUX != ""
":"    set t_ut=
":"  endif
":"endif
":"syntax on
":"
":"highlight Normal ctermbg=None| " Makes a black background in gruvbox
