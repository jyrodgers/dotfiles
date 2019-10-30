"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin on " enable plugins

"""" initialize plugins
function! PlugOnLoad(name, exec) abort
if has_key(g:plugs, a:name) &&
\ (has_key(
\g:plugs[a:name], 'on') ||
\has_key(g:plugs[a:name], 'for'))
execute 'autocmd! User' a:name a:exec
else
execute 'autocmd VimEnter *' a:exec
endif
endfunction

"======================================
" Vim Plug:
" https://github.com/junegunn/vim-plug A minimalist Vim plugin manager.
"======================================

" Installation
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.local/share/nvim/plugged')

"""""""""""""""""""""""
" Experimental Plugins
"""""""""""""""""""""""

" " Enables neovim support for Language Server Protocol.
" Requires neovim.
    Plug 'autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'bash install.sh',
    \ }



Plug 'junegunn/goyo.vim'
Plug 'christoomey/vim-titlecase'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'hashivim/vim-terraform'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'pearofducks/ansible-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'towolf/vim-helm'



"======================================
" abolish
" https://github.com/tpope/vim-abolish
" Work with variants of words.
" Autocomplete commonly misspelled words
" Easily search for, substitute, and abbreviate multiple variants of a word
" Transform words between many different cases
"======================================
Plug 'tpope/vim-abolish'
" let g:abolish_save_file = expand("~/.local/share/nvim/plugged/vim-abolish/.abolish")

" Instructions
" Create a file: ~/.vim/after/plugin/abolish.vim with contents \"source <path_to_dotfiles_repo/.abolish>"
" In abolish_save_file added substitutions
" Ex.
" Abolish teh the
" Abolish anomol{y,ies} anomal{}

function! InitAbolish ()
   Abolish adn and
   Abolish afterword{,s}                         afterward{}
   Abolish anomol{y,ies}                         anomal{}
   Abolish austrail{a,an,ia,ian}                 austral{ia,ian}
   Abolish balacner                              balancer
   Abolish cal{a,e}nder{,s}                      cal{e}ndar{}
   Abolish delimeter{,s}                         delimiter{}
   Abolish despara{te,tely,tion}                 despera{}
   Abolish destionation{,s}                      destination{}
   Abolish d{e,i}screp{e,a}nc{y,ies}             d{i}screp{a}nc{}
   Abolish euphamis{m,ms,tic,tically}            euphemis{}
   Abolish fro                                   for
   Abolish functoin{ally,ed} function{}
   Abolish hense                                 hence
   Abolish hte                                   the
   Abolish improvment{,s}                        improvement{}
   Abolish inherant{,ly}                         inherent{}
   Abolish lastest                               latest
   Abolish nad                                   and
   Abolish ot                                    to
   Abolish persistan{ce,t,tly}                   persisten{}
   Abolish recipie{s}                            recipe
   Abolish rec{co,com,o}mend{,s,ed,ing,ation}    rec{om}mend{}
   Abolish referesh{,es}                         refresh{}
   Abolish reproducable                          reproducible
   Abolish resouce{,s}                           resource{}
   Abolish restraunt{,s}                         restaurant{}
   Abolish segument{,s,ed,ation}                 segment{}
   Abolish seperat{e,es,ed,ing,ely,ion,ions,or}  separat{}
   Abolish srting{s}                             string{}
   Abolish tempalte{s}                           template{}
   Abolish {,in}consistan{cy,cies,t,tly}         {}consisten{}
   Abolish {,ir}releven{ce,cy,t,tly}             {}relevan{}
   Abolish {,non}existan{ce,t}                   {}existen{}
   Abolish {,re}impliment{,s,ing,ed,ation}       {}implement{}
   Abolish {,un}nec{ce,ces,e}sar{y,ily}          {}nec{es}sar{}
   Abolish {,un}orgin{,al}                       {}origin{}
   Abolish {c,m}arraige{,s}                      {}arriage{}
   Abolish {les,compar,compari}sion{,s}          {les,compari,compari}son{}
   Abolish wrok{er,ing}                          work{} 
   Abolish work{re,ign}                          work{} 
endfunction


" Coercion:
" snake_case (crs):       fooBar -> foo_bar
" MixedCase (crm):        foo_bar -> FooBar
" camelCase (crc):        foo_bar -> fooBar
" UPPER_CASE (cru):       fooBar -> FOO_BAR
" dash-case (cr-):        fooBar -> foo-bar
" dot.case (cr.):         fooBar -> foo.bar
" space case (cr<space>): fooBar -> foo bar
" Title Case (crt):       fooBar -> Foo Bar

"======================================
" Ack
" https://github.com/mileszs/ack.vim
" allows you to search with ack from within Vim and shows the results in a split window.
"======================================
" Plug 'mileszs/ack.vim' "

" " use ag instead of Ack or grep
" if executable('ag')
"   let g:ackprg = 'ag --vimgrep'
" endif

"======================================
" ALE
" https://github.com/w0rp/ale
" ALE (Asynchronous Lint Engine) is a plugin for providing linting
"======================================

Plug 'w0rp/ale'

""" ALE Settings
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
highlight link ALEWarningSign String
highlight link ALEErrorSign Title
let g:ale_completion_enabled = 1| " Enable completion where available.

