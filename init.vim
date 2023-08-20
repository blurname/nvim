set termguicolors
let g:mapleader=' '

lua require('m-packer')
lua require('index')
lua require('vim-index')
source /home/bl/.config/nvim/vim/index.vim

" ===
" === Basic
" ===

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
" set clipboard=unnamedplus
"set cmdheight=0
"colorscheme everforest
colorscheme nordfox
"let g:everforest_background = 'hard'

" Save & quit
noremap s <nop>
noremap q: <nop>

" Open the vimrc file anytime
" let a = stdpath("config")

noremap <c-a> ggVG

" Search
noremap <LEADER><CR> :nohlsearch<CR>

" ===
" === terminalHelp
" ===

let g:terminal_shell = 'elvish'

" Comment.nvim
" map <c-_> instead of <c-/>
vnoremap <c-_> <Plug>(comment_toggle_linewise_visual)
nnoremap <c-_> <Plug>(comment_toggle_linewise_current)

"au ModeChanged *:s set clipboard=
"au ModeChanged s:* set clipboard=unnamedplus
map <leader>3 <Cmd>b #<CR>

" switch between current and last
let g:last_tab = tabpagenr()
au TabLeave * let g:last_tab = tabpagenr()
nnoremap <silent><leader><tab> :execute "tabnext " . g:last_tab<cr>
