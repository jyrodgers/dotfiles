"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Macros
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