"======================================
" CamelCaseMotion
" https://github.com/bkad/CamelCaseMotion
" Defines motions to move Camel-wise; i.e. to word boundaries, uppercase letters and underscores
"======================================
Plug 'bkad/CamelCaseMotion'

map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e

"======================================
" Colorschemes
"======================================

" Dracula: https://github.com/dracula/dracula-theme
Plug 'dracula/vim', { 'as': 'dracula' }

" An arctic, north-bluish clean and elegant Vim color theme.
Plug 'arcticicestudio/nord-vim'

" Gruvbox: Retro groove color scheme for Vim https://github.com/morhetz/gruvbox
Plug 'morhetz/gruvbox'

" lite-brite: a heavily customized dark color scheme for Vim designed to provide a consistent experience for a variety of file types. https://github.com/noprompt/lite-brite
Plug 'noprompt/lite-brite'

" Onedark: dark Vim/Neovim color scheme inspired by Atom's One Dark syntax theme https://github.com/joshdick/onedark.vim
Plug 'joshdick/onedark.vim'

" Snow, a blue-tinted winter vimscape https://github.com/nightsense/snow
Plug 'nightsense/snow'

" Solarized: Color scheme for vim https://github.com/altercation/vim-colors-solarized
Plug 'altercation/vim-colors-solarized'

"======================================
" Commentary
" https://github.com/tpope/vim-commentary
" easily comment and uncomment using map and numbers
"======================================
Plug 'tpope/vim-commentary'

" Instructions:
" gcc comments/uncomments single line
" gcu uncomments connected commented lines
"
" You can also use numbers and motion keys

"======================================
" deoplete
" https://github.com/Shougo/deoplete.nvim
" extensible and asynchronous auto-completion framework
"======================================

  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#sources = {}
let g:deoplete#sources._ = ['neosnippet', 'tag', 'buffer', 'member', 'tabnine', 'LanguageClient']

"======================================
" EasyAlign
" Dockerfile:
" https://github.com/ekalinin/Dockerfile.vim
" Vim syntax file for Docker's Dockerfile
"======================================

Plug 'ekalinin/Dockerfile.vim'

"======================================
" https://github.com/junegunn/vim-easy-align
" easy-to-use plugin to align text .
"======================================

Plug 'junegunn/vim-easy-align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Instructions:
" activate EasyAlign (ga) followed by the character that you want to align with

"======================================
" Easy Motion
" https://github.com/easymotion/vim-easymotion
" highlights all possible choices and allows you to press one key to jump directly to a target letter.
"======================================
Plug 'easymotion/vim-easymotion'
let g:EasyMotion_keys = 'asdfghjkl'
let g:EasyMotion_smartcase = 1
let g:EasyMotion_space_jump_first = 1 | " jump to first match ('a') by pressing space

" Instructions
" 1. <leader>e to bring up Easy Motion menu.
" 2. type the character that you want to jump to.
" 3. type the highlighted character that is in the location that you want to jump to

"======================================
" fzf
" https://github.com/junegunn/fzf.vim
" a vim plugin for fzf
"======================================
Plug 'junegunn/fzf.vim'
Plug '/usr/local/opt/fzf' | " If installed using Homebrew
Plug '~/.fzf'| " If installed using git
"Plug '~/.fzf'| " folder fzf is installed in on macOS
" Plug '/home/linuxbrew/.linuxbrew/opt/fzf'| " folder fzf is installed in Linux
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], [preview window], [toggle keys...]])
"     * For syntax-highlighting, Ruby and any of the following tools are required:
"       - Bat: https://github.com/sharkdp/bat
"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"       - CodeRay: http://coderay.rubychan.de/
"       - Rouge: https://github.com/jneen/rouge
"
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

