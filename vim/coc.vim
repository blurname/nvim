" ===
" === coc.nvim
" ===
      " \ 'coc-sumneko-lua',
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
      \ 'coc-eslint',
      \ 'coc-explorer',
      \ 'coc-lit-html',
      \ 'coc-git',
      \ 'coc-lists',
      \ 'coc-styled-components']
let g:coc_default_semantic_highlight_groups = 0

nnoremap <silent> K :call ShowDocumentation()<CR>

" coc#float#close_all()
nnoremap <silent> U :call JumpInOutCocFloat()<CR>

function! JumpInOutCocFloat()
  let winids = coc#float#get_float_win_list(get(a:, 1, 0))
  let currentWinId = win_getid()
  for id in winids
    if id == currentWinId
      call coc#float#close_all()
      return
    endif
  endfor
call coc#float#jump()
endfunction

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
" nmap <silent> gl :rightbelow vsplit<CR> \| <Plug>(coc-references)

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" imap <c-l> <Plug>(coc-snippets-expand)

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
" nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" nnoremap <silent><nowait> <space>l  :<C-u>CocListResume<cr>
" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <expr> gk  &diff ? '[c' : <Plug>(coc-git-prevchunk)
nmap <expr> gj  &diff ? ']c' : <Plug>(coc-git-nextchunk)
nmap gk <Plug>(coc-git-prevchunk)
nmap gj <Plug>(coc-git-nextchunk)
" nmap gs <Plug>(coc-git-chunkinfo)
nmap gu  :CocCommand git.chunkUndo<CR>
" show commit contains current position
" nmap gc <Plug>(coc-git-commit)
nnoremap <silent> <leader>gs :<C-u>CocList --normal --no-quit --auto-preview gstatus<CR>
command! FoldGit :CocCommand git.foldUnchanged
" nnoremap <silent> <leader>j  :<C-u>CocNext<CR>
" nnoremap <silent> <leader>k  :<C-u>CocPrev<CR>
" nnoremap <silent><nowait> <space>l  :<C-u>CocListResume<cr>
" 模糊搜索
"nnoremap <silent> <F3>  :<C-u>CocList --ignore-case --interactive grep<CR> 
" 粘贴文本搜索
" nnoremap <silent><nowait><F4>  :<C-u>CocList --ignore-case grep 
" 文件搜索
"nnoremap <silent> <c-p>  :<C-u>CocList --auto-preview files<CR> 
" mru
"nnoremap <silent> <space><space>  :<C-u>CocList mru<CR> 
" yank
nmap <silent> <leader>p :<C-u>CocList --normal yank<cr>

nmap <C-F> :Grepper -noprompt -tool rg -cword<CR><CR>
" xmap <c-f> :Grepper -noprompt -tool rg -cword<CR><CR>
" nnoremap <silent> <c-f>  :exe 'CocList -I --normal --auto-preview --input='.expand('<cword>').' grep'<CR>

"noremap <F1> :Commands<CR>

"noremap <tab>w :CocList windows<CR> 
"noremap <tab>b :CocList --normal buffers<CR> 

" Symbol renaming.
"
" fit vscode's rename bindings
nnoremap <F2> <Plug>(coc-rename)
nnoremap <leader>cl  <Plug>(coc-codelens-action)

nnoremap <silent> <c-k> <Plug>(coc-diagnostic-prev)
nnoremap <silent> <c-j> <Plug>(coc-diagnostic-next)

" nmap <leader>qf  <Plug>(coc-fix-current)
nnoremap  <leader><leader> <plug>(coc-codeaction)
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Show all diagnostics.
" filetree

" nnoremap  <leader>v  :CocCommand explorer --position right <CR>
nnoremap  <leader>v :NvimTreeFindFileToggle <CR>
" command! -nargs=0 CocExplorer :CocCommand explorer
command! -nargs=0 CocNearExplorer :call CocAction('runCommand', 'explorer.doAction', 'closest', ['reveal:0'], [['relative', 0, 'file']])
" command! -nargs=0 Prettier :CocCommand prettier.formatFile

"nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)

" vnoremap <c-f> :<C-u>call <SID>GrepFromSelected(visualmode())<CR>
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

nmap <silent> <C-e> <Plug>(coc-range-select)
xmap <silent> <C-e> <Plug>(coc-range-select)

function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
      top copen
    else
        cclose
    endif
endfunction

nnoremap <silent> <leader>q :call ToggleQuickFix()<cr>
nnoremap <silent> <a-q> :cprev<cr>
nnoremap <silent> <a-e> :cnext<cr>
nnoremap <silent><nowait> <leader>l  :<C-u>CocOutline<cr>

nnoremap <silent><nowait> <c-]>  :call ToggleOutline()<CR>
function! ToggleOutline() abort
  let winid = coc#window#find('cocViewId', 'OUTLINE')
  if winid == -1
    call CocActionAsync('showOutline', 1)
  else
    call coc#window#close(winid)
  endif
endfunction

