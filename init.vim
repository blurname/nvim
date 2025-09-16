set termguicolors
let g:mapleader=' '
let g:maplocalleader='-'

noremap q: <nop>
nnoremap q <nop>
lua require('vim-index')
lua require('lua-index')
source $HOME/.config/nvim/vim/index.vim

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
" set signcolumn=number
set pumblend=8
set title
"set cole=1
set fileencoding=utf-8
set splitright
set splitbelow
set foldlevel=99
set foldenable
set foldcolumn=0
set foldlevelstart=99
set foldopen-=hor "this causes horizontal movements (like l, h) to open folds.
" set sel=exclusive
filetype plugin on
" set clipboard=unnamedplus
"set cmdheight=0
"colorscheme everforest
" colorscheme nordfox
"let g:everforest_background = 'hard'

" Save & quit
noremap s <nop>

" Open the vimrc file anytime
" let a = stdpath("config")

noremap <c-a> ggVG

" Search
noremap <LEADER><CR> :nohlsearch<CR>

" ===
" === terminalHelp
" ===

let g:terminal_shell = 'elvish'
" Comment.nvim 跨平台快捷键配置
if has('macunix')
    " macOS 系统使用 Ctrl+/ 映射
    vnoremap <c-/> <Plug>(comment_toggle_linewise_visual)
    nnoremap <c-/> <Plug>(comment_toggle_linewise_current)
else
    " Linux/Windows 系统使用 Ctrl+_ 映射
    vnoremap <c-_> <Plug>(comment_toggle_linewise_visual)
    nnoremap <c-_> <Plug>(comment_toggle_linewise_current)
endif

"au ModeChanged *:s set clipboard=
"au ModeChanged s:* set clipboard=unnamedplus
map <leader>3 <Cmd>b #<CR>

" switch between current and last
let g:last_tab = tabpagenr()
au TabLeave * let g:last_tab = tabpagenr()
nnoremap <silent><leader><tab> :execute "tabnext " . g:last_tab<cr>
" TODO: bl:
command! -nargs=0 ListTodo :GrepperRg 'TODO: bl'
command! -nargs=1 TerminalBelow :split | wincmd J | execute 'terminal ' . <q-args>
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

function! NpmRunAsync()
    let line = getline('.')
    let start_quote = match(line, '"')
    let end_quote = match(line, '"', start_quote + 1)
    if start_quote != -1 && end_quote != -1 && start_quote < end_quote
        let command = 'npm run '.line[start_quote + 1 : end_quote - 1]
        " let job = jobstart(command, {'on_stdout': 'HandleOutput'})
        call execute('AsyncRun -mode=term -cwd=$(VIM_FILEDIR) '.command)

    else
        echo "No command found within double quotes on the current line."
    endif
endfunction

nnoremap <F9> :call NpmRunAsync()<CR>

function! WrapConsoleLog(type)
  let word = ''
  const vMode = visualmode()
  let beginLogStr = "console.log('🟦[blue]->"
  let log_line = ""
  
  if &filetype == 'moonbit'
    let beginLogStr = "println(\"🟦[blue]->"
  endif
  
  if a:type == 'v'
    if vMode == 'v'
      silent execute "normal! gvy"
      let word = @@
    endif
  elseif a:type == 'n'
    let word = expand('<cword>')
    echo word
  endif
  
  if word != ''
    if &filetype == 'moonbit'
      let log_line = beginLogStr . word.": \\{" . word . "}\")"
    else
      let log_line = beginLogStr . word.": ', " . word . ")"
    endif
    execute "normal! o" . log_line
  endif
endfunction
" can't map to <CR>
nmap <leader>o :call WrapConsoleLog('n')<CR>
xmap <leader>o :call WrapConsoleLog('v')<CR>
" nmap <nowait> q za
