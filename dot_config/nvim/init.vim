
" jyrodgers vimrc

" Sections:
" Jump to section: place cursor on first word of section title then press '*'
"   -> Colors and Fonts
"   -> _Cursor
"   -> _Commands
"   -> _Experimental Settings
"   -> _File Type Specific Settings
"   -> _Functions
"   -> _Macros
"   -> _Mappings
"   -> _Plugins
"   -> _Settings
"   -> _Clipboard, Undo, History
"   -> _Search
"   -> __Status bar, Gutter, Line numbers
"   -> _Text, Tab and Indent
"   -> _Windows, Buffers, Splits, Tabs


set nocompatible " Has the effect of making Vim less Vi-compatible, This must be first, because it changes other options as a side effect.  http://vimdoc.sourceforge.net/htmldoc/options.html#'compatible'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" _Experimental Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" au InsertLeave * silent! set nopaste

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" _Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:netrw_banner=0|                  " disable annoying banner
set lazyredraw                         " Only redraw when necessary.
set nomodeline                         " avoid security risk of modelines
set shortmess+=I                       " Don't show the Vim startup message
set timeoutlen=450                     " Set time between key presses before implementing commands
set ttyfast                            " Faster redrawing.
set updatetime=100                     " If this many milliseconds nothing is typed the swap file will be written to disk. Affects how quickly gutter symbols appear for git-gutter
set visualbell                         " Use visual bell instead of noise

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" _Clipboard, Undo, History
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set clipboard^=unnamed                 " Vim & Tmux & System Clipboard https://coderwall.com/p/j9wnfw/vim-tmux-system-clipboard
set history=2000                       " Set amount of command and search history
set undolevels=2000                    " Set amount of undo history

" Persistent Undo
" Keep undo history across sessions, by storing in file.
" Only works all the time.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set undofile
if has('persistent_undo') && isdirectory(expand('~').'~/.config/nvim/backup')
    silent !mkdir ~/.vim/backup > /dev/null 2>&1
    set undodir=~/.vim/backup
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" _Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch                           " highlight matches of last search pattern
set ignorecase                         " ignore case in search patterns
set incsearch                          " show matches as search proceeds
set smartcase                          " If a capital letter is included in search, make it case-sensitive

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" _Status bar, Gutter, Line numbers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set colorcolumn=80                     " Highlight at column
set laststatus=2                       " always display status line
set noshowmode                         " Don't show current mode in command-line.
set number                             " Displays the absolute number for the current line
set relativenumber                     " Displays the relative numbers for all other lines
set report=0                           " Always display the # of lines changed by a command
set showcmd                            " Shows the incomplete commands that you are typing
set wildmenu                           " Command-line completion with <Tab>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" _Text, Tab and Indent
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif " Return to last edit position when opening files
" Spell Checking

" clear default spelling highlighting
highlight clear SpellBad
highlight clear SpellCap
highlight clear SpellLocal
highlight clear SpellRare

" set custom spelling highlighting
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline | " Change spell checking highlighting to underline and bold
highlight SpellCap term=underline cterm=underline
highlight SpellLocal term=underline cterm=underline
highlight SpellRare term=underline cterm=underline

set autoindent                         " set autoindenting on
set backspace=indent,eol,start         " macOS backspace fix
set copyindent                         " copy the previous indentation
" set foldlevel=1
" set foldmethod=indent                " fold based on indentation
" set foldnestmax=10                   " deepest fold is 10 levels
" set foldenable                       " fold by default
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
" _Windows, Buffers, Splits, Tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:netrw_altv=1|         " open splits to the right
let g:netrw_browse_split=4| " open in prior window
set hidden                  " move between buffers without having to save/revert first
" set scrolloff=999           " keeps cursor in screen center
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
set backup
set backupdir   =$HOME/.tmp/.vim/files/backup/
set backupext   =-vimbackup
set backupskip  =
set directory   =$HOME/.tmp/.vim/files/swap/
set undodir     =$HOME/.tmp/.vim/files/undo/
set undofile
set updatecount =100
set viminfo     ='100,n$HOME/.tmp/.vim/files/info/viminfo


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" _Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" initialize plugins on load
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"function! PlugOnLoad(name, exec) abort
"if has_key(g:plugs, a:name) &&
"\ (has_key(
"\g:plugs[a:name], 'on') ||
"\has_key(g:plugs[a:name], 'for'))
"execute 'autocmd! User' a:name a:exec
"else
"execute 'autocmd VimEnter *' a:exec
"endif
"endfunction

