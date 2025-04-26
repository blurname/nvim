" command! Grc :G rebase --continue
" command! Gra :G rebase --abort
" command! Gwip :G commit -am "WIP"
" command! Gl :DiffviewFileHistory<CR>
" command! Glfile :DiffviewFileHistory<CR>
" command! Glfuzzy :Telescope git_diffs  diff_commits

" nnoremap <leader>gg :LazyGit<CR>
nnoremap <leader>ge :Gedit<CR>

nnoremap <leader>gl V \| :'<,'>DiffviewFileHistory<CR>
" nnoremap <leader>gb :Leaderf git blame<cr>
command! DiffviewHead :DiffviewOpen HEAD~1<CR>

" visual line
vnoremap <leader>gl :'<,'>DiffviewFileHistory<CR>
" current Line
" nnoremap gl :normal! V^\<CR>:DiffviewFileHistory\<CR> 

