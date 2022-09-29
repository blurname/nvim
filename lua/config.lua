local M = {}
local k = vim.keymap
local g = vim.g

--k.set('n','zR',require('ufo').openAllFolds)
--k.set('n','zM',require('ufo').closeAllFolds)
function M.asynctask()
  g.asynctasks_term_pos = 'bottom'
  g.asyncrun_open = 3
  k.set('', '<F5>', '<cmd>AsyncTask file-build<cr>')
  k.set('', '<F6>', '<cmd>AsyncTask file-run<cr>')
  k.set('', '<F7>', '<cmd>AsyncTask project-build<cr>')
  k.set('', '<F8>', '<cmd>AsyncTask project-run<cr>')
end

function M.suda()
  k.set('n', '<leader>W', '<cmd>SudaWrite<cr>')
end
function M.fugitive()
  --k.set('n','<leader>gg',':Git<cr>')
  k.set('n','<leader>gb',':Git blame<cr>')
end

return M
