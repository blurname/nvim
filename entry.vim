set termguicolors
set t_Co=256
lua require('plugins')
lua require('door')
" ===
" === Basic Mappings
" ===
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   basic                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:mapleader=' '
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
"set foldenable
set foldcolumn=1
set foldlevelstart=99
set winbar=%F
set clipboard=unnamedplus
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

set foldmethod=expr
filetype plugin on
" set scrolloff

" set notimeout

" Save & quit
noremap s <nop>
noremap q: <nop>
autocmd! BufWritePost /home/bl/.config/nvim/entry.vim source /home/bl/.config/nvim/entry.vim | echom "Reloaded $NVIMRC"
noremap <LEADER>re :source /home/bl/.config/nvim/entry.vim<CR>
" Open the vimrc file anytime
noremap <LEADER>rc :e /home/bl/.config/nvim/entry.vim<CR>
" let a = stdpath("config")

noremap <LEADER>rv :e ~/.config/nvim/lua/plugins.lua<CR>

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

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sj :set splitbelow<CR>:split<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sl :set splitright<CR>:vsplit<CR>
" Press <SPACE> + q to close the window below the current window
noremap <C-w> :q<CR>

noremap <c-a> ggVG

" ===
" === Tab management
" ===
" Create a new tab with tl

" noremap tl :tabe<CR>
" Move around tabs with tn and ti
noremap tk :-tabnext<CR>
noremap tj :+tabnext<CR>

" move current window to new tab
noremap tn <C-w>T

" Move the tabs with tmn and tmi
 noremap th :-tabmove<CR>
 noremap tl :+tabmove<CR>

" Search
noremap <LEADER><CR> :nohlsearch<CR>

" ===
" === terminalHelp
" ===
"let g:terminal_shell = 'elvish'

let g:terminal_shell = 'elvish'

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
      \ 'coc-rust-analyzer',
      \ 'coc-yank',
      \ 'coc-emmet',
      \ 'coc-eslint',
      \ 'coc-snippets',
      \ 'coc-pyright',
      \ 'coc-sumneko-lua',
      \ 'coc-eslint',
      \ 'coc-git',
      \ 'coc-explorer']
let g:coc_default_semantic_highlight_groups = 0

nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

" nnoremap <c-p> <c-^>

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <c-j>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><c-k> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
imap <c-l> <Plug>(coc-snippets-expand)

nnoremap <silent><nowait><expr> <A-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <A-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <A-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <A-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <A-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <A-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Highlight the symbol and its references when holding the cursor.
"autocmd CursorHold * silent call CocActionAsync('highlight')



" Symbol renaming.
"
" fit vscode's rename bindings
nmap <F2> <Plug>(coc-rename)
nmap <leader>cl  <Plug>(coc-codelens-action)

nnoremap <silent> <c-k> <Plug>(coc-diagnostic-prev)
nnoremap <silent> <c-J> <Plug>(coc-diagnostic-next)

" nmap <leader>qf  <Plug>(coc-fix-current)
nmap  <leader>ca <plug>(coc-codeaction)
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Show all diagnostics.
" filetree

"noremap  <leader>v  :CocCommand explorer --position right <CR>
noremap  <leader>v  :Neotree filesystem toggle reveal_force_cwd float <CR>

"nnoremap <C-n> <cmd>RnvimrToggle<cr>
"
"noremap <leader>fi :CocCommand eslint.executeAutofix<CR>
noremap <c-s> :wa<CR>
"command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Useful commands
nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>


"""""""""""""
"  Leaderf  "
"""""""""""""

let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_ShortcutF = "<leader>fl"

" bindings below is to fit my custom keyboard
nnoremap <c-p> :Leaderf file<cr> 

let g:Lf_fuzzyEngine_C = 1
let g:Lf_PopupColorscheme = 'nord'
let g:Lf_CursorBlink = 0
"let g:Lf_WorkingDirectory = finddir('.git', '.;')
let g:Lf_HideHep = 1
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WildIgnore = {
      \ 'dir': ['.svn','.git','.hg','node_modules','output-gitignore'],
      \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]', '*.min.js', '.svg']
      \}
let g:Lf_RgConfig = [
      \ "--max-columns=130",
      \ ]
let g:Lf_NormalMap = {
      \ "_":      [["<C-j>", "j"],
      \            ["<C-k>", "k"],
      \           ],
      \ "File":   [["<ESC>", ':exec g:Lf_py "fileExplManager.quit()"<CR>'],
      \            ["<F6>", ':exec g:Lf_py "fileExplManager.quit()"<CR>']
      \           ],
      \ "Buffer": [["<ESC>", ':exec g:Lf_py "bufExplManager.quit()"<CR>'],
      \            ["<F6>", ':exec g:Lf_py "bufExplManager.quit()"<CR>']
      \           ],
      \ "Mru":    [["<ESC>", ':exec g:Lf_py "mruExplManager.quit()"<CR>']],
      \ "Tag":    [],
      \ "BufTag": [],
      \ "Function": [],
      \ "Line":   [],
      \ "History":[],
      \ "Help":   [],
      \ "Self":   [],
      \ "Colorscheme": []
      \}
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru --cwd %s", "")<CR><CR>
noremap <c-\> :<C-U><C-R>=printf("Leaderf mru --cwd %s", "")<CR><CR>

