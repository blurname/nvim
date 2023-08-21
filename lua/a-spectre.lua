local api = vim.api
require('spectre').setup({
  line_sep_start = '┌-----------------------------------------',
  result_padding = '¦  ',
  line_sep = '└-----------------------------------------',
  highlight = {
      ui = "String",
      search = "@text.uri",
      replace = "DiffDelete",
      filename = "@keyword",
        -- headers = "SpectreHeader",
        filedirectory = "@keyword",
        -- border = "SpectreBorder",
        replace = "@text.danger"
  },
})

-- 1wincmd l
vim.keymap.set('n', '<leader>ff', '<cmd>lua require("spectre").toggle({path="*/**/**",is_insert_mode=true})<CR>', {
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