" Display word count in status bar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" function! WordCount()
"     let currentmode = mode()
"     if !exists("g:lastmode_wc")
"         let g:lastmode_wc = currentmode
"     endif
"     " if we modify file, open a new buffer, be in visual ever, or switch modes
"     " since last run, we recompute.
"     if &modified || !exists("b:wordcount") || currentmode =~? '\c.*v' || currentmode != g:lastmode_wc
"         let g:lastmode_wc = currentmode
"         let l:old_position = getpos('.')
"         let l:old_status = v:statusmsg
"         execute "silent normal g\<c-g>"
"         if v:statusmsg == "--No lines in buffer--"
"             let b:wordcount = 0
"         else
"             let s:split_wc = split(v:statusmsg)
"             if index(s:split_wc, "Selected") < 0
"                 let b:wordcount = str2nr(s:split_wc[11])
"             else
"                 let b:wordcount = str2nr(s:split_wc[5])
"             endif
"             let v:statusmsg = l:old_status
"         endif
"         call setpos('.', l:old_position)
"         return b:wordcount
"     else
"         return b:wordcount
"     endif
" endfunction

" Toggles a bullet at beginning of line in markdown files
" use with key mapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ToggleBullet()
  let l:myVar = getline('.')
  if (l:myVar =~? '^\s*\s-\.*$')
      s/^\s*\ -//e
  elseif (l:myVar =~? '^\s*.*$')
      s/\(^\s.*\)/\1-\ /e
  endif
endfunction

" Toggle completion of check box in markdown files
" use with key mapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! ToggleCheckmark()
  let l:myVar = getline('.')
  if (l:myVar =~? '^\s*-\s\[\s\].*$')
      s/\[\ \]/\[x\]/e
  elseif (l:myVar =~? '^\s*-\s\[x\].*$')
      s/\[x\]/\[\ \]/e
  endif
endfunction

" Changes current directory to the root of the Git repository
" Use with :Root
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:root()
  let root = systemlist('git rev-parse --show-toplevel')[0]
  if v:shell_error
    echo 'Not in git repo'
  else
    execute 'lcd' root
    echo 'Changed directory to: '.root
  endif
endfunction
command! Root call s:root()

autocmd User ALELint call s:MaybeUpdateLightline()

" Update and show lightline but only if it's visible (e.g., not in Goyo)
function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  endif
endfunction

" Rename tabs to show tab number.
" (Based on http://stackoverflow.com/questions/5927952/whats-implementation-of-vims-default-tabline-function)
if exists("+showtabline")
    function! MyTabLine()
        let s = ''
        let wn = ''
        let t = tabpagenr()
        let i = 1
        while i <= tabpagenr('$')
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let s .= '%' . i . 'T'
            let s .= (i == t ? '%1*' : '%2*')
            let s .= ' '
            let wn = tabpagewinnr(i,'$')

            let s .= '%#TabNum#'
            let s .= i
            " let s .= '%*'
            let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
            let bufnr = buflist[winnr - 1]
            let file = bufname(bufnr)
            let buftype = getbufvar(bufnr, 'buftype')
            if buftype == 'nofile'
                if file =~ '\/.'
                    let file = substitute(file, '.*\/\ze.', '', '')
                endif
            else
                let file = fnamemodify(file, ':p:t')
            endif
            if file == ''
                let file = '[No Name]'
            endif
            let s .= ' ' . file . ' '
            let i = i + 1
        endwhile
        let s .= '%T%#TabLineFill#%='
        let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
        return s
    endfunction
    set stal=2
    set tabline=%!MyTabLine()
    set showtabline=1
    highlight link TabNum Special
endif

" Don't complete certain files that I'm not likely to want to manipulate from within Vim:
if has('wildignore')
    set wildignore+=*.a,*.o
    set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
    set wildignore+=.DS_Store,.git,.hg,.svn
    set wildignore+=*~,*.swp,*.tmp
endif

