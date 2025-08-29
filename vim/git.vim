" nnoremap <leader>gg :LazyGit<CR>
nnoremap <leader>ge :Gedit<CR>

nnoremap <leader>gl V \| :'<,'>DiffviewFileHistory<CR>
" nnoremap <leader>gb :Leaderf git blame<cr>
command! DiffviewHead :DiffviewOpen HEAD~1<CR>

" visual line
vnoremap <leader>gl :'<,'>DiffviewFileHistory<CR>
" current Line
" nnoremap gl :normal! V^\<CR>:DiffviewFileHistory\<CR> 

nnoremap  <leader>v :Neotree position=float reveal<CR>
