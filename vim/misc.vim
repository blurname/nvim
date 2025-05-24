
" get file path releated
function GetFilePathLine()
  let pathLine = expand("%") . ':' . line(".")
  let @" = pathLine
  echo pathLine
  execute 'silent OSCYankRegister ""'
endfunc

nmap <leader>\ :call GetFilePathLine()<CR>
command! -nargs=0 GetFilePathLineCommand call GetFilePathLine()

" command! GetFilePathRelative :let @" = expand("%")
" command! GetFilePathAbsolute :let @" = expand("%:p")

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

noremap <silent><c-e> <c-u>

noremap <silent><M-e> :call Tools_PreviousCursor(6)<cr>
noremap <silent><M-d> :call Tools_PreviousCursor(7)<cr>
inoremap <silent><M-e> <c-\><c-o>:call Tools_PreviousCursor(6)<cr>
inoremap <silent><M-d> <c-\><c-o>:call Tools_PreviousCursor(7)<cr>

noremap <silent><M-up> :call Tools_PreviousCursor(6)<cr>
noremap <silent><M-down> :call Tools_PreviousCursor(7)<cr>
inoremap <silent><M-up> <c-\><c-o>:call Tools_PreviousCursor(6)<cr>
inoremap <silent><M-down> <c-\><c-o>:call Tools_PreviousCursor(7)<cr>

noremap <silent><m-2> :tabn 2<cr>
noremap <silent><m-1> :tabn 1<cr>
noremap <silent><m-3> :tabn 3<cr>
noremap <silent><m-4> :tabn 4<cr>

" ===
" move line up/donw
" ===
noremap <m-j> :m +1<CR>
noremap <m-k> :m -2<CR>

" move key
noremap W 5w
noremap B 5b
noremap H ^
" https://www.reddit.com/r/vim/comments/2xsl9i/why_does_in_visual_mode_goes_after_the_last/?rdt=47792
noremap L g_
" Copy to system clipboard
" vnoremap <LEADER>y "+y
" noremap <floatingLEADER>p "+p

function! JumpToFileAndLine(file_and_line)
    " 拆分文件名和行号
    let parts = split(a:file_and_line, ':')
    let file = parts[0]
    let line = parts[1]

    " 打开文件并跳转到指定行
    execute 'e ' . fnameescape(file) | execute 'normal! ' . line . 'G'
endfunction

" 定义命令来调用函数
command! -nargs=1 JumpTo call JumpToFileAndLine(<f-args>)
function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
      top copen
    else
        cclose
    endif
endfunction

nnoremap <silent> <leader>q :call ToggleQuickFix()<cr>
nmap <C-F> :Grepper -noprompt -tool rg -cword<CR><CR>

nnoremap <nowait><silent>q <plug>(GrepperOperator)
xnoremap <nowait><silent>q <plug>(GrepperOperator)

command! -nargs=0 ListLog :GrepperRg blue]-
" nnoremap ss viw:%s/<C-R>"//g<Left><Left>
