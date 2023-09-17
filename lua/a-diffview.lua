-- local actions = require("diffview.actions")
require("diffview").setup({
  hooks = {
    diff_buf_read = function(bufnr)
      -- Change local options in diff buffers
      -- vim.cmd('CocDisable')
    end,
    view_opened = function(view)
      vim.cmd('CocDisable')
    end,
    view_closed = function(view)
      vim.cmd('CocEnable')
    end,
  },
  -- keymaps = {
  --   disable_defaults = false,
  --   file_panel = {
  --     { "n", "<LeftMouse>", actions.select_entry,                { desc = "Open the diff for the selected entry." } },
  --     { "n", "<2-LeftMouse>",  false },
  --   },
  --   file_history_panel = {
  --     { "n", "<LeftMouse>", actions.select_entry,                { desc = "Open the diff for the selected entry." } },
  --     { "n", "<2-LeftMouse>", false },
  --   },
  -- }
})
