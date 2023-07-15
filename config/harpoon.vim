
" ============ harpoon ==========
nnoremap <silent><leader>9 :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <A-m> :lua require("harpoon.mark").add_file()<CR>
nnoremap <silent><A-1> :lua require("harpoon.ui").nav_prev()<CR>
nnoremap <silent><A-2> :lua require("harpoon.ui").nav_next()<CR>
autocmd FileType harpoon nnoremap <buffer><silent> 1 :lua require('harpoon.ui').nav_file(1)<CR>
autocmd FileType harpoon nnoremap <buffer><silent> 2 :lua require('harpoon.ui').nav_file(2)<CR>
autocmd FileType harpoon nnoremap <buffer><silent> 3 :lua require('harpoon.ui').nav_file(3)<CR>
autocmd FileType harpoon nnoremap <buffer><silent> 4 :lua require('harpoon.ui').nav_file(4)<CR>
autocmd FileType harpoon nnoremap <buffer><silent> 5 :lua require('harpoon.ui').nav_file(5)<CR>
autocmd FileType harpoon nnoremap <buffer><silent> 6 :lua require('harpoon.ui').nav_file(6)<CR>
autocmd FileType harpoon nnoremap <buffer><silent> 7 :lua require('harpoon.ui').nav_file(7)<CR>
autocmd FileType harpoon nnoremap <buffer><silent> 8 :lua require('harpoon.ui').nav_file(8)<CR>
autocmd FileType harpoon nnoremap <buffer><silent> 9 :lua require('harpoon.ui').nav_file(9)<CR>
