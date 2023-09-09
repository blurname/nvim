
" initialize global keymap and declare prefix key
let g:navigator = {'prefix':'<LEADER><i>'}
let g:navigator_popup = 1
let g:navigator_popup_position = 'bottom'
let g:navigator_popup_border = 0
nnoremap <silent><leader>i :Navigator g:navigator<cr>
xnoremap <silent><leader>i :Navigator g:navigator<cr>

let g:navigator.p = {
            \ 'name': '+path',
            \ '1' : [':BlGetFilePathRelative','GetFilePathRelative'],
            \ '2' : [':BlGetFilePathLine','GetFilePathLine'],
            \ '3' : [':BlGetFilePathAbsolute','GetFilePathAbsolute'],
            \ }

let g:navigator.f = {
            \ 'name': '+leaderf',
            \ '1' : [':Leaderf! rg --recall','rg recall'],
            \ '2' : [':Leaderf! file --recall','file recall'],
            \ 'f': [':lua require("spectre").open_visual({select_word=true})','Spec: open file in project'],
            \ 'c': [':lua require("spectre").open_file_search({select_word=true})','Spec: open ']
            \ }

let g:navigator.g = {
            \ 'name': '+git',
            \ 'c' : [':DiffviewClose','diff close'],
            \ 'h' : [':DiffviewHead','diff head'],
            \ 'o' : [':DiffviewOpen','diff current changes'],
            \ '1' : [':DiffviewFileHistory','diff log branch'],
            \ '2' : [':DiffviewFileHistory %','diff log file'],
            \ 'f' : [':Flog','flog'],
            \ }

let g:navigator.c = {
            \ 'name': '+coc',
            \ 'd' : [':CocDisable','coc disable'],
            \ 'e' : [':CocEnable','coc enable'],
            \ }
