set termguicolors
lua require('plugins')
lua require('door')
" ===
" === Basic Mappings
" ===
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   basic                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:mapleader=' '
let $FZF_DEFAULT_COMMAND = 'fd --type f --strip-cwd-prefix'
" noremap ; :
set exrc
set nobackup
set noswapfile
set secure
set number
set relativenumber
set cursorline
set ignorecase
set smartcase
set smartindent
set mouse=a
set nowritebackup
set showcmd
set wildmenu
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set ttimeoutlen=0
set modifiable
set signcolumn=yes:1
set pumblend=8
set title
"set cole=1
set fileencoding=utf-8
set splitright
set splitbelow
set foldlevel=99
set foldenable
set foldcolumn=1
set foldlevelstart=99
set foldopen-=hor "this causes horizontal movements (like l, h) to open folds.
filetype plugin on
"set winbar=%F
"set clipboard=unnamedplus
"set cmdheight=0
"colorscheme everforest
colorscheme nordfox
"let g:everforest_background = 'hard'

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

"set foldmethod=expr

" Save & quit
noremap s <nop>
noremap q: <nop>
autocmd! BufWritePost /home/bl/.config/nvim/* silent execute 'source /home/bl/.config/nvim/init.vim' | execute 'lua require("notify")("reload vimrc")'

command! -nargs=0 Resource source /home/bl/.config/nvim/init.vim  | echo 'reload nvimrc'
let $VIM_HOME = '/home/bl/.config/nvim'
source $VIM_HOME/config/cursor.vim
source $VIM_HOME/config/coc.vim
source $VIM_HOME/config/harpoon.vim
source $VIM_HOME/config/leaderf.vim
source $VIM_HOME/config/statusline.vim
" Open the vimrc file anytime
" let a = stdpath("config")

" move key
noremap W 5w
noremap B 5b
noremap H 0
noremap L $
" Copy to system clipboard
vnoremap <LEADER>y "+y
noremap <LEADER>p "+p

" Resize splits with arrow keys
noremap <down> :res -5<CR>
noremap <up> :res +5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>

" ===
" === Use <space> + new arrow keys for moving the cursor around windows
" ===
noremap <A-j> <C-w>j
noremap <A-k> <C-w>k
noremap <A-h> <C-w>h
noremap <A-l> <C-w>l


" ===
" move line up/donw
" ===
noremap <A-up> :m -2<CR>
noremap <A-down> :m +1<CR>

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sj :set splitbelow<CR>:split<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sl :set splitright<CR>:vsplit<CR>
" Press <SPACE> + q to close the window below the current window
noremap <C-w> :q<CR>

noremap <c-a> ggVG

"nnoremap <c-n> :%s/

" ===
" === Tab management
" ===
" Create a new tab with tl

" noremap tl :tabe<CR>
" Move around tabs with tn and ti
noremap th :-tabnext<CR>
noremap tl :+tabnext<CR>

" get file path releated
command! BlGetFilePathRelative :let @" = expand("%")
command! BlGetFilePathLine     :let @" = expand("%") . ':' . line(".")
command! BlGetFilePathAbsolute :let @" = expand("%:p")

command! Bda silent! execute "%bd|e#|bd#"
nnoremap <leader>w <cmd>bw<cr>
nnoremap <c-l> :BufferLineCycleNext<CR>
nnoremap <c-h> :BufferLineCyclePrev<CR>
"nnoremap ss :<C-u>%s/
nnoremap ss viw:%s/<C-R>"//g<Left><Left>

" move current window to new tab
noremap tn <C-w>T

" Move the tabs with tmn and tmi
"noremap :-tabmove<CR>
"noremap tl :+tabmove<CR>

" Search
noremap <LEADER><CR> :nohlsearch<CR>

" ===
" === terminalHelp
" ===
"let g:terminal_shell = 'elvish'

let g:terminal_shell = 'elvish'

"let g:closetag_filetypes = 'html,jsx,tsx'
"let g:closetag_xhtml_filetypes = 'html,jsx,tsx'

noremap <c-s> :wa<CR>
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Useful commands

""""""""""""""""""
"  nvim-hlslens  "
""""""""""""""""""
noremap <silent> n <Cmd>execute('normal! ' . v:count1 . 'n')<CR>
      \<Cmd>lua require('hlslens').start()<CR>
noremap <silent> N <Cmd>execute('normal! ' . v:count1 . 'N')<CR>
      \<Cmd>lua require('hlslens').start()<CR>
"noremap * *<Cmd>lua require('hlslens').start()<CR>
"noremap # #<Cmd>lua require('hlslens').start()<CR>
"noremap g* g*<Cmd>lua require('hlslens').start()<CR>
"noremap g# g#<Cmd>lua require('hlslens').start()<CR>

map *  <Plug>(asterisk-z*)<Cmd>lua require('hlslens').start()<CR>
map #  <Plug>(asterisk-z#)<Cmd>lua require('hlslens').start()<CR>
map g* <Plug>(asterisk-gz*)<Cmd>lua require('hlslens').start()<CR>
map g# <Plug>(asterisk-gz#)<Cmd>lua require('hlslens').start()<CR>
aug VMlens
  au!
  au User visual_multi_start lua require('vmlens').start()
  au User visual_multi_exit lua require('vmlens').exit()
aug END

"NERDCommenter
" map <c-_> instead of <c-/>
let g:NERDCreateDefaultMappings = 0
map <c-_> <plug>NERDCommenterToggle
"
"let g:NERDAltDelims_javascriptreact=1
"let g:NERDAltDelims_typescriptreact=1
"let g:NERDCustomDelimiters = { 'typescriptreact': { 'left': '//', 'leftAlt': '{/*', 'rightAlt': '*/}' },'javascriptreact': { 'left': '//', 'leftAlt': '{/*', 'rightAlt': '*/}' } }