"noremap <C-B> :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR><CR>
noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR><CR>
"window jump
noremap <tab>w :Leaderf! window<CR> 
noremap <tab>b :Leaderf! buffer<CR> 

noremap <leader>f; :Leaderf cmdHistory<CR>

" use rg for content search
" ! means list results in normal mode
noremap <leader>fr :<C-U>Leaderf! rg --recall<CR>
noremap <leader>ff :Leaderf! rg -F -e 
noremap <leader>fs :Leaderf! --stayOpen --right rg -F -e 
xnoremap ff :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR><CR>
noremap <leader>fh :Leaderf searchHistory<CR>

" list commands
noremap <F1> :Leaderf command<CR>
" global search
noremap <F3> :Leaderf rg<CR>

"command! -nargs=0 RS :Leaderf --stayOpen --right rg -F -e 
"command! -nargs=? Ls :Leaderf --auto-preview --stayOpen --popup --nameOnly rg -F -e %s


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

""""""""""""""
"  nvim-bqf  "
""""""""""""""
let g:coc_enable_locationlist = 0
aug Coc
  au!
  au User CocLocationsChange ++nested call Coc_qf_jump2loc(g:coc_jump_locations)
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
aug END

nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> <leader>d <Cmd>call Coc_qf_diagnostic()<CR>

function! Coc_qf_diagnostic() abort
  let diagnostic_list = CocAction('diagnosticList')
  let items = []
  let loc_ranges = []
  for d in diagnostic_list
    let text = printf('[%s%s] %s', (empty(d.source) ? 'coc.nvim' : d.source),
          \ (d.code ? ' ' . d.code : ''), split(d.message, '\n')[0])
    let item = {'filename': d.file, 'lnum': d.lnum, 'col': d.col, 'text': text, 'type':
          \ d.severity[0]}
    call add(loc_ranges, d.location.range)
    call add(items, item)
  endfor
  call setqflist([], ' ', {'title': 'CocDiagnosticList', 'items': items,
        \ 'context': {'bqf': {'lsp_ranges_hl': loc_ranges}}})
  botright copen
endfunction

function! Coc_qf_jump2loc(locs) abort
  let loc_ranges = map(deepcopy(a:locs), 'v:val.range')
  call setloclist(0, [], ' ', {'title': 'CocLocationList', 'items': a:locs,
        \ 'context': {'bqf': {'lsp_ranges_hl': loc_ranges}}})
  let winid = getloclist(0, {'winid': 0}).winid
  if winid == 0
    botright lwindow
  else
    call win_gotoid(winid)
  endif
endfunction

"NERDCommenter
let g:NERDCreateDefaultMappings = 0
map <c-_> <plug>NERDCommenterToggle
"
" map <c-_> instead of <c-/>
"let g:NERDAltDelims_javascriptreact=1
"let g:NERDAltDelims_typescriptreact=1
"let g:NERDCustomDelimiters = { 'typescriptreact': { 'left': '//', 'leftAlt': '{/*', 'rightAlt': '*/}' },'javascriptreact': { 'left': '//', 'leftAlt': '{/*', 'rightAlt': '*/}' } }

"
" 很奇怪，现在保存，会触发两次 formmat , deno_fmt and coc-eslint
"

" map <c-_> :w

" Enable alignment globally
let g:neoformat_basic_format_align = 1

" Enable tab to spaces conversion globally
"let g:neoformat_basic_format_retab = 1

let g:neoformat_basic_format_trim = 1

"let g:neoformat_typescript_denofmt = {
      "\ 'exe':'deno fmt',
      "\ 'args': ['--parser', 'typescript','--no-semi','--single-quote'],
"\}
" https://github.com/denoland/deno/issues/13616
" 2022.5.18: deno fmt not suppport remove semicolons (ASI)
"let g:neoformat_enabled_javascript = ['deno fmt']
"let g:neoformat_enabled_typescript = ['deno fmt']
let g:neoformat_enabled_typescript = ['eslint_d']
let g:neoformat_enabled_typescript = ['eslint_d']
"let g:neoformat_enabled_json = ['deno fmt']
let g:neoformat_enabled_yaml = ['prettier']

let g:neoformat_enabled_rust = ['rustfmt']
let g:neoformat_enabled_nix = ['nixpkgs-fmt']
let g:neoformat_enabled_lua = ['stylua']
"let g:neoformat_verbose = 1 "
"noremap <leader>gl :diffget //3<CR>
"noremap <leader>gh :diffget //2<CR>

"au ModeChanged *:s set clipboard=
"au ModeChanged s:* set clipboard=unnamedplus
map <leader>3 <Cmd>b #<CR>

nnoremap <leader>gg :LazyGit<CR>
"nnoremap <silent> <leader>gg :<C-u>CocList --normal gstatus<CR>


" winbar
highlight WinBar guifg=#a3b38c guibg=#3b4252 gui=bold
highlight FoldColumn guifg=#bf616a guibg=#3b4252
"highlight WinBarNC guifg=#e5e9f0 guibg=#3b4252
"highlight WinBarIndicator guifg=#bf616a guibg=#3b4252
"highlight WinBarInactive guifg=#bf616a guibg=#3b4252
"highlight WinBar set statusline^=%{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}%{get(b:,'coc_git_blame','')}%{get(b:,'coc_current_fcuntion','')} autocmd User CocGitStatusChange {command}
