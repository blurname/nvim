" winbar
"highlight WinBar guifg=#a3b38c guibg=#3b4252 gui=bold
"highlight FoldColumn guifg=#bf616a guibg=#3b4252
"set statusline
set laststatus=2
"set statusline+=%{get(b:,'gitsigns_status','')}
set statusline=
set statusline+=%4*%F
set statusline+=%2*\ %{get(g:,'coc_git_status','')}
set statusline+=%3*\ %{get(g:,'coc_status','')}

"git
hi User2 guibg=#282a36 guifg=#bd93f9
"coc
hi User3 guibg=#2E3440 guifg=#EBCB8B
"filename
hi User4 guibg=#282a36 guifg=#A3BE8C

"highlight WinBarNC guifg=#e5e9f0 guibg=#3b4252
"highlight WinBarIndicator guifg=#bf616a guibg=#3b4252
"highlight WinBarInactive guifg=#bf616a guibg=#3b4252
