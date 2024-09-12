
" ===
" === Use <alt> + new arrow keys for moving the cursor around windows
" ===
noremap <A-j> <C-w>j
noremap <A-k> <C-w>k
noremap <A-h> <C-w>h
noremap <A-l> <C-w>l
noremap <A-i> <C-i>
noremap <A-o> <C-o>
"
" Resize splits with arrow keys
noremap <down> :res -5<CR>
noremap <up> :res +5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>


" move current window to new tab
noremap tn <C-w>T

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
" noremap sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
" noremap sj :set splitbelow<CR>:split<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sl :set splitright<CR>:vsplit<CR>


noremap <c-s> :wa<CR>
