-- Neovim 选项设置
local opt = vim.opt
local g = vim.g

-- Leader 键设置
g.mapleader = ' '
g.maplocalleader = '-'

-- 基础设置
opt.termguicolors = true
opt.exrc = true
opt.backup = false
opt.swapfile = false
opt.secure = true
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.ignorecase = true
opt.smartcase = true
opt.smartindent = true
opt.mouse = 'a'
opt.writebackup = false
opt.showcmd = true
opt.wildmenu = true

-- 缩进设置
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.autoindent = true

-- UI 设置
opt.ttimeoutlen = 0
opt.modifiable = true
opt.signcolumn = 'yes:1'
opt.pumblend = 8
opt.title = true
opt.fileencoding = 'utf-8'
opt.splitright = true
opt.splitbelow = true

-- 折叠设置
opt.foldlevel = 99
opt.foldenable = true
opt.foldcolumn = '0'
opt.foldlevelstart = 99
opt.foldopen:remove('hor')

-- 文件类型插件
vim.cmd('filetype plugin on')

-- FZF 默认命令
vim.env.FZF_DEFAULT_COMMAND = 'fd --type f --strip-cwd-prefix'

-- Terminal shell
g.terminal_shell = 'elvish'

-- 状态栏设置
opt.laststatus = 2
opt.statusline = ''
opt.statusline:append('%4*%F')
opt.statusline:append("%2* %{get(g:,'coc_git_status','')}")
opt.statusline:append("%3* %{get(g:,'coc_status','')}")

-- 状态栏高亮
vim.cmd([[
hi User4 guibg=#282a36 guifg=#A3BE8C
]])

