
" OSYank
" nmap <leader>c <Plug>OSCYankOperator
" nmap <leader>cc <leader>c_
" vmap <leader>c <Plug>OSCYankVisual

" y 粘贴到剪切板
" https://github.com/ojroques/vim-oscyank#usage
autocmd TextYankPost *
    \ if v:event.operator is 'y' |
    \ execute 'OSCYankRegister ""' |
    \ endif
