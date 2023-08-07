
" initialize global keymap and declare prefix key
let g:navigator = {'prefix':'<LEADER><i>'}
nnoremap <silent><LEADER>; :Navigator g:navigator<cr>

" buffer management
let g:navigator.b = {
            \ 'name' : '+buffer' ,
            \ '1' : [':b1'        , 'buffer 1']        ,
            \ '2' : [':b2'        , 'buffer 2']        ,
            \ 'd' : [':bd'        , 'delete-buffer']   ,
            \ 'f' : [':bfirst'    , 'first-buffer']    ,
            \ 'h' : [':Startify'  , 'home-buffer']     ,
            \ 'l' : [':blast'     , 'last-buffer']     ,
            \ 'n' : [':bnext'     , 'next-buffer']     ,
            \ 'p' : [':bprevious' , 'previous-buffer'] ,
            \ '?' : [':Leaderf buffer'   , 'fzf-buffer'],
            \ }

" tab management
let g:navigator.t = {
            \ 'name': '+tab',
            \ '1' : ['<key>1gt', 'tab-1'],
            \ '2' : ['<key>2gt', 'tab-2'],
            \ '3' : ['<key>3gt', 'tab-3'],
            \ 'c' : [':tabnew', 'new-tab'],
            \ 'q' : [':tabclose', 'close-current-tab'],
            \ 'n' : [':tabnext', 'next-tab'],
            \ 'p' : [':tabprev', 'previous-tab'],
            \ 'o' : [':tabonly', 'close-all-other-tabs'],
            \ }

let g:navigator.p = {
            \ 'name': '+path',
            \ '1' : [':BlGetFilePathRelative','1'],
            \ '2' : [':BlGetFilePathLine','2'],
            \ '3' : [':BlGetFilePathAbsolute','3'],
            \ }

let g:navigator.f = {
            \ 'name': '+leaderf',
            \ '1' : [':Leaderf! rg --recall','rg recall'],
            \ '2' : [':Leaderf! file --recall','file recall'],
            \ }
