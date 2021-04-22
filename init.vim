" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set t_Co=256
" set background=dark    " Setting dark mode

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
let g:deus_termcolors=256
colorscheme zephyr
set termguicolors
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
lua require('plugins')
" ===
" === Basic Mappings
" ===
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
" set ttimeoutlen=0
set modifiable
"set notimeout
" Save & quit
noremap <C-q> :q<CR>
noremap <LEADER>w :w<CR>
noremap s <nop>
noremap <LEADER>re :source $MYVIMRC<CR>
" Open the vimrc file anytime
noremap <LEADER>rc :e $MYVIMRC<CR>

" move key
noremap W 5w
noremap B 5b
noremap H 0
noremap L $
" Copy to system clipboard
vnoremap <LEADER>y "+y
noremap <LEADER>p "+p


" Resize splits with arrow keys
noremap <up> :res -5<CR>
noremap <down> :res +5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>

" ===
" === Use <space> + new arrow keys for moving the cursor around windows
" ===
noremap <LEADER>j <C-w>j
noremap <LEADER>k <C-w>k
noremap <LEADER>h <C-w>h
noremap <LEADER>l <C-w>l

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sj :set splitbelow<CR>:split<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sl :set splitright<CR>:vsplit<CR>
" Press <SPACE> + q to close the window below the current window
noremap <LEADER>q <C-w>:q<CR>


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


" let g:plug_url_format = 'https://git::@github.com.cnpmjs.org/%s.git'
"
" " plugin
"  call plug#begin('~/.vim/bundle/')
"  call plug#end()
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
  let g:terminal_shell = 'elvish'
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

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

inoremap <silent><expr> <c-space> coc#refresh()
nnoremap <silent> K :call <SID>show_documentation()<CR>
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

  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"



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
let g:asyncrun_open = 3

" Leaderf
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_ShortcutF = "<leader>f"
let g:Lf_fuzzyEngine_C = 1
let g:Lf_StlColorscheme = 'popup'
let g:Lf_PopupColorscheme = 'default'
let g:Lf_CursorBlink = 0