" Google word under cursor
" ? to google, ! for feeling lucky
function! s:goog(pat, lucky)
  let q = '"'.substitute(a:pat, '["\n]', ' ', 'g').'"'
  let q = substitute(q, '[[:punct:] ]',
        \ '\=printf("%%%02X", char2nr(submatch(0)))', 'g')
  call system(printf(g:open_command.' "https://www.google.com/search?%sq=%s"',
        \ a:lucky ? 'btnI&' : '', q))
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File Type Specific Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

"" HELM specific settings
autocmd FileType helm setlocal commentstring=#\ %s
autocmd FileType helm setlocal commentstring=\"%s
autocmd Filetype helm setlocal expandtab
autocmd Filetype helm setlocal shiftwidth=2
autocmd Filetype helm setlocal smarttab
autocmd Filetype helm setlocal ts=2
autocmd Filetype helm setlocal tw=0

"" JSON specific settings
autocmd FileType json setlocal commentstring=#\ %s

"" YAML specific settings
autocmd FileType yaml setlocal commentstring=#\ %s
autocmd FileType yaml setlocal commentstring=\"%s
autocmd Filetype yaml setlocal expandtab
autocmd Filetype yaml setlocal shiftwidth=2
autocmd Filetype yaml setlocal smarttab
autocmd Filetype yaml setlocal ts=2
autocmd Filetype yaml setlocal tw=0

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" _Macros
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Instructions to save a macro
" https://stackoverflow.com/questions/2024443/saving-vim-macros
" 1. From normal mode: q<letter>
" 2. Execute commands
" 3. From normal mode: q
" 4. To get the macro command (From normal mode): "<letter>p
" 5. In .vimrc enter: let <letter> = <macro command>
" 6. This macro will be loaded into vim on start

"" l: Creates markdown link using surround.vim
" Pre-requisite: 2 lines of content. Cursor is on Line 1
" Line 1: text to be linked
" Line 2: url of link
let @l = 'yss[1jyss(1kJ'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" _Commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

command! MakeTags !ctags -R
command! FindErrors /error\|fail\|severe
command! RemoveTrailingSpaces :%s/\s\+$//
command! Sortline call setline(line('.'),join(sort(split(getline('.'))), ' '))

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" _Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" The leader is the key to initiate custom shortcuts
" http://learnvimscriptthehardway.stevelosh.com/chapters/06.html
let mapleader = ";"

"" a
""=====================================

" uses ag to search through file contents, '?' to preview file
nnoremap <leader>a :Ag<CR>

" auto indent: will 'fix' identing for the entire file
nmap <leader>ai mzgg=G`z

" inoremap <Leader><C-a> (

"" b
""=====================================
"autocmd Filetype markdown nnoremap <buffer> <silent> <leader>b :keeppatterns s/^/-\ /e<CR>
autocmd Filetype markdown nnoremap <buffer> <silent> <leader>b :call ToggleBullet()<CR>

"" c
""=====================================

" Change working directory to the directory of the current file
nnoremap <leader>cwd :lcd %:p:h<CR>

" add/complete/uncomplete tasks in markdown files
"autocmd Filetype markdown nnoremap <buffer> <silent> <leader>c :keeppatterns s/^/-\ [\ ]\ /e<CR>
autocmd Filetype markdown nnoremap <buffer> <silent> <leader>C :call ToggleCheckmark()<CR>

"" d
""=====================================

"" e
""=====================================

" trigger easy motion
" nmap <Leader>e <Leader><Leader>s

" EasyMotion
" Move to character with EasyMotion
"nmap <Leader>; <Plug>(easymotion-bd-f)
" Move to character with EasyMotion
"nmap <Leader>; <Plug>(easymotion-overwin-f)
" Move to word with EasyMotion
" map  <Leader>ew <Plug>(easymotion-bd-w)
" Move to word with EasyMotion
" nmap <Leader>ew <Plug>(easymotion-overwin-w)
" Move to line with EasyMotion
" map <Leader>el <Plug>(easymotion-bd-jk)
" Move to line with EasyMotion
" nmap <Leader>el <Plug>(easymotion-overwin-line)


"" f
""=====================================

" open file search fuzzy finder (fzf)
nmap <Leader>f :Files<CR>

"" g
""=====================================

" create the file whose file name under cursor and jump to it
map <leader>gf <leader>cwd :e <cfile><cr>
" show all tag options by default
nnoremap <C-]> g<C-]>

"" h
""=====================================

" add/remove headers in markdown files
autocmd Filetype markdown nnoremap <buffer> <silent> <leader>H :keeppatterns s/^/#/e<cr>
autocmd Filetype markdown xnoremap <buffer> <silent> <Leader>H :<c-u>keeppatterns '<,'>g/^#/keeppatterns s/^#/##/<cr>
autocmd Filetype markdown nnoremap <buffer> <silent> <Leader>h :keeppatterns s/^#//e<cr>
autocmd Filetype markdown xnoremap <buffer> <silent> <Leader>h :<c-u>keeppatterns '<,'>g/^#/keeppatterns s/^#//<cr>

" open recent command file fuzzy finder (fzf)
nmap <Leader>hc :History:<CR>

" open recent file fuzzy finder (fzf)
nmap <Leader>hf :History<CR>

" open recent search file fuzzy finder (fzf)
nmap <Leader>hs :History/<CR>

" dedent line
"nnoremap <silent> <leader>h <<
"xnoremap <silent> <leader>h <gv

" add headers to line in markdown files
autocmd Filetype markdown noremap <leader>h1 m`^i# <esc>``2l
autocmd Filetype markdown noremap <leader>h2 m`^i## <esc>``3l
autocmd Filetype markdown noremap <leader>h3 m`^i### <esc>``4l
autocmd Filetype markdown noremap <leader>h4 m`^i#### <esc>``5l
autocmd Filetype markdown noremap <leader>h5 m`^i##### <esc>``6l

