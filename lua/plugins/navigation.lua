-- 导航相关插件
return {
  -- Neo-tree 文件树
  {
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
    },
    config = function()
      require('neo-tree').setup({
        hide_root_node = true,
        retain_hidden_root_indent = true,
        default_component_configs = {
          indent = {
            with_expanders = true,
            expander_collapsed = '',
            expander_expanded = '',
          },
        },
        filesystem = {
          filtered_items = {
            visible = false,
            hide_dotfiles = false,
            hide_gitignored = false,
            hide_hidden = true,
          },
          window = {
            mappings = {
              ['<bs>'] = 'navigate_up',
              ['.'] = 'set_root',
              ['H'] = 'toggle_hidden',
              ['/'] = 'fuzzy_finder',
              ['D'] = 'fuzzy_finder_directory',
              ['#'] = 'fuzzy_sorter',
              ['f'] = 'filter_on_submit',
              ['<c-x>'] = 'clear_filter',
              ['[g'] = 'prev_git_modified',
              [']g'] = 'next_git_modified',
              ['o'] = {
                'show_help',
                nowait = false,
                config = { title = 'Order by', prefix_key = 'o' },
              },
              ['oc'] = { 'order_by_created', nowait = false },
              ['od'] = { 'order_by_diagnostics', nowait = false },
              ['og'] = { 'order_by_git_status', nowait = false },
              ['om'] = { 'order_by_modified', nowait = false },
              ['on'] = { 'order_by_name', nowait = false },
              ['os'] = { 'order_by_size', nowait = false },
              ['ot'] = { 'order_by_type', nowait = false },
            },
            fuzzy_finder_mappings = {
              ['<down>'] = 'move_cursor_down',
              ['<C-j>'] = 'move_cursor_down',
              ['<up>'] = 'move_cursor_up',
              ['<C-k>'] = 'move_cursor_up',
              ['<esc>'] = 'close',
              ['<S-CR>'] = 'close_keep_filter',
              ['<C-CR>'] = 'close_clear_filter',
              ['<C-w>'] = { '<C-S-w>', raw = true },
            },
          },
        },
      })

      -- Neo-tree 按键映射
      vim.keymap.set('n', '<leader>v', ':Neotree position=float reveal<CR>')
      vim.keymap.set('n', '<leader>e', ':Neotree position=right reveal<CR>')
    end,
  },

  -- nvim-tree (备用)
  { 'nvim-tree/nvim-tree.lua' },

  -- Harpoon 文件标记
  {
    'ThePrimeagen/harpoon',
    config = function()
      require('harpoon').setup({
        menu = {
          width = 120,
        },
      })

      -- Harpoon 按键映射
      vim.keymap.set('n', '<A-p>', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', { silent = true })
      vim.keymap.set('n', '<A-m>', ':lua require("harpoon.mark").add_file()<CR>')
      vim.keymap.set('n', '<A-1>', ':lua require("harpoon.ui").nav_prev()<CR>', { silent = true })
      vim.keymap.set('n', '<A-2>', ':lua require("harpoon.ui").nav_next()<CR>', { silent = true })

      -- Harpoon buffer 内按键映射
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'harpoon',
        callback = function()
          for i = 1, 9 do
            vim.keymap.set('n', tostring(i), function()
              require('harpoon.ui').nav_file(i)
            end, { buffer = true, silent = true })
          end
        end,
      })
    end,
  },

  -- LSP 文件操作
  {
    'antosha417/nvim-lsp-file-operations',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('lsp-file-operations').setup()
    end,
  },
}

