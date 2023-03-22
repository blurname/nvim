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
set foldenable
set foldcolumn=1
set foldlevelstart=99
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
filetype plugin on
" set scrolloff

" set notimeout

" Save & quit
noremap s <nop>
noremap q: <nop>
autocmd! BufWritePost /home/bl/.config/nvim/init.vim source /home/bl/.config/nvim/init.vim | echo 'reload nvimrc'

"noremap <LEADER>re :source /home/bl/.config/nvim/entry.vim<CR>
" Open the vimrc file anytime
"noremap <LEADER>rc :e /home/bl/.config/nvim/entry.vim<CR>
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
noremap <c-h> :-tabnext<CR>
noremap <c-l> :+tabnext<CR>



" get file path releated
command! GetFilePathRelative :let @" = expand("%")
command! GetFilePathLine     :let @" = expand("%") . ':' . line(".")
command! GetFilePathAbsolute :let @" = expand("%:p")


command! Bda silent! execute "%bd|e#|bd#"

" move current window to new tab
"noremap tn <C-w>T

" Move the tabs with tmn and tmi
 "noremap th :-tabmove<CR>
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
      \ 'coc-sumneko-lua',
      \ 'coc-eslint',
      \ 'coc-explorer',
      \ 'coc-lit-html',
      \ 'coc-git',
      \ 'coc-lists']
let g:coc_default_semantic_highlight_groups = 0

nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

inoremap <silent><expr> <c-k> coc#refresh()

" nnoremap <c-p> <c-^>

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <tab>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
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
"imap <c-l> <Plug>(coc-snippets-expand)

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
nnoremap <silent><nowait> <space>l  :<C-u>CocListResume<cr>
" Highlight the symbol and its references when holding the cursor.
"autocmd CursorHold * silent call CocActionAsync('highlight')

nmap gk <Plug>(coc-git-prevchunk)
nmap gj <Plug>(coc-git-nextchunk)
nmap gs <Plug>(coc-git-chunkinfo)
" show commit contains current position
nmap gc <Plug>(coc-git-commit)
nnoremap <silent> <leader>gl :<C-u>CocList --normal --no-quit --auto-preview gstatus<CR>
command! FoldGit :CocCommand git.foldUnchanged
nnoremap <silent> <leader>j  :<C-u>CocNext<CR>
nnoremap <silent> <leader>k  :<C-u>CocPrev<CR>
" 模糊搜索
nnoremap <silent> <F3>  :<C-u>CocList --ignore-case --interactive grep<CR> 
" 粘贴文本搜索
nnoremap <silent><nowait><F4>  :<C-u>CocList --ignore-case grep 
" 文件搜索
nnoremap <silent> <c-p>  :<C-u>CocList --auto-preview files<CR> 
" mru
nnoremap <silent> <tab>m  :<C-u>CocList mru<CR> 

" yank
nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>

"noremap <C-F> :Grepper -noprompt -tool rg -cword<CR><CR>
nnoremap <silent> <c-f>  :exe 'CocList -I --normal --auto-preview --input='.expand('<cword>').' words'<CR>

noremap <F1> :Commands<CR>

noremap <tab>w :CocList windows<CR> 
noremap <tab>b :CocList --normal buffers<CR> 

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

noremap  <leader>v  :CocCommand explorer --position right <CR>

nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)

vnoremap ff :<C-u>call <SID>GrepFromSelected(visualmode())<CR>
function! s:GrepFromSelected(type)
  let saved_unnamed_register = @@
  if a:type ==# 'v'
    normal! `<v`>y
  elseif a:type ==# 'char'
    normal! `[v`]y
  else
    return
  endif
  let word = substitute(@@, '\n$', '', 'g')
  let word = escape(word, '| ')
  let @@ = saved_unnamed_register
  execute 'CocList --auto-preview --normal grep '.word
endfunction

"noremap  <leader>v  :Neotree filesystem toggle reveal_force_cwd float <CR>

"nnoremap <C-n> <cmd>RnvimrToggle<cr>
"
"noremap <leader>fi :CocCommand eslint.executeAutofix<CR>
noremap <c-s> :wa<CR>
"command! -nargs=0 Prettier :CocCommand prettier.formatFile

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


" winbar
"highlight WinBar guifg=#a3b38c guibg=#3b4252 gui=bold
highlight FoldColumn guifg=#bf616a guibg=#3b4252
"set statusline
"set laststatus=0
"set statusline+=%{get(b:,'gitsigns_status','')}
"set statusline^=%{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}%{get(b:,'coc_git_blame','')}

"highlight WinBarNC guifg=#e5e9f0 guibg=#3b4252
"highlight WinBarIndicator guifg=#bf616a guibg=#3b4252
"highlight WinBarInactive guifg=#bf616a guibg=#3b4252

" ============ harpoon ==========
nnoremap <silent><A-3> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <silent><A-m> :lua require("harpoon.mark").add_file()<CR>
nnoremap <silent><A-1> :lua require("harpoon.ui").nav_prev()<CR>
nnoremap <silent><A-2> :lua require("harpoon.ui").nav_next()<CR>