"" i
""=====================================


"" j
""=====================================

" Join lines and restore cursor location
nnoremap J mjJ`j 

" split line
nnoremap <leader>j i<CR><Esc>

" move line down
" nnoremap <silent> <C-j> :move+<cr>
" xnoremap <silent> <C-j> :move'>+<cr>gv
" inoremap <Leader><C-j> ]
" inoremap <Leader><C-J> }

"" k
""=====================================

" move line up
" nnoremap <silent> <C-k> :move-2<cr>
" xnoremap <silent> <C-k> :move-2<cr>gv

"" l
""=====================================

" inoremap <Leader><C-l> *
" indent line
" nnoremap <silent> <leader>l >>
" xnoremap <silent> <leader>l >gv

" add line break in markdown
autocmd Filetype markdown noremap <leader>lb i---<CR><Esc>

"" m
""=====================================

" open the current file in Marked 2.
"nnoremap <leader>m :silent !open -a Marked\ 2.app '%:p'<cr>


"" n
""=====================================

" Open NERDTree
nnoremap <Leader>n :NERDTreeToggle<Enter>

" Open NERDTree to current file
nnoremap <silent> <Leader>nf :NERDTreeFind<CR>

" count all occurances in file of word under cursor
nnoremap <Leader>N :%s/<C-R>=expand('<cword>')<CR>//n<CR>

" next search result will be centered on the screen
"nnoremap n nzzzv

" previous search result will be centered on the screen
"nnoremap N Nzzzv

" make n always search forward and N backward
"nnoremap <expr> n 'Nn'[v:searchforward]
"nnoremap <expr> N 'nN'[v:searchforward]

"" o
""=====================================

" Add a blank line below current without entering insert mode
nnoremap <Leader>o m`o<Esc>``

