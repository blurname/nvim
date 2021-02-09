
" set termguicolors
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set t_Co=256
set termguicolors

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

"set background=dark    " Setting dark mode
colors deus
let g:deus_termcolors=256

" ===
" === Basic Mappings
" ===
" Set <LEADER> as <SPACE>, ; as :
let mapleader =" "
noremap ; :
set exrc
set secure
set number
set relativenumber
set cursorline
set ignorecase
set smartcase
set wrap
set showcmd
set wildmenu

" Save & quit
noremap Q :q<CR>
noremap <C-q> :qa<CR>
noremap S :w<CR>
noremap R :source $MYVIMRC<CR>
" Open the vimrc file anytime
noremap <LEADER>rc :e $MYVIMRC<CR>

" Insert key
noremap h i
noremap H I

" move key
noremap j h
noremap k j
noremap i k
noremap K 5j
noremap I 5k
noremap W 5w
noremap B 5b
noremap J 0
noremap L $

" Ctrl + U or E will move up/down the view port without moving the cursor
noremap <C-i> 5<C-y>
noremap <C-k> 5<C-e>


" Resize splits with arrow keys
noremap <up> :res +5<CR>
noremap <down> :res -5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>

" searching
" ===
noremap - N
noremap = n

" ===
" === Use <space> + new arrow keys for moving the cursor around windows
" ===
noremap <LEADER>i <C-w>k
noremap <LEADER>k <C-w>j
noremap <LEADER>j <C-w>h
noremap <LEADER>l <C-w>l

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap si :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sk :set splitbelow<CR>:split<CR>
noremap sj :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sl :set splitright<CR>:vsplit<CR>
" Press <SPACE> + q to close the window below the current window
noremap <LEADER>q <C-w>j:q<CR>



" ===
" === Tab management
" ===
" Create a new tab with tu
noremap tl :tabe<CR>
" Move around tabs with tn and ti
noremap <C-j> :-tabnext<CR>
noremap <C-l> :+tabnext<CR>
" Move the tabs with tmn and tmi
" noremap tmn :-tabmove<CR>
" noremap tmi :+tabmove<CR>

" Search
noremap <LEADER><CR> :nohlsearch<CR>


" plugin
call plug#begin('~/AppData/Local/nvim/plugged')
Plug 'theniceboy/vim-deus'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" statusline
Plug 'theniceboy/eleline.vim'
Plug 'ojroques/vim-scrollstatus'
let g:scrollstatus_size = 15
call plug#end()


" ===
" === coc.nvim 
" ===
let g:coc_global_extensions = ['coc-json',
			\ 'coc-vimlsp',
			\ 'coc-html',
			\ 'coc-css',
			\ 'coc-tsserver',
			\ 'coc-explorer']
function! Show_documentation()
	call CocActionAsync('highlight')
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction
nnoremap <LEADER>o :call Show_documentation()<CR>
inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

noremap tt :CocCommand explorer<CR>

