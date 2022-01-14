local M = {}
local k = vim.keymap
function M.setup()
	k.set('n','<leader>gg',"<cmd>Git<cr>")
end
return M
