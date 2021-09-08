local M = {}
local cmd = vim.cmd

local g = vim.g

local map = require('remap').map

function M.asynctask()
	g.let g:asynctasks_term_pos = 'bottom'
	g.let g:asyncrun_open = 3
	map()
end
function M.cleverf()
    g.clever_f_across_no_line = 1
    g.clever_f_timeout_ms = 1
    map('', ';', '<Plug>(clever-f-repeat-forward)', {})
    map('', ',', '<Plug>(clever-f-repeat-back)', {})
end

