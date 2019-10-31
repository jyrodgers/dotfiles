"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" The leader is the key to initiate custom shortcuts
" http://learnvimscriptthehardway.stevelosh.com/chapters/06.html
let mapleader = "\<space>"

"" a
""=====================================

" nnoremap <leader>a :A<CR>|  " uses a.vim to switch between source and header files or vice versa
" nnoremap <leader>A :AV<CR>| " uses a.vim to switch between source and header files or vice versa in a vertical split
nnoremap <leader>a :Ag<CR>|" uses ag to search through file contents, '?' to preview file
nmap <leader>ai mzgg=G`z| " auto indent: will 'fix' identing for the entire file

" inoremap <Leader><C-a> (

"" b
""=====================================
autocmd Filetype markdown nnoremap <buffer> <silent> <leader>b :keeppatterns s/^/-\ /e<CR>
autocmd Filetype markdown nnoremap <buffer> <silent> <leader>B :call ToggleBullet()<CR>

"" c
""=====================================

nnoremap <leader>cwd :lcd %:p:h<CR>|  " Change working directory to the directory of the current file

" add/complete/uncomplete tasks in markdown files
autocmd Filetype markdown nnoremap <buffer> <silent> <leader>c :keeppatterns s/^/-\ [\ ]\ /e<CR>
autocmd Filetype markdown nnoremap <buffer> <silent> <leader>C :call ToggleCheckmark()<CR>

"" d
""=====================================

"" e
""=====================================

" nmap <Leader>e <Leader><Leader>s| " trigger easy motion

" EasyMotion
map  <Leader>; <Plug>(easymotion-bd-f)|       " Move to character with EasyMotion
nmap <Leader>; <Plug>(easymotion-overwin-f)|  " Move to character with EasyMotion
" map  <Leader>ew <Plug>(easymotion-bd-w)|" Move to word with EasyMotion
" nmap <Leader>ew <Plug>(easymotion-overwin-w)|" Move to word with EasyMotion
" map <Leader>el <Plug>(easymotion-bd-jk)|" Move to line with EasyMotion
" nmap <Leader>el <Plug>(easymotion-overwin-line)|" Move to line with EasyMotion


"" f
""=====================================

nmap <Leader>f :Files<CR>|  " open file search fuzzy finder (fzf)

"" g
""=====================================

map <leader>gf <leader>cwd :e <cfile><cr>|  " create the file whose file name under cursor and jump to it
nnoremap <C-]> g<C-]>| " show all tag options by default

"" h
""=====================================

" add/remove headers in markdown files
autocmd Filetype markdown nnoremap <buffer> <silent> <leader>H :keeppatterns s/^/#/e<cr>
autocmd Filetype markdown xnoremap <buffer> <silent> <Leader>H :<c-u>keeppatterns '<,'>g/^#/keeppatterns s/^#/##/<cr>
autocmd Filetype markdown nnoremap <buffer> <silent> <Leader>h :keeppatterns s/^#//e<cr>
autocmd Filetype markdown xnoremap <buffer> <silent> <Leader>h :<c-u>keeppatterns '<,'>g/^#/keeppatterns s/^#//<cr>

nmap <Leader>hc :History:<CR>|    " open recent command file fuzzy finder (fzf)
nmap <Leader>hf :History<CR>|     " open recent file fuzzy finder (fzf)
nmap <Leader>hs :History/<CR>|    " open recent search file fuzzy finder (fzf)
nnoremap <silent> <leader>h <<|   " dedent line
xnoremap <silent> <leader>h <gv|  " dedent line

" inoremap <Leader><C-h> [
" inoremap <Leader><C-H> {

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

nnoremap J mjJ`j |              " Join lines and restore cursor location
" cmap jk <ESC>|                  " 'jk' switches command to normal mode
" inoremap jk <ESC>|              " 'jk' switches insert to normal mode
" vnoremap jk <ESC>|              " 'jk' switches visual to normal mode
" xnoremap jk <ESC>|              " 'jk' switches visual to normal mode
nnoremap <leader>j i<CR><Esc>|  " split line
" nnoremap <silent> <C-j> :move+<cr>| " move line down
" xnoremap <silent> <C-j> :move'>+<cr>gv| " move line down
" inoremap <Leader><C-j> ]
" inoremap <Leader><C-J> }

"" k
""=====================================

" inoremap <Leader><C-k> &
" nnoremap <silent> <C-k> :move-2<cr>| " move line up
" xnoremap <silent> <C-k> :move-2<cr>gv| " move line up

"" l
""=====================================


" inoremap <Leader><C-l> *
nnoremap <silent> <leader>l >>|                             " indent line
xnoremap <silent> <leader>l >gv|                            " indent line
autocmd Filetype markdown noremap <leader>lb i---<CR><Esc>| " add line break

"" m
""=====================================


"nnoremap <leader>m :silent !open -a Marked\ 2.app '%:p'<cr>|" open the current file in Marked 2.


