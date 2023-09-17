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
" TODO: bl:
command! -nargs=0 TODO execute 'silent! cexpr systemlist("rg \"TODO: bl:\" --vimgrep")' | copen
" command! -nargs=1 TerminalBelow :split | wincmd J | execute 'terminal ' . <q-args>
" function! ExecuteCommandFromFirstQuote()
"     let line = getline('.')
"     let start_quote = match(line, '"')
"     let end_quote = match(line, '"', start_quote + 1)
"     if start_quote != -1 && end_quote != -1 && start_quote < end_quote
"         let command = '!npm run '.line[start_quote + 1 : end_quote - 1]
"         execute 'execute command'
"     else
"         echo "No command found within double quotes on the current line."
"     endif
" endfunction


" function! ExecuteCommandFromFirstQuote()
"     let line = getline('.')
"     let start_quote = match(line, '"')
"     let end_quote = match(line, '"', start_quote + 1)
"     if start_quote != -1 && end_quote != -1 && start_quote < end_quote
"         let command = 'npm run '.line[start_quote + 1 : end_quote - 1]
"         let output = systemlist(command)
"         call setqflist([], 'r')
"         call setqflist(map(copy(output), '({"text": v:val})'), 'a')
"         copen
"     else
"         echo "No command found within double quotes on the current line."
"     endif
" endfunction

function! NpmRun()
    let line = getline('.')
    let start_quote = match(line, '"')
    let end_quote = match(line, '"', start_quote + 1)
    if start_quote != -1 && end_quote != -1 && start_quote < end_quote
        let command = 'npm run '.line[start_quote + 1 : end_quote - 1]
        let job = jobstart(command, {'on_stdout': 'HandleOutput'})
        call chansend(job, '')
        call setloclist(0,[], 'r')

        if empty(filter(getwininfo(), 'v:val.quickfix'))
            lopen
            execute "normal! G" | call feedkeys("\<CR>")
        endif

    else
        echo "No command found within double quotes on the current line."
    endif
endfunction

function! HandleOutput(job_id, data, event)
    if a:event == 'stdout'
        let text = join(a:data, "\n")
        " call setqflist(map(a:data, '{"text": v:val}'), 'a')
        call setloclist(0,[], 'a',{'lines':a:data})
        " 检查 Quickfix 窗口是否已经打开，如果没有则打开它
        if empty(filter(getwininfo(), 'v:val.loclist'))
          lopen
        endif
        execute "normal! G" | call feedkeys("\<CR>")
    endif
endfunction

nnoremap <F9> :call NpmRun()<CR>

function! MyFunction()
    if getchar(1) == 1
        echo "hello"
    endif
endfunction

augroup MyAutoCmds
    autocmd!
    autocmd CursorMoved * call MyFunction()
augroup END
