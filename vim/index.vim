let $VIM_HOME = '$HOME/.config/nvim'

autocmd! BufWritePost $HOME/.config/nvim/* source $VIM_HOME/init.vim 
" | execute 'lua require("notify")("reload vimrc")'

command! -nargs=0 Resource source $VIM_HOME/init.vim  | echo 'reload nvimrc'
