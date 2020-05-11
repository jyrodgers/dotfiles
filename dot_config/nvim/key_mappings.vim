"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
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
autocmd Filetype markdown nnoremap <buffer> <silent> <leader>b :keeppatterns s/^/-\ /e<CR>
autocmd Filetype markdown nnoremap <buffer> <silent> <leader>B :call ToggleBullet()<CR>

"" c
""=====================================

" Change working directory to the directory of the current file
nnoremap <leader>cwd :lcd %:p:h<CR>

" add/complete/uncomplete tasks in markdown files
autocmd Filetype markdown nnoremap <buffer> <silent> <leader>c :keeppatterns s/^/-\ [\ ]\ /e<CR>
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
nnoremap <silent> <leader>h <<
" dedent line
xnoremap <silent> <leader>h <gv

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

" Join lines and restore cursor location
nnoremap J mjJ`j 
" 'jk' switches command to normal mode
" cmap jk <ESC>
" 'jk' switches insert to normal mode
" inoremap jk <ESC>
" 'jk' switches visual to normal mode
" vnoremap jk <ESC>
" 'jk' switches visual to normal mode
" xnoremap jk <ESC>
" split line
nnoremap <leader>j i<CR><Esc>
" move line down
" nnoremap <silent> <C-j> :move+<cr>
" move line down
" xnoremap <silent> <C-j> :move'>+<cr>gv
" inoremap <Leader><C-j> ]
" inoremap <Leader><C-J> }

"" k
""=====================================

" inoremap <Leader><C-k> &
" move line up
" nnoremap <silent> <C-k> :move-2<cr>
" move line up
" xnoremap <silent> <C-k> :move-2<cr>gv

"" l
""=====================================


" inoremap <Leader><C-l> *
" indent line
" nnoremap <silent> <leader>l >>
" indent line
" xnoremap <silent> <leader>l >gv
                                                            " add markdown link to visual selection
vnoremap <Leader>l c[ <C-r>" ](<C-R>=strftime("%Y%m%d%M")<cr>-<Esc>"*pli)<Esc>vi(uvi(:s/\%V\ /-/g<cr>gv<Esc>a.md<Esc>b
" add line break
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
" next search result will be centered on the screen
"nnoremap N Nzzzv
" make n always search forward and N backward
"nnoremap <expr> n 'Nn'[v:searchforward]
"nnoremap <expr> N 'nN'[v:searchforward]

"" o
""=====================================


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

" make ; always "find" forward and , backward
"nnoremap <expr> ; getcharsearch().forward ? ';' : ','
"nnoremap <expr> , getcharsearch().forward ? ',' : ';'

" make ; and , be on the same key so that I can find using same key
"nnoremap : ,
"nnoremap ' :
"nnoremap ` '



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


" Disable Ctrl-Space while I overcome muscle memory
inoremap <C-Space> <nop>
