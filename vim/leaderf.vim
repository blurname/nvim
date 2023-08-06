
"""""""""""""
"  Leaderf  "
"""""""""""""

let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_ShortcutF = "<leader>fl"

" bindings below is to fit my custom keyboard
nnoremap <c-p> :Leaderf file<cr> 

let g:Lf_fuzzyEngine_C = 1
let g:Lf_StlColorscheme = 'onedark'
let g:Lf_PopupColorscheme = 'onedark'
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
      \            ["<M-f>", "<C-Down>"], 
      \            ["<M-b>", "<C-Up>"],
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
      \ "Colorscheme": [],
      \ "Rg" : [["<ESC>", ':exec g:Lf_py "rgExplManager.quit()"<CR>']] 
      \}
"let g:Lf_CommandMap = {'<A-f>': ['<C-Down>'],'<A-b>':['<C-Up>']}

noremap <C-F> :<C-U><C-R>=printf("Leaderf! rg --right --stayOpen -e %s ", expand("<cword>"))<CR><CR>
vnoremap ff :<C-U><C-R>=printf("Leaderf! rg --right --stayOpen -e %s ", leaderf#Rg#visual())<CR><CR>
nnoremap <leader>f; :Leaderf! cmdHistory<CR>
nnoremap <leader>r :Leaderf --recall<CR>
nnoremap <leader>b :Leaderf! buffer<CR>
" noremap <c-j> :Leaderf --next<CR>
" noremap <c-k> :Leaderf --previous<CR>
nnoremap <silent> <leader>fs :Leaderf gstatus<CR>
"noremap <leader>fw :Leaderf! --stayOpen --right rg -F -e
"noremap <leader>fw :Leaderf rg -L -S 
" command! -nargs=1 Search :Leaderf! --stayOpen --right rg -F -e 
command! -nargs=0 ListPackgeJson :Leaderf! file --input package.json
command! -nargs=0 Gs :GFiles?
    let g:Lf_PreviewResult = {
            \ 'File': 0,
            \ 'Buffer': 1,
            \ 'Mru': 0,
            \ 'Tag': 0,
            \ 'BufTag': 0,
            \ 'Function': 0,
            \ 'Line': 0,
            \ 'Colorscheme': 0,
            \ 'Rg': 0,
            \ 'Gtags': 0
            \}
"let g:Lf_PreviewHorizontalPosition = 'right'
let g:Lf_PopupPreviewPosition = 'top'
"let g:Lf_PreviewPosition = 'topright'
let s:WindowHeight = 0.5
"let s:PositionLine = float2nr(&lines * (1 - s:WindowHeight))
"let s:PositionCol = 50

let g:Lf_WindowHeight = s:WindowHeight
let g:Lf_WindowPosition = 'popup'
"let g:Lf_PopupHeight = s:WindowHeight
"let g:Lf_PopupPosition = [s:PositionLine, s:PositionCol]

noremap <F1> :Leaderf command --run-immediately<CR>
nnoremap <leader>fi :Leaderf command --run-immediately<CR>
nnoremap <silent><F3>  :Leaderf rg<CR>
nnoremap <tab> :<C-U><C-R>=printf("Leaderf mru --cwd %s", "")<CR><CR>