" Add a blank line above current without entering insert mode
nnoremap <Leader>O m`O<Esc>``



"" p
""=====================================


" Paste from the system clipboard
noremap <leader>p "+gp
" install plugins
nnoremap <Leader>pi :PlugInstall<CR>
" update plugins
nnoremap <Leader>pu :PlugUpdate<CR>
" delete old plugins
nnoremap <Leader>pc :PlugClean<CR>
" update plugins
nnoremap <Leader>pwd :!ls %:p<CR>

"" q
""=====================================

" quit
nnoremap <Leader>q :q<cr>
" quit without saving
nnoremap <Leader>Q :qa!<cr>
" replay q macro
nnoremap Q @q

"" r
""=====================================

" reload vimrc file
map <Leader>rlv :so $MYVIMRC<CR>
" replace all occurances on line of word under cursor
nnoremap <Leader>r :s/<C-R>=expand('<cword>')<CR>/
" replace all occurances in file of word under cursor
nnoremap <Leader>R :%s/<C-R>=expand('<cword>')<CR>/

"" s
""=====================================

" replace in line
nnoremap <Leader>s :s/
" replace in entire file
nnoremap <Leader>S :%s/
" sort highlighted lines
vnoremap s :sort<CR>
" sort words on single line
vnoremap S :s/\s\+/\r/g<CR>:'[,sort<CR>:,']j<CR>
  ":s/\s\+/\r/g " break the line into multiple ones
  ":'[,sort " sort them
  ":,']j " join them
" set paste mode
nnoremap <Leader>sp :set paste<CR>
" inoremap <Leader><C-s> )

"" t
""=====================================

" open tag fuzzy finder (fzf)
"nmap <Leader>t :Tags<CR>
" open terminal in horizontal split
" nmap <Leader>t :split<CR>:terminal<CR>i

"" u
""=====================================


"" v
""=====================================

" open vim commands file fuzzy finder (fzf)
nmap <leader>vc :Commands<CR>

"" w
""=====================================
" write buffer in normal mode
noremap <Leader>w :w<cr>
" write buffer and quit in normal mode
nnoremap <Leader>W :wq<cr>

"" y
""=====================================

" search previously copied text
nmap <Leader>y :YRShow<cr>
" Yank a line with Y.
nnoremap Y y$

"" z
""=====================================

" replaces last misspelled word with 1st correct suggestion
noremap zC [s1z=
" replaces next misspelled word with 1st correct suggestion
noremap zc ]s1z=

"" symbols
""=====================================

" Use incsearch.vim and EasyMotion for every search
" https://github.com/haya14busa/incsearch-easymotion.vim
"map / <Plug>(incsearch-easymotion-/)
"map ? <Plug>(incsearch-easymotion-?)
"map g/ <Plug>(incsearch-easymotion-stay)

map / <Plug>(incsearch-easymotion-/)
map ? <Plug>(incsearch-easymotion-?)
map g/ <Plug>(incsearch-easymotion-stay)

" split screen horizontally
nnoremap <leader>= :split<cr>
" split screen horizontally
nnoremap <leader>\| :vsplit<cr>

" With this mappings, if 'smartcase' is on and you press * while on the word "The", you will only find "The" (case sensitive), but if you press * while on the word "the", the search will not be case sensitive.
nnoremap * /\<<C-R>=expand('<cword>')<CR>\><CR>
" un-highlights all words
nnoremap <leader>* :noh<CR> 

" Better mark jumping (line + col)
nnoremap ' `
" Use `` to change the case of a character
noremap `` ~i<esc>

" Use '' as " to avoid using shift
" inoremap '' "
" Use ,, as < to avoid using shift
" inoremap ,, <
" Use .. as > to avoid using shift
" inoremap .. >
" Use ;; as : to avoid using shift
" inoremap ;; :
" Use [[ as { to avoid using shift
" inoremap [[ {
" Use \\ as | to avoid using shift
" inoremap \\ \|
" Use ]] as } to avoid using shift
" inoremap ]] }
" Use `` as ~ to avoid using shift
" inoremap `` ~

" Open tag in a new split
nnoremap <silent><leader><c-]> <c-w><c-]>

" search google for word under cursor
" nnoremap <leader>? :call <SID>goog(expand("<cWORD>"), 0)<cr>
" xnoremap <leader>? "gy:call <SID>goog(@g, 0)<cr>gv

" open 'I feel lucky' google result for word under cursor
"nnoremap <silent><localleader>? :call <SID>goog(expand("<cWORD>"), 0)<cr>
"nnoremap <silent><localleader>! :call <SID>goog(expand("<cWORD>"), 1)<cr>
"xnoremap <silent><localleader>? "gy:call <SID>goog(@g, 0)<cr>gv
"xnoremap <silent><localleader>! "gy:call <SID>goog(@g, 1)<cr>gv

" Stay in visual mode when indenting.
vnoremap < <gv
vnoremap > >gv

" make ; and , be on the same key so that I can find using same key
"nnoremap : ,
"nnoremap ' :
"nnoremap ` '


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" _Cursor
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set cursorline   " Highlight current line
set scrolloff=2  " 2 lines above/below at top/bottom
set mouse=       " prevents mouse clicks to move cursor

