-- Git 相关插件
return {
  -- Fugitive
  { 'tpope/vim-fugitive' },

  -- Git log 查看器
  { 'rbong/vim-flog', cmd = { 'Flog', 'Flogsplit' } },

  -- LazyGit
  { 'kdheepak/lazygit.nvim' },

  -- Gitsigns
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup({
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '-' },
          topdelete = { text = 'q' },
          changedelete = { text = 'w' },
          untracked = { text = '+' },
        },
        signs_staged = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '-' },
          topdelete = { text = 'q' },
          changedelete = { text = 'w' },
          untracked = { text = 'e' },
        },
        signcolumn = true,
        numhl = false,
        linehl = false,
        word_diff = false,
        watch_gitdir = {
          interval = 100,
          follow_files = true,
        },
        attach_to_untracked = true,
        current_line_blame = false,
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = 'eol',
          delay = 100,
          ignore_whitespace = false,
        },
        current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil,
        max_file_length = 40000,
        preview_config = {
          border = 'single',
          style = 'minimal',
          relative = 'cursor',
          row = 0,
          col = 1,
        },
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, { silent = true })
          end

          -- Navigation
          map('n', ']c', function()
            if vim.wo.diff then
              return ']c'
            end
            vim.schedule(function()
              gs.next_hunk()
            end)
            return '<Ignore>'
          end, { expr = true })

          map('n', '[c', function()
            if vim.wo.diff then
              return '[c'
            end
            vim.schedule(function()
              gs.prev_hunk()
            end)
            return '<Ignore>'
          end, { expr = true })

          -- Actions
          map({ 'n', 'v' }, 'gu', ':Gitsigns reset_hunk<CR>')
          map('n', 'gj', ':Gitsigns next_hunk<CR>')
          map('n', 'gk', ':Gitsigns prev_hunk<CR>')
          map('n', '<leader>hp', gs.preview_hunk)
          map('n', '<leader>hd', gs.diffthis)
        end,
      })
    end,
  },

  -- Diffview
  {
    'sindrets/diffview.nvim',
    config = function()
      local actions = require('diffview.actions')
      require('diffview').setup({
        hooks = {
          view_closed = function(view)
            vim.cmd('CocEnable')
          end,
        },
        keymaps = {
          disable_defaults = false,
          view = {
            { 'n', '<tab>', actions.select_next_entry, { desc = 'Open the diff for the next file' } },
            { 'n', '<c-tab>', actions.select_prev_entry, { desc = 'Open the diff for the previous file' } },
            { 'n', 'gf', actions.goto_file_edit, { desc = 'Open the file in the previous tabpage' } },
            { 'n', '<C-w><C-f>', actions.goto_file_split, { desc = 'Open the file in a new split' } },
            { 'n', '<C-w>gf', actions.goto_file_tab, { desc = 'Open the file in a new tabpage' } },
            { 'n', '<leader>e', actions.focus_files, { desc = 'Bring focus to the file panel' } },
            { 'n', '<leader>b', actions.toggle_files, { desc = 'Toggle the file panel.' } },
            { 'n', 'g<C-x>', actions.cycle_layout, { desc = 'Cycle through available layouts.' } },
            { 'n', 'gk', actions.prev_conflict, { desc = 'In the merge-tool: jump to the previous conflict' } },
            { 'n', 'gj', actions.next_conflict, { desc = 'In the merge-tool: jump to the next conflict' } },
            { 'n', '<leader>ch', actions.conflict_choose('ours'), { desc = 'Choose the OURS version of a conflict' } },
            { 'n', '<leader>cl', actions.conflict_choose('theirs'), { desc = 'Choose the THEIRS version of a conflict' } },
            { 'n', '<leader>cb', actions.conflict_choose('base'), { desc = 'Choose the BASE version of a conflict' } },
            { 'n', '<leader>ca', actions.conflict_choose('all'), { desc = 'Choose all the versions of a conflict' } },
            { 'n', 'dx', actions.conflict_choose('none'), { desc = 'Delete the conflict region' } },
          },
          file_panel = {
            { 'n', 'j', actions.next_entry, { desc = 'Bring the cursor to the next file entry' } },
            { 'n', '<down>', actions.next_entry, { desc = 'Bring the cursor to the next file entry' } },
            { 'n', 'k', actions.prev_entry, { desc = 'Bring the cursor to the previous file entry' } },
            { 'n', '<up>', actions.prev_entry, { desc = 'Bring the cursor to the previous file entry' } },
            { 'n', '<cr>', actions.select_entry, { desc = 'Open the diff for the selected entry' } },
            { 'n', 'o', actions.select_entry, { desc = 'Open the diff for the selected entry' } },
            { 'n', 'l', actions.select_entry, { desc = 'Open the diff for the selected entry' } },
            { 'n', '-', actions.toggle_stage_entry, { desc = 'Stage / unstage the selected entry' } },
            { 'n', 'S', actions.stage_all, { desc = 'Stage all entries' } },
            { 'n', 'U', actions.unstage_all, { desc = 'Unstage all entries' } },
            { 'n', 'X', actions.restore_entry, { desc = 'Restore entry to the state on the left side' } },
            { 'n', 'L', actions.open_commit_log, { desc = 'Open the commit log panel' } },
            { 'n', 'h', actions.close_fold, { desc = 'Collapse fold' } },
            { 'n', 'za', actions.toggle_fold, { desc = 'Toggle fold' } },
            { 'n', 'zR', actions.open_all_folds, { desc = 'Expand all folds' } },
            { 'n', 'zM', actions.close_all_folds, { desc = 'Collapse all folds' } },
            { 'n', '<tab>', actions.select_next_entry, { desc = 'Open the diff for the next file' } },
            { 'n', 'gf', actions.goto_file_edit, { desc = 'Open the file in the previous tabpage' } },
            { 'n', 'i', actions.listing_style, { desc = "Toggle between 'list' and 'tree' views" } },
            { 'n', 'f', actions.toggle_flatten_dirs, { desc = 'Flatten empty subdirectories in tree listing style' } },
            { 'n', 'R', actions.refresh_files, { desc = 'Update stats and entries in the file list' } },
            { 'n', '<leader>e', actions.focus_files, { desc = 'Bring focus to the file panel' } },
            { 'n', '<leader>b', actions.toggle_files, { desc = 'Toggle the file panel' } },
          },
          file_history_panel = {
            { 'n', 'L', actions.open_in_diffview, { desc = 'Open the entry under the cursor in a diffview' } },
            { 'n', 'y', actions.copy_hash, { desc = 'Copy the commit hash of the entry under the cursor' } },
            { 'n', 'zR', actions.open_all_folds, { desc = 'Expand all folds' } },
            { 'n', 'zM', actions.close_all_folds, { desc = 'Collapse all folds' } },
            { 'n', 'j', actions.next_entry, { desc = 'Bring the cursor to the next file entry' } },
            { 'n', '<down>', actions.next_entry, { desc = 'Bring the cursor to the next file entry' } },
            { 'n', 'k', actions.prev_entry, { desc = 'Bring the cursor to the previous file entry.' } },
            { 'n', '<up>', actions.prev_entry, { desc = 'Bring the cursor to the previous file entry.' } },
            { 'n', '<cr>', actions.select_entry, { desc = 'Open the diff for the selected entry.' } },
            { 'n', 'o', actions.select_entry, { desc = 'Open the diff for the selected entry.' } },
            { 'n', '<tab>', actions.select_next_entry, { desc = 'Open the diff for the next file' } },
            { 'n', 'gf', actions.goto_file_edit, { desc = 'Open the file in the previous tabpage' } },
            { 'n', '<leader>e', actions.focus_files, { desc = 'Bring focus to the file panel' } },
            { 'n', '<leader>b', actions.toggle_files, { desc = 'Toggle the file panel' } },
          },
        },
      })

      -- Git 相关按键映射
      vim.keymap.set('n', '<leader>ge', ':Gedit<CR>')
      vim.keymap.set('n', '<leader>gl', "V | :'<,'>DiffviewFileHistory<CR>")
      vim.keymap.set('v', '<leader>gl', ":'<,'>DiffviewFileHistory<CR>")
      vim.api.nvim_create_user_command('DiffviewHead', 'DiffviewOpen HEAD~1', {})
    end,
  },
}

