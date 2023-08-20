local actions = require('telescope.actions')
require('telescope').setup({
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    layout_strategy = 'center',
    sorting_strategy = 'ascending',
    scroll_strategy = 'limit',
    mappings = {
      i = {
        ["<C-j>"] = {
          actions.move_selection_next, type = "action",
          opts = { nowait = true, silent = true }
        },
        ["<C-k>"] = {
          actions.move_selection_previous, type = "action",
          opts = { nowait = true, silent = true }
        },
        ["<esc>"] = require('telescope.actions').close,
      }
    }
  },
})
require('telescope').load_extension('git_diffs')
