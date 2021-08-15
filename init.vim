" set background=dark    " Setting dark mode
colorscheme edge
set termguicolors
set bg=light
" set bg=dark
"let g:edge_style = 'aura'
let g:everforest_enable_italic = 0
" autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
lua require('plugins')

" ===
" === Basic Mappings
" ===
let mapleader = " "
" noremap ; :
set exrc
set nobackup
set noswapfile
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
set modifiable
set signcolumn=number

" set notimeout

" Save & quit
noremap <LEADER>w :w<CR>
noremap s <nop>
noremap <LEADER>re :source $MYVIMRC<CR>
" Open the vimrc file anytime
noremap <LEADER>rc :e $MYVIMRC<CR>
let a = stdpath("config")

if has('win32')
	noremap <LEADER>rv :e ~/AppData/Local/nvim/lua/plugins.lua<CR>
else
	noremap <LEADER>rv :e ~/.config/nvim/lua/plugins.lua<CR>
endif

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
noremap tk :-tabnext<CR>
noremap tj :+tabnext<CR>
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
"""""""""""
"  Sneak  "
"""""""""""

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
			\ 'coc-yank',
			\ 'coc-emmet',
			\ 'coc-snippets',
			\ 'coc-pyright',
			\ 'coc-prettier']


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
 
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
			\ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(0.5) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0.5)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(0.5) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" nmap <leader>qf  <Plug>(coc-fix-current)
" nmap <leader>ac  <Plug>(coc-codeaction)

" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>

noremap  <leader>v :CocCommand explorer<CR>
noremap <leader>fp :CocCommand prettier.formatFile
command! -nargs=0 Prettier :CocCommand prettier.formatFile
""""""""""""""""""""""
"  coc-snippet  "
""""""""""""""""""""""

" imap <leader>l <Plug>(coc-snippets-expand) 
"
" " Use <C-j> for select text for visual placeholder of snippet.
" vmap <C-j> <Plug>(coc-snippets-select)
"
" " Use <C-j> for jump to next placeholder, it's default of coc.nvim
" let g:coc_snippet_next = '<c-j>'
"
" " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
" let g:coc_snippet_prev = '<c-k>'
"
" let g:coc_snippet_next = '<tab>'


" You will have to run :CHADdeps when installing / updating.
" nnoremap <leader>v <cmd>NvimTreeToggle<cr>



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


"""""""""""""
"  Leaderf  "
"""""""""""""


let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_ShortcutF = "<leader>ff"
let g:Lf_fuzzyEngine_C = 1
let g:Lf_StlColorscheme = 'popup'
let g:Lf_PopupColorscheme = 'one'
let g:Lf_CursorBlink = 0
" let g:Lf_WorkingDirectory = finddir('.git', '.;')

let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_PreviewResult = get(g:, 'Lf_PreviewResult', {})
let g:Lf_PreviewResult.snippet = 1
let g:Lf_WildIgnore = {
			\ 'dir': ['.svn','.git','.hg','node_modules'],
			\ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
			\}

let g:Lf_GtagsAutoGenerate = 1
let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>

noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>

" noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
" noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
" noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
" noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
" noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>

noremap <leader>fc :Leaderf cmdHistory<CR>

inoremap <C-l> <c-\><c-o>:Leaderf snippet<CR>

noremap <LEADER>fh :LeaderfHelp<CR>

" Save file on each edit exit


"""""""""""""""
"  Ultisnips  "
"""""""""""""""


let g:UltiSnipsExpandTrigger="<ab>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

""""""""""""""""""""""""""
"  move the side window  "
""""""""""""""""""""""""""

" let g:far#source="rg"
" let g:far#glob_mode="rg"
" 0:up, 1:down, 2:pgup, 3:pgdown, 4:top, 5:bottom
function! Tools_PreviousCursor(mode)
    if winnr('$') <= 1
        return
    endif
    noautocmd silent! wincmd p
    if a:mode == 0
        exec "normal! \<c-y>"
    elseif a:mode == 1
        exec "normal! \<c-e>"
    elseif a:mode == 2
        exec "normal! ".winheight('.')."\<c-y>"
    elseif a:mode == 3
        exec "normal! ".winheight('.')."\<c-e>"
    elseif a:mode == 4
        normal! gg
    elseif a:mode == 5
        normal! G
    elseif a:mode == 6
        exec "normal! \<c-u>"
    elseif a:mode == 7
        exec "normal! \<c-d>"
    elseif a:mode == 8
        exec "normal! k"
    elseif a:mode == 9
        exec "normal! j"
    endif
    noautocmd silent! wincmd p
endfunc
nnoremap <M-u> call:Tools_PreviousCursor(0)
nnoremap <M-d> call:Tools_PreviousCursor(1)


"""""""""""""""""""
"  AutoSave.nvim  "
"""""""""""""""""""

lua << EOF
local autosave = require("autosave")

autosave.setup(
    {
        enabled = true,
        execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),

        events = {"InsertLeave"},
				events = ("TextChanged"),
        conditions = {
            exists = true,
            filetype_is_not = {},
            modifiable = true
        },
        write_all_buffers = false,
        on_off_commands = true,
        clean_command_line_interval = 2500
    }
)
EOF
