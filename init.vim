" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set t_Co=256
" set background=dark    " Setting dark mode

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let g:deus_termcolors=256
colorscheme deus
set termguicolors
"" lua require('zephyr')
" lua require('myline')
" ===
" === Basic Mappings
" ===
" Set <LEADER> as <SPACE>, ; as :
let mapleader =" "
" noremap ; :
set exrc
set secure
set number
set relativenumber
" set formatoptions
set cursorline
set ignorecase
set smartcase
set wrap
set showcmd
set wildmenu
set tabstop=2
set shiftwidth=2
set softtabstop=2
set foldenable
set autoindent
set ttimeoutlen=0
"set notimeout
" Save & quit
noremap Q :q<CR>
noremap <C-q> :qa<CR>
noremap S :w<CR>
noremap <LEADER>re :source $MYVIMRC<CR>
" Open the vimrc file anytime
noremap <LEADER>rc :e $MYVIMRC<CR>

" move key
noremap W 5w
noremap B 5b
noremap H 0
noremap L $
" Copy to system clipboard
vnoremap Y "+y


" Ctrl + U or E will move up/down the view port without moving the cursor
" noremap <C-i> 5<C-y>
" noremap <C-k> 5<C-e>

"source $XDG_CONFIG_HOME/nvim/cursor.vim


" Resize splits with arrow keys
noremap <up> :res -5<CR>
noremap <down> :res +5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>
" searching
" ===
" noremap - N
" noremap = n

" ===
" === Use <space> + new arrow keys for moving the cursor around windows
" ===
noremap <LEADER>k <C-w>k
noremap <LEADER>j <C-w>j
noremap <LEADER>h <C-w>h
noremap <LEADER>l <C-w>l

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sj :set splitbelow<CR>:split<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sl :set splitright<CR>:vsplit<CR>
" Press <SPACE> + q to close the window below the current window
noremap <LEADER>q <C-w>j:q<CR>


" ===
" === Tab management
" ===
" Create a new tab with tl
noremap tl :tabe<CR>
" Move around tabs with tn and ti
noremap <C-k> :-tabnext<CR>
noremap <C-j> :+tabnext<CR>
" Move the tabs with tmn and tmi
" noremap tmn :-tabmove<CR>
" noremap tmi :+tabmove<CR>

" Search
noremap <LEADER><CR> :nohlsearch<CR>


let g:plug_url_format = 'https://git::@github.com.cnpmjs.org/%s.git'

" plugin
call plug#begin('~/.vim/bundle/')
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'skywind3000/vim-terminal-help'
 Plug 'skywind3000/asynctasks.vim'
 Plug 'skywind3000/asyncrun.vim'
 Plug 'gcmt/wildfire.vim'
 Plug 'Yggdroot/LeaderF',{'do':':LeaderfInstallCExtension'}
 Plug 'theniceboy/eleline.vim'
"  Plug 'ojroques/vim-scrollstatus'
 Plug 'jiangmiao/auto-pairs'
 Plug 'tomtom/tcomment_vim'
 Plug 'justinmk/vim-sneak'
"  Plug 'glepnir/zephyr-nvim'
 Plug 'nvim-treesitter/nvim-treesitter'
"  Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
" Plug 'kyazdani42/nvim-web-devicons'
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
call plug#end()
let g:scrollstatus_size = 15
"
"
map f <Plug>Sneak_f
map F <Plug>Sneak_F
"
"
" ===
" === terminalHelp
" ===
if has('win32')
  let g:terminal_shell = 'powershell'
else
  let g:terminal_shell = 'zsh'
endif
let g:closetag_filetypes = 'html,jsx,tsx'
let g:closetag_xhtml_filetypes = 'html,jsx,tsx'

" ===
" === coc.nvim 
" ===
let g:coc_global_extensions = ['coc-json',
			\ 'coc-vimlsp',
			\ 'coc-html',
			\ 'coc-css',
			\ 'coc-tsserver',
			\ 'coc-explorer',
			\ 'coc-rust-analyzer',
			\ 'coc-rls',
			\ 'coc-yank',
			\ 'coc-emmet']
function! Show_documentation()
	call CocActionAsync('highlight')
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction
inoremap <silent><expr> <c-space> coc#refresh()
nnoremap <C-h> :call Show_documentation()<CR>
" nnoremap <c-p> <c-^>
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

noremap tt :CocCommand explorer<CR>


" You will have to run :CHADdeps when installing / updating.
nnoremap <leader>v <cmd>CHADopen<cr>



"comments map
nmap <LEADER>cl g>c
vmap <LEADER>cl g>
nmap <LEADER>ch g<c
vmap <LEADER>ch g<


" Useful commands
nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>
" ===
" === asyncrun ===
" ===
noremap <silent><f5> :AsyncTask file-build<cr>
noremap <silent><f6> :AsyncTask file-run<cr>
noremap <silent><f7> :AsyncTask project-build<cr>
noremap <silent><f10> :AsyncTask project-run<cr>
let g:asynctasks_term_pos = 'bottom'
let g:asyncrun_open = 6

" Leaderf
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_ShortcutF = "<leader>ff"
let g:Lf_fuzzyEngine_C = 1
