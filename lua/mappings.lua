local M = {}
local k = vim.keymap
vim.g.mapleader = ' '
local function init()
	k.set('','<leader>gg',':Git<cr>')
end
init()
return M