"======================================
" Gitgutter
" https://github.com/airblade/vim-gitgutter
" shows a git diff in the 'gutter' (sign column). It shows which lines have been added, modified, or removed
"======================================
Plug 'airblade/vim-gitgutter'

" Instructions:
" jump to previous change in file: [c
" jump to next change in file:     ]c
" The . command will work with both these if repeat.vim is installed.

"======================================
" Goyo
" https://github.com/junegunn/goyo.vim
" Distraction-free writing in Vim.
"======================================
Plug 'junegunn/goyo.vim'

" Instructions:
" Toggle Goyo ':Goyo'
" let g:goyo_width (default: 80)
" let g:goyo_height (default: 85%)
" let g:goyo_linenr (default: 0)

"======================================
" indentLine
" https://github.com/Yggdroot/indentLine
" displaying thin vertical lines at each indentation level for code indented with spaces.
"======================================

Plug 'Yggdroot/indentLine', { 'on': 'IndentLinesEnable' }

" enable at startup
let g:indentLine_enabled = 1
autocmd! User indentLine doautocmd indentLine Syntax

"======================================
" Lightline
" https://github.com/itchyny/lightline.vim
" A light and configurable statusline/tabline plugin for Vim
"======================================

Plug 'itchyny/lightline.vim'

" Configuration
let g:lightline = {
\ 'colorscheme': 'gruvbox',
\ 'active': {
\   'left': [['mode', 'paste'], ['filename', 'modified']],
\   'right': [['lineinfo'], ['wordcount'],['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
\ },
\ 'component_expand': {
\   'linter_warnings': 'LightlineLinterWarnings',
\   'linter_errors': 'LightlineLinterErrors',
\   'linter_ok': 'LightlineLinterOK'
\ },
\ 'component_function': {
\   'wordcount': 'WordCount',
\ },
\ 'component_type': {
\   'readonly': 'error',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error'
\ },
\ }

"======================================
" neosnippet
" https://github.com/Shougo/neosnippet.vim
" support for snippets. Snippets are small templates for commonly used code that you can fill in on the fly.
"======================================
Plug 'Shougo/neosnippet.vim'

" key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" Disable default snippets
let g:neosnippet#disable_runtime_snippets = {
		\   '_' : 1,
		\ }

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/Git/neosnippets/neosnippets'

"======================================
" Nerdtree
" https://github.com/scrooloose/nerdtree
" a file system explorer
"======================================
Plug 'scrooloose/nerdtree'

" Instructions:
" Use the natural vim navigation keys hjkl to navigate the files.
" Press o to open the file in a new buffer or open/close directory.
" Press t to open the file in a new tab.
" Press i to open the file in a new horizontal split.
" Press s to open the file in a new vertical split.
" Press p to go to parent directory.
" Press r to refresh the current directory.

let NERDTreeShowLineNumbers=1|                        " enable line numbers
autocmd FileType nerdtree setlocal relativenumber|    " make sure relative line numbers are used
let NERDTreeAutoDeleteBuffer = 1|                     " delete the buffer of the file you deleted with NerdTree
let NERDTreeIgnore=[ '\.ncb$', '\.suo$', '\.vcproj\.RIMNET', '\.obj$', '\.ilk$', '^BuildLog.htm$', '\.pdb$', '\.idb$', '\.embed\.manifest$', '\.embed\.manifest.res$', '\.intermediate\.manifest$', '^mt.dep$' ]| " Don't display these kinds of files
let NERDTreeQuitOnOpen = 1|                           " close NERDTree when opening a file
let NERDTreeShowBookmarks=1 |                         " Show the bookmarks table on startup
let g:NERDTreeIndicatorMapCustom = { "Modified": "✹", "Staged": "✚", "Untracked": "✭", "Renamed": "➜", "Unmerged": "═", "Deleted": "✖", "Dirty": "✗", "Clean": "✔︎", 'Ignored': '☒', "Unknown": "?" } | " Nerdtree git plugin
let g:NERDTreeWinSize=60|                             " set default split size

"======================================
" Nerdtree git plugin
" https://github.com/Xuyuanp/nerdtree-git-plugin/blob/master/README.md
" A plugin of NERDTree showing git status flags
"======================================
Plug 'Xuyuanp/nerdtree-git-plugin' " nerdtree-git-plugin,

let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

"======================================
" RainbowParentheses
" https://github.com/junegunn/rainbow_parentheses.vim
" Easily identify matching parenthesis based on matching colors
"======================================
"Plug 'junegunn/rainbow_parentheses.vim' " Rainbow Parentheses
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1


"======================================
" Repeat
" https://github.com/tpope/vim-repeat
" Repeat.vim remaps . in a way that plugins can tap into it.
"======================================
Plug 'tpope/vim-repeat'

"======================================
" Speeddating
" https://github.com/tpope/vim-speeddating
" Speed Dating use CTRL-A/CTRL-X to increment dates, times, and more
"======================================
Plug 'tpope/vim-speeddating'

"======================================
" Surround
" https://github.com/tpope/vim-surround
" provides mappings to easily delete, change and add surroundings characters in pairs.
"======================================

Plug 'tpope/vim-surround'

" Usage:
"   cs"'        =   change surroundings (from) " to '
"   cst"        =   change surroundings TO "
"   ds"         =   delete (from) surroundings "
"   ysiw]       =   YOOM surroundings (in word) ], producing [foo]
"   yss)        =   YOOM the entire line with )
"

"======================================
" Switch
" https://github.com/AndrewRadev/switch.vim
" Example 'true' becomes 'false', -- becomes ++, etc.
"======================================
Plug 'AndrewRadev/switch.vim' "

" Instructions:
" press 'gs' in normal mode, to substitute characters under cursor.

" custom switches
let g:switch_custom_definitions =
    \ [
    \   ['if', 'else if', 'while'],
    \   ['>', '<'],
    \   ['--', '++'],
    \   ['-', '+'],
    \   ['>=', '<='],
    \   ['+=', '-='],
    \   ['==', '!=']
    \ ]

"======================================
" TabNine
" https://tabnine.com
" TabNine is the all-language autocompleter. It uses machine learning to provide responsive, reliable, and relevant suggestions.
"======================================

Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }

"======================================
" tmux navigator
" https://github.com/christoomey/vim-tmux-navigator
" allows you to navigate seamlessly between vim and tmux splits using a consistent set of hotkeys.
"======================================
Plug 'christoomey/vim-tmux-navigator'

" Instructions:
" This plugin provides the following mappings which allow you to move between Vim panes and tmux splits seamlessly.
" <ctrl-h> => Left
" <ctrl-j> => Down
" <ctrl-k> => Up
" <ctrl-l> => Right
" <ctrl-\> => Previous split

" Install:
" Add the following to your ~/.tmux.conf flle:

" # Smart pane switching with awareness of Vim splits.
" # See: https://github.com/christoomey/vim-tmux-navigator
" is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
"     | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"
" bind-key -n C-h if-shell "$is_vim" "send-keys C-h"  "select-pane -L"
" bind-key -n C-j if-shell "$is_vim" "send-keys C-j"  "select-pane -D"
" bind-key -n C-k if-shell "$is_vim" "send-keys C-k"  "select-pane -U"
" bind-key -n C-l if-shell "$is_vim" "send-keys C-l"  "select-pane -R"
" bind-key -n C-\ if-shell "$is_vim" "send-keys C-\\" "select-pane -l"
" bind-key -T copy-mode-vi C-h select-pane -L
" bind-key -T copy-mode-vi C-j select-pane -D
" bind-key -T copy-mode-vi C-k select-pane -U
" bind-key -T copy-mode-vi C-l select-pane -R
" bind-key -T copy-mode-vi C-\ select-pane -l

"======================================
" Yank Ring,
" https://github.com/vim-scripts/YankRing.vim
" Maintains a history of previous yanks, changes and deletes
"======================================
Plug 'vim-scripts/YankRing.vim'

" Instructions:
" Display the contents of the yankring. :YRShow

" Commenting out line below sets use of vertical split
" let g:yankring_window_use_horiz = 0

" Set wide of vertical split
" let g:yankring_window_width = 100

call plug#end()
call PlugOnLoad('vim-abolish',         'call InitAbolish()')