"" Disable Motion Effects to force use of vim motions

" Disables arrow keys from moving cursor in normal mode
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap <up> <nop>

" Disables arrow keys from moving cursor in insert mode
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
inoremap <up> <nop>

" Prevents trackpad / scroll-wheel from moving cursor
:nmap <C-ScrollWheelDown> <nop>
:nmap <C-ScrollWheelLeft> <nop>
:nmap <C-ScrollWheelRight> <nop>
:nmap <C-ScrollWheelUp> <nop>
:nmap <S-ScrollWheelDown> <nop>
:nmap <S-ScrollWheelLeft> <nop>
:nmap <S-ScrollWheelRight> <nop>
:nmap <S-ScrollWheelUp> <nop>
:nmap <ScrollWheelDown> <nop>
:nmap <ScrollWheelLeft> <nop>
:nmap <ScrollWheelRight> <nop>
:nmap <ScrollWheelUp> <nop>


" Disable Ctrl-Space while I overcome muscle memory
inoremap <C-Space> <nop>

" Forces you to enter a count for each of the basic motions ("h", "j", "k", "l")
" Alternate method can be found at:
" http://jeetworks.org/from-acolyte-to-adept-the-next-step-after-nop-ing-arrow-keys/
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! ToggleDisablingOfNonCountedBasicMotions :call ToggleDisablingOfBasicMotionsIfNonCounted()
command! DisableNonCountedBasicMotions :call SetDisablingOfBasicMotionsIfNonCounted(1)
command! EnableNonCountedBasicMotions :call SetDisablingOfBasicMotionsIfNonCounted(0)

function! DisableIfNonCounted(move) range
    if v:count
        return a:move
    else
        " You can make this do something annoying like:
        " echoerr "Count required!"
        " sleep 2
        return ""
    endif
endfunction

function! SetDisablingOfBasicMotionsIfNonCounted(on)
    let keys_to_disable = get(g:, "keys_to_disable_if_not_preceded_by_count", ["j", "k", "l", "h"])
    if a:on
        for key in keys_to_disable
            execute "noremap <expr> <silent> " . key . " DisableIfNonCounted('" . key . "')"
        endfor
        let g:keys_to_disable_if_not_preceded_by_count = keys_to_disable
        let g:is_non_counted_basic_motions_disabled = 1
    else
        for key in keys_to_disable
            try
                execute "unmap " . key
            catch /E31:/
            endtry
        endfor
        let g:is_non_counted_basic_motions_disabled = 0
    endif
endfunction

function! ToggleDisablingOfBasicMotionsIfNonCounted()
    let is_disabled = get(g:, "is_non_counted_basic_motions_disabled", 0)
    if is_disabled
        call SetDisablingOfBasicMotionsIfNonCounted(0)
    else
        call SetDisablingOfBasicMotionsIfNonCounted(1)
    endif
endfunction
:DisableNonCountedBasicMotions

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" _Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin on " enable plugins

"======================================
" Vim Plug:
" https://github.com/junegunn/vim-plug
" A minimalist Vim plugin manager.
"======================================

call plug#begin('~/.local/share/nvim/plugged')

" Experimental Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Plug 'deoplete-plugins/deoplete-clang'
Plug 'zchee/deoplete-clang', {'for': ['c','cpp','cmake'], 'do':'pip install clang'}

" More Pleasant Editing on Commit Message
Plug 'rhysd/committia.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim-polyglot
" A collection of language packs for Vim.
" https://github.com/sheerun/vim-polyglot
Plug 'sheerun/vim-polyglot'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Incsearch:
" Improved incremental searching
" https://github.com/haya14busa/incsearch.vim
Plug 'haya14busa/incsearch.vim'

" Fuzzy find search and jump to result
" https://github.com/haya14busa/incsearch-easymotion.vim
Plug 'haya14busa/incsearch-easymotion.vim'
"Plug 'haya14busa/incsearch-fuzzy.vim'

function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzyword#converter()],
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Easy Motion:
" https://github.com/easymotion/vim-easymotion
" highlights all possible choices and allows you to press one key to jump directly to a target letter.
"======================================
Plug 'easymotion/vim-easymotion'
let g:EasyMotion_keys = 'asdfjkl'
let g:EasyMotion_smartcase = 1
let g:EasyMotion_space_jump_first = 1 | " jump to first match ('a') by pressing space