"" n
""=====================================


nnoremap <Leader>n :NERDTreeToggle<Enter>|                  " Open NERDTree
nnoremap <silent> <Leader>nf :NERDTreeFind<CR>|             " Open NERDTree to current file
nnoremap <Leader>N :%s/<C-R>=expand('<cword>')<CR>//n<CR>|  " count all occurances in file of word under cursor
nnoremap n nzzzv|                                           " next search result will be centered on the screen
nnoremap N Nzzzv|                                           " next search result will be centered on the screen

"" o
""=====================================


"" p
""=====================================


noremap <leader>p "+gp|               " Paste from the system clipboard
nnoremap <Leader>pi :PlugInstall<CR>| " install plugins
nnoremap <Leader>pu :PlugUpdate<CR>|  " update plugins
nnoremap <Leader>pc :PlugClean<CR>|   " delete old plugins
nnoremap <Leader>pwd :!ls %:p<CR>|    " update plugins

"" q
""=====================================

nnoremap <Leader>q :q<cr>|    " quit
nnoremap <Leader>Q :qa!<cr>|  " quit without saving
nnoremap Q @q|                " replay q macro

"" r
""=====================================

map <Leader>rlv :so $MYVIMRC<CR>|                     " reload vimrc file
nnoremap <Leader>r :s/<C-R>=expand('<cword>')<CR>/|   " replace all occurances on line of word under cursor
nnoremap <Leader>R :%s/<C-R>=expand('<cword>')<CR>/|  " replace all occurances in file of word under cursor

"" s
""=====================================

nnoremap <Leader>s :s/|                               " replace in line
nnoremap <Leader>S :%s/|                              " replace in entire file
vnoremap s :sort<CR>|                                 " sort highlighted lines
vnoremap S :s/\s\+/\r/g<CR>:'[,sort<CR>:,']j<CR>|     " sort words on single line
  ":s/\s\+/\r/g " break the line into multiple ones
  ":'[,sort " sort them
  ":,']j " join them
nnoremap <Leader>sp :set paste<CR>|                   " set paste mode
" inoremap <Leader><C-s> )

"" t
""=====================================

"nmap <Leader>t :Tags<CR>| " open tag fuzzy finder (fzf)
nmap <Leader>t :split<CR>:terminal<CR>i| " open terminal in horizontal split

"" u
""=====================================


"" v
""=====================================

nmap <leader>vc :Commands<CR>| " open vim commands file fuzzy finder (fzf)

"" w
""=====================================
noremap <Leader>w :w<cr>|     " write buffer in normal mode
nnoremap <Leader>W :wq<cr>|   " write buffer and quit in normal mode

"" y
""=====================================

nmap <Leader>y :YRShow<cr>|   " search previously copied text
nmap Y y$|                " Yank a line with Y.

"" z
""=====================================

noremap zC [s1z=|   " replaces last misspelled word with 1st correct suggestion
noremap zc ]s1z=|   " replaces next misspelled word with 1st correct suggestion

"" symbols
""=====================================

noremap <silent><expr><leader>/ incsearch#go(<SID>config_easyfuzzymotion())|  " Use incsearch.vim and EasyMotion for every search

nnoremap <leader>= :split<cr>|     " split screen horizontally
nnoremap <leader>\| :vsplit<cr>|   " split screen horizontally

nnoremap * /\<<C-R>=expand('<cword>')<CR>\><CR>| " With this mappings, if 'smartcase' is on and you press * while on the word "The", you will only find "The" (case sensitive), but if you press * while on the word "the", the search will not be case sensitive.
nnoremap <leader>* :noh<CR> | " un-highlights all words

nnoremap ' `| " Better mark jumping (line + col)
noremap `` ~i<esc>|      " Use `` to change the case of a character

inoremap '' "|     " Use '' as " to avoid using shift
inoremap ,, <|     " Use ,, as < to avoid using shift
inoremap .. >|     " Use .. as > to avoid using shift
inoremap ;; :|     " Use ;; as : to avoid using shift
inoremap [[ {|     " Use [[ as { to avoid using shift
inoremap \\ \||    " Use \\ as | to avoid using shift
inoremap ]] }|     " Use ]] as } to avoid using shift
inoremap `` ~|     " Use `` as ~ to avoid using shift

nnoremap <silent><leader><c-]> <c-w><c-]>| " Open tag in a new split

" search google for word under cursor
nnoremap <leader>? :call <SID>goog(expand("<cWORD>"), 0)<cr>
xnoremap <leader>? "gy:call <SID>goog(@g, 0)<cr>gv

" open 'I feel lucky' google result for word under cursor
nnoremap <leader>! :call <SID>goog(expand("<cWORD>"), 1)<cr>
xnoremap <leader>! "gy:call <SID>goog(@g, 1)<cr>gv

" Stay in visual mode when indenting.
vnoremap < <gv
vnoremap > >gv


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Moving Around
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set mouse= " prevents mouse clicks to move cursor

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


