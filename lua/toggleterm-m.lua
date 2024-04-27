require("toggleterm").setup{
  persist_mode = false
}
local api = vim.api
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  cmd = "lazygit", hidden = true, direction = "float",
    on_open = function(term)
    vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<tab>", "<cmd>close<CR>", {noremap = true, silent = true, nowait= true})
    -- vim.api.nvim_buf_set_keymap(term.bufnr, "t", "q", "", {noremap = true, silent = true})
  end,
})
local yazi = Terminal:new({ cmd = "yazi", hidden = true, direction = "float" })
-- local termid = nil

function _lazygit_toggle()
  lazygit:toggle()
end

function _yazi_toggle()
  yazi:toggle()
end

vim.api.nvim_set_keymap("n", "<tab>", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true, nowait= true})
vim.api.nvim_set_keymap("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true, nowait= true})
-- vim.api.nvim_set_keymap("n", "<leader>gf", "<cmd>lua _yazi_toggle()<CR>", {noremap = true, silent = true})

local saved_terminal

require("flatten").setup({
  window = {
    open = "alternate",
  }
      --   callbacks = {
      --   pre_open = function()
      --     -- _lazygit_toggle()
      --     local term = require("toggleterm.terminal")
      --     local termid = term.get_toggled_id(1)
      --     
      --     local all = term.get_all(true)
      --     for index, termm in pairs(all) do
      --       -- if index ~= term.id then return index end
      --     -- print(index)
      --     -- saved_terminal = term.get(index)
      --     saved_terminal = termm
      --     termm:close()
      --     end
      --     if saved_terminal then
      --       if api.nvim_buf_is_loaded(saved_terminal.bufnr) then
      --         api.nvim_buf_delete(saved_terminal.bufnr, { force = true })
      --       end
      --     end
      --   end,
      -- },
})