"noremap <leader>gl :diffget //3<CR>
"noremap <leader>gh :diffget //2<CR>

"au ModeChanged *:s set clipboard=
"au ModeChanged s:* set clipboard=unnamedplus
map <leader>3 <Cmd>b #<CR>

nnoremap <leader>gg :LazyGit<CR>
nnoremap <leader>ge :Gedit<CR>


" initialize global keymap and declare prefix key
let g:navigator = {'prefix':'<LEADER><i>'}
nnoremap <silent><LEADER>; :Navigator g:navigator<cr>

" buffer management
let g:navigator.b = {
            \ 'name' : '+buffer' ,
            \ '1' : [':b1'        , 'buffer 1']        ,
            \ '2' : [':b2'        , 'buffer 2']        ,
            \ 'd' : [':bd'        , 'delete-buffer']   ,
            \ 'f' : [':bfirst'    , 'first-buffer']    ,
            \ 'h' : [':Startify'  , 'home-buffer']     ,
            \ 'l' : [':blast'     , 'last-buffer']     ,
            \ 'n' : [':bnext'     , 'next-buffer']     ,
            \ 'p' : [':bprevious' , 'previous-buffer'] ,
            \ '?' : [':Leaderf buffer'   , 'fzf-buffer']      ,
            \ }

" tab management
let g:navigator.t = {
            \ 'name': '+tab',
            \ '1' : ['<key>1gt', 'tab-1'],
            \ '2' : ['<key>2gt', 'tab-2'],
            \ '3' : ['<key>3gt', 'tab-3'],
            \ 'c' : [':tabnew', 'new-tab'],
            \ 'q' : [':tabclose', 'close-current-tab'],
            \ 'n' : [':tabnext', 'next-tab'],
            \ 'p' : [':tabprev', 'previous-tab'],
            \ 'o' : [':tabonly', 'close-all-other-tabs'],
            \ }

let g:navigator.p = {
            \ 'name': '+path',
            \ '1' : [':BlGetFilePathRelative','1'],
            \ '2' : [':BlGetFilePathLine','2'],
            \ '3' : [':BlGetFilePathAbsolute','3'],
            \ }

let g:navigator.f = {
            \ 'name': '+leaderf',
            \ '1' : [':Leaderf! rg --recall','rg recall'],
            \ '2' : [':Leaderf! file --recall','file recall'],
            \ }


nmap <leader>c <Plug>OSCYankOperator
nmap <leader>cc <leader>c_
vmap <leader>c <Plug>OSCYankVisual
