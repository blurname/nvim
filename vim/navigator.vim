
" initialize global keymap and declare prefix key
let g:navigator = {'prefix':'<LEADER><k>'}
let g:navigator_popup = 1
let g:navigator_popup_position = 'bottom'
let g:navigator_popup_border = 0
nnoremap <silent><leader>k :Navigator g:navigator<cr>

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
            \ 'd' : ['execute("DiffviewOpen") | CocDisable','diff current changes'],
            \ 'l' : [':DiffviewFileHistory','diff log branch'],
            \ 'b' : [':DiffviewFileHistory %','diff log file'],
            \ 'p' : [':Glfuzzy','diff log file'],
            \ 'f' : [':Flog','flog'],
            \ }

let g:navigator.c = {
            \ 'name': '+coc',
            \ 'd' : [':CocDisable','coc disable'],
            \ 'e' : [':CocEnable','coc enable'],
            \ }

let g:navigator.j = {
            \ 'name': 'jump',
            \ 'j' : [':JumpTo','jump to file with path and line'],
            \ 'y' : [':GetFilePathLineCommand', 'get current file path and line']
            \ }
let g:navigator.l = {
            \ 'name': 'list',
            \ 'c' : [':ListConsoleLog','list console.log contains blue'],
            \ }
