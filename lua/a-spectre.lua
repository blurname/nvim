vim.keymap.set('n', '<F4>', '<cmd>lua require("spectre").toggle({path="*/**/**",is_insert_mode=true})<CR>', {
    desc = "Toggle Spectre"
})
vim.keymap.set('n', '<c-f>', '<cmd>lua require("spectre").open_visual({select_word=true,path="*/**/**"})<CR>', {
    desc = "Search current word"
})
vim.keymap.set('v', 'ff', '<esc><cmd>lua require("spectre").open_visual({path="*/**/**"})<CR>', {
    desc = "Search current word"
})
-- vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
--     desc = "Search on current file"
-- })
