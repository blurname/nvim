local M = {}
local k = vim.keymap
local g = vim.g

g.mapleader = ' '
function M.asynctask()
  g.asynctasks_term_pos = 'bottom'
  g.asyncrun_open = 3
  k.set('', '<F5>', '<cmd>AsyncTask file-build<cr>')
  k.set('', '<F6>', '<cmd>AsyncTask file-run<cr>')
  k.set('', '<F7>', '<cmd>AsyncTask project-build<cr>')
  k.set('', '<F8>', '<cmd>AsyncTask project-run<cr>')
end

function M.cleverf()
  g.clever_f_across_no_line = 1
  g.clever_f_timeout_ms = 1
  k.set('', ';', '<plug>(clever-f-repeat-forward)')
  k.set('', ',', '<plug>(clever-f-repeat-back)')
end

function M.suda()
  k.set('n', '<leader>W', '<cmd>SudaWrite<cr>')
end
function M.fugitive()
  k.set('n','<leader>gg',':Git<cr>')
  k.set('n','<leader>gb',':Git blame<cr>')
end

return M