" Instructions
" 1. <leader><leader>s to bring up Easy Motion menu.
" 2. type the character that you want to jump to.
" 3. type the highlighted character that is in the location that you want to jump to

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" context.vim
" shows current function and loops or conditions that is surrounding the visible code.
" https://github.com/wellle/context.vim
Plug 'wellle/context.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Abolish:
" https://github.com/tpope/vim-abolish
" Work with variants of words.
" Autocomplete commonly misspelled words
" Easily search for, substitute, and abbreviate multiple variants of a word
" Transform words between many different cases
Plug 'tpope/vim-abolish'

" let g:abolish_save_file = expand("~/.local/share/nvim/plugged/vim-abolish/.abolish")

" Instructions
" Create a file: ~/.vim/after/plugin/abolish.vim with contents \"source <path_to_dotfiles_repo/.abolish>"
" In abolish_save_file added substitutions
" Ex.
" Abolish teh the
" Abolish anomol{y,ies} anomal{}

" Coercion:
" Included in Abolish
" snake_case (crs):       fooBar -> foo_bar
" MixedCase (crm):        foo_bar -> FooBar
" camelCase (crc):        foo_bar -> fooBar
" UPPER_CASE (cru):       fooBar -> FOO_BAR
" dash-case (cr-):        fooBar -> foo-bar
" dot.case (cr.):         fooBar -> foo.bar
" space case (cr<space>): fooBar -> foo bar
" Title Case (crt):       fooBar -> Foo Bar

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ALE:
" https://github.com/w0rp/ale
"  Checks the contents of text buffers and return linting errors as text is changed in Vim
Plug 'w0rp/ale'

