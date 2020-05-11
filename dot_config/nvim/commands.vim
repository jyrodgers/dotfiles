"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

command! MakeTags !ctags -R
command! FindErrors /error\|fail\|severe
command! RemoveTrailingSpaces :%s/\s\+$//
command! Sortline call setline(line('.'),join(sort(split(getline('.'))), ' '))
