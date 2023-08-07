
" auto reload when file changed
" path1
" problem: will cause TSServer error
"if ! exists("g:CheckUpdateStarted")
"let g:CheckUpdateStarted=1
"call timer_start(1,'CheckUpdate')
"endif
"function! CheckUpdate(timer)
"silent! checktime
"call timer_start(1000,'CheckUpdate')
"endfunction

" path2
" not relaod immedately
set autoread
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
autocmd FileChangedShellPost *
      \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