""" ALE Settings
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
highlight link ALEWarningSign String
highlight link ALEErrorSign Title
let g:ale_completion_enabled = 1| " Enable completion where available.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Autopairs:
" https://github.com/jiangmiao/auto-pairs
" Automatically add closing pair
Plug 'jiangmiao/auto-pairs'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" CamelCaseMotion:
" https://github.com/bkad/CamelCaseMotion
" Defines motions to move Camel-wise; i.e. to word boundaries, uppercase letters and underscores
Plug 'bkad/CamelCaseMotion'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorschemes:

"" Dracula: https://github.com/dracula/dracula-theme
Plug 'dracula/vim', { 'as': 'dracula' }

" Gruvbox: Retro groove color scheme for Vim
" https://github.com/morhetz/gruvbox
Plug 'morhetz/gruvbox'

" Gruvbox Material: a modified version of Gruvbox, the contrast is adjusted to be softer in order to protect developers' eyes.
Plug 'sainnhe/gruvbox-material'
" important!!
" set termguicolors

" for dark version
" set background=dark

" for light version
" set background=light

" set contrast
" this configuration option should be placed before `colorscheme gruvbox-material`
" available values: 'hard', 'medium'(default), 'soft'
" let g:gruvbox_material_background = 'soft'

" colorscheme gruvbox-material

" lite-brite: a heavily customized dark color scheme for Vim designed to provide a consistent experience for a variety of file types.
"https://github.com/noprompt/lite-brite
Plug 'noprompt/lite-brite'

" Onedark: dark Vim/Neovim color scheme inspired by Atom's One Dark syntax theme
" https://github.com/joshdick/onedark.vim
Plug 'joshdick/onedark.vim'

"" Nord: An arctic, north-bluish clean and elegant Vim color theme.
Plug 'arcticicestudio/nord-vim'

" Snow: a blue-tinted winter vimscape
" https://github.com/nightsense/snow
Plug 'nightsense/snow'

" Solarized: Color scheme for vim
" https://github.com/altercation/vim-colors-solarized
Plug 'altercation/vim-colors-solarized'

" SpaceCamp: Vim colors for the final frontier
" https://github.com/jaredgorski/SpaceCamp
Plug 'jaredgorski/SpaceCamp'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Commentary:
" https://github.com/tpope/vim-commentary
" easily comment and uncomment using map and numbers
Plug 'tpope/vim-commentary'

" Instructions:
" gcc comments/uncomments single line
" gcu uncomments connected commented lines
"
" You can also use numbers and motion keys

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Deoplete:
" https://github.com/Shougo/deoplete.nvim
" extensible and asynchronous auto-completion framework

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

let g:deoplete#custom#enable_smart_case = 1
let g:deoplete#custom#source = ['neosnippet', 'tag', 'buffer', 'member', 'tabnine', 'LanguageClient']
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#clang_header = '/usr/local/Cellar/llvm/11.0.0/lib/clang/11.0.0/include/'
let g:deoplete#sources#clang#libclang_path = '/usr/local/Cellar/llvm/11.0.0/lib/libclang.dylib'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" EasyAlign:
" easy-to-use plugin to align text .
" https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Instructions:
" activate EasyAlign (ga) followed by the character that you want to align with

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Fzf:
" https://github.com/junegunn/fzf.vim
" a vim plugin for fzf
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Gitgutter:
" https://github.com/airblade/vim-gitgutter
" shows a git diff in the 'gutter' (sign column) showing which lines have been added, modified, or removed
"======================================
Plug 'airblade/vim-gitgutter'

" Instructions:
" jump to previous change in file: [c
" jump to next change in file:     ]c
" The . command will work with both these if repeat.vim is installed.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" IndentLine:
" https://github.com/Yggdroot/indentLine
" displaying thin vertical lines at each indentation level for code indented with spaces.

Plug 'Yggdroot/indentLine', { 'on': 'IndentLinesEnable' }


" enable at startup
let g:indentLine_enabled = 1
autocmd! User indentLine doautocmd indentLine Syntax

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Language Server:
" The Language Server Protocol (LSP) defines the protocol used between an editor or IDE and a language server that provides language features like auto complete, go to definition, find all references etc. 
" https://github.com/autozimu/LanguageClient-neovim

" Enables neovim support for Language Server Protocol.
" Requires neovim.
    Plug 'autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'zsh install.sh',
    \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Nerdtree:
" a file system explorer
" https://github.com/scrooloose/nerdtree
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

" Nerdtree Git:
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" RainbowParentheses:
" Easily identify matching parenthesis based on matching colors
" https://github.com/junegunn/rainbow_parentheses.vim
"Plug 'junegunn/rainbow_parentheses.vim' " Rainbow Parentheses
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1
let g:RainbowParenthesesToggleOn = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Repeat:
" Repeat.vim remaps . in a way that plugins can tap into it.
" https://github.com/tpope/vim-repeat
Plug 'tpope/vim-repeat'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Speeddating:
" Speed Dating use CTRL-A/CTRL-X to increment dates, times, and more
" https://github.com/tpope/vim-speeddating
Plug 'tpope/vim-speeddating'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Surround:
" https://github.com/tpope/vim-surround
" provides mappings to easily delete, change and add surroundings characters in pairs.

Plug 'tpope/vim-surround'

" Usage:
"   cs"'        =   change surroundings (from) " to '
"   cst"        =   change surroundings TO "
"   ds"         =   delete (from) surroundings "
"   ysiw]       =   YOOM surroundings (in word) ], producing [foo]
"   yss)        =   YOOM the entire line with )
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" TabNine:
" TabNine is the all-language autocompleter. It uses machine learning to provide responsive, reliable, and relevant suggestions.
" https://tabnine.com

Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Tmux Navigator:
" https://github.com/christoomey/vim-tmux-navigator
" allows you to navigate seamlessly between vim and tmux splits using a consistent set of hotkeys.
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" UltiSnips:
" https://github.com/SirVer/ultisnips
" Snippet Manager
"======================================
"" Track the engine.
"Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
"Plug 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"let g:UltiSnipsSnippetDirectories = ['UltiSnips', $HOME.'.config/nvim/snippets']

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

"======================================
" Yank Ring:
" https://github.com/vim-scripts/YankRing.vim
" Maintains a history of previous yanks, changes and deletes
"======================================
Plug 'vim-scripts/YankRing.vim'

" Instructions:
" Display the contents of the yankring. :YRShow

" Commenting out line below sets use of vertical split
" let g:yankring_window_use_horiz = 0

" Set width of vertical split
" let g:yankring_window_width = 100

" Set height of horizontal split
let g:yankring_window_width = 100

call plug#end()
