" jyrodgers vimrc

" Sections:
" Jump to section: place cursor on first word of section title then press '*'
"   -> Colors and Fonts
"   -> Commands
"   -> Experimental Settings
"   -> File Type Specific Settings
"   -> Functions
"   -> Macros
"   -> Mappings
"   -> Moving Around
"   -> Plugins
"   -> Settings
"   -> Text, Tab and Indent
"   -> Windows, Buffers, Splits, Tabs


set nocompatible " Has the effect of making Vim less Vi-compatible, This must be first, because it changes other options as a side effect.  http://vimdoc.sourceforge.net/htmldoc/options.html#'compatible'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Experimental Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" au InsertLeave * silent! set nopaste

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set background=dark
" set foldlevel=1
" set foldmethod=indent                  "  fold based on indentation
" set foldnestmax=10                     "  deepest fold is 10 levels
"set foldenable                        " fold by default
"set scrolloff=999                     " keeps cursor in screen center
let g:netrw_banner=0|                  " disable annoying banner
set lazyredraw                         " Only redraw when necessary.
set nomodeline                         " avoid security risk of modelines
set shortmess+=I                       " Don't show the Vim startup message
set timeoutlen=450                     " Set time between key presses before implementing commands
set ttyfast                            " Faster redrawing.
set updatetime=100                     " If this many milliseconds nothing is typed the swap file will be written to disk Affects how quickly gutter symbols appear for git-gutter
set visualbell                         " Use visual bell instead of noise

" Spell Checking
 highlight clear SpellBad
 highlight clear SpellCap
 highlight clear SpellLocal
 highlight clear SpellRare

" window splits & ruler were too bright - change to white on grey " (shouldn't change GUI or non-color term appearance)
" highlight StatusLine   cterm=NONE ctermbg=blue ctermfg=white
" highlight StatusLineNC cterm=NONE ctermbg=black ctermfg=white
" highlight VertSplit    cterm=NONE ctermbg=black ctermfg=white

" set default font size for gui
" if has("gui_running")
" if has("gui_gtk2")
"     set guifont=Inconsolata\ 12
" elseif has("gui_macvim")
"     set guifont=Menlo\ Regular:h14
" elseif has("gui_win32")
"     set guifont=Consolas:h12:cANSI
" endif
" endif

" Setup term color support
" if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
"     set t_Co=256
" endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cursor
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set cursorline                         " Highlight current line
set scrolloff=2                        " 2 lines above/below at top/bottom


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Clipboard, Undo, History
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set clipboard^=unnamed                 " Vim & Tmux & System Clipboard https://coderwall.com/p/j9wnfw/vim-tmux-system-clipboard
set history=2000                       " Set amount of command and search history
set undolevels=2000                    " Set amount of undo history

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch                           " highlight matches of last search pattern
set ignorecase                         " ignore case in search patterns
set incsearch                          " show matches as search proceeds
set smartcase                          " If a capital letter is included in search, make it case-sensitive

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status bar, Gutter, Line numbers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set colorcolumn=80                     " Highlight at column
set laststatus=2                       " always display status line
set noshowmode                         " Show current mode in command-line.
set number                             " Displays the absolute number for the current line
set relativenumber                     " Displays the relative numbers for all other lines
set report=0                           " Always display the # of lines changed by a command
set showcmd                            " Shows the incomplete commands that you are typing
set wildmenu                           " Command-line completion with <Tab>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, Tab and Indent
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif " Return to last edit position when opening files
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline | " Change spell checking highlighting to underline and bold
highlight SpellCap term=underline cterm=underline
highlight SpellLocal term=underline cterm=underline
highlight SpellRare term=underline cterm=underline
set autoindent                         " set autoindenting on
set backspace=indent,eol,start         " macOS backspace fix
set copyindent                         " copy the previous indentation
set list                               " show trailing whitespace chars
set listchars=tab:>-,trail:*,extends:>,precedes:<
set matchpairs=(:),{:},[:],<:>,":",':',`:`
set nofoldenable                       " don't fold by default
set nojoinspaces                       " Prevents two spaces after punctuation on a line join
set omnifunc="syntaxcomplete#Complete" " Omni completion provides smart auto-completion for programs.
set showmatch                          " show opposite parenthesis, bracket etc
set spell spelllang=en_us              " Use US English dictionary
set whichwrap=b,s,h,l,<,>,[,]          " Backspace and cursor keys wrap too
syntax enable                          " Enable syntax highlighting

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Windows, Buffers, Splits, Tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:netrw_altv=1|         " open splits to the right
let g:netrw_browse_split=4| " open in prior window
set hidden                  " move between buffers without having to save/revert first
set splitbelow              " new horizontal split pane opens below current
set splitright              " new vertical split pane opens to the right of current

" Automatic rename of tmux window
augroup tmuxWindows
  autocmd!
  if exists('$TMUX') && !exists('$NORENAME')
    au BufEnter * if empty(&buftype) | call system('tmux rename-window '.expand('%:t:S')) | endif
    au VimLeave * call system('tmux set-window automatic-rename on')
  endif
augroup END

"au FocusLost * :wa| " Auto-save upon switching to another window

" Put all temporary files under the same directory.
" https://github.com/mhinz/vim-galore#handling-backup-swap-undo-and-viminfo-files
"set backup
"set backupdir   =$HOME/.vim/files/backup/
"set backupext   =-vimbackup
"set backupskip  =
"set directory   =$HOME/.vim/files/swap//
"set updatecount =100
"set undofile
"set undodir     =$HOME/.vim/files/undo/
"set viminfo     ='100,n$HOME/.vim/files/info/viminfo
