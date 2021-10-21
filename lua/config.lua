local M = {}
local cmd = vim.cmd

local g = vim.g

local map = require('remap').map

function M.asynctask()
	g.asynctasks_term_pos = 'bottom'
	g.asyncrun_open = 3
  map('', '<F5>', '<cmd>AsyncTask file-build<cr>', {})
  map('', '<F6>', '<cmd>AsyncTask file-run<cr>', {})
  map('', '<F7>', '<cmd>AsyncTask project-build<cr>', {})
  map('', '<F8>', '<cmd>AsyncTask project-run<cr>', {})
end
function M.cleverf()
    g.clever_f_across_no_line = 1
    g.clever_f_timeout_ms = 1
    map('', ';', '<Plug>(clever-f-repeat-forward)', {})
    map('', ',', '<Plug>(clever-f-repeat-back)', {})
end

function M.suda()
    map('n', '<Leader>W', '<Cmd>SudaWrite<cr>')
end
return M
