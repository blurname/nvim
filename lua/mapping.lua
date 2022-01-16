local M = {}
local k = vim.keymap
function M.setup()
	--k.set('n','<leader>gg',"<cmd>Git<cr>")
	k.set('n','<leader>gg',function ()
		print("real lua funcion")
	end)
end
return M
