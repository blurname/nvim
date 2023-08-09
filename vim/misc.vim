
" get file path releated
command! BlGetFilePathRelative :let @" = expand("%")
command! BlGetFilePathLine     :let @" = expand("%") . ':' . line(".")
command! BlGetFilePathAbsolute :let @" = expand("%:p")

command! Bda silent! execute "%bd|e#|bd#"

" 0:up, 1:down, 2:pgup, 3:pgdown, 4:top, 5:bottom
function! Tools_PreviousCursor(mode)
    if winnr('$') <= 1
        return
    endif
    noautocmd silent! wincmd p
    if a:mode == 0
        exec "normal! \<c-y>"
    elseif a:mode == 1
        exec "normal! \<c-e>"
    elseif a:mode == 2
        exec "normal! ".winheight('.')."\<c-y>"
    elseif a:mode == 3
        exec "normal! ".winheight('.')."\<c-e>"
    elseif a:mode == 4
        normal! gg
    elseif a:mode == 5
        normal! G
    elseif a:mode == 6
        exec "normal! \<c-u>"
    elseif a:mode == 7
        exec "normal! \<c-d>"
    elseif a:mode == 8
        exec "normal! k"
    elseif a:mode == 9
        exec "normal! j"
    endif
    noautocmd silent! wincmd p
endfunc

noremap <silent><M-u> :call Tools_PreviousCursor(6)<cr>
noremap <silent><M-d> :call Tools_PreviousCursor(7)<cr>
inoremap <silent><M-u> <c-\><c-o>:call Tools_PreviousCursor(6)<cr>
inoremap <silent><M-d> <c-\><c-o>:call Tools_PreviousCursor(7)<cr>
noremap <silent><m-2> :tabn 2<cr>
noremap <silent><m-1> :tabn 1<cr>
noremap <silent><m-3> :tabn 3<cr>
noremap <silent><m-4> :tabn 4<cr>

" ===
" move line up/donw
" ===
noremap <m-down> :m +1<CR>
noremap <m-up> :m -2<CR>

" move key
noremap W 5w
noremap B 5b
noremap H 0
noremap L $
" Copy to system clipboard
vnoremap <LEADER>y "+y
noremap <LEADER>p "+p

" nnoremap ss viw:%s/<C-R>"//g<Left><Left>
