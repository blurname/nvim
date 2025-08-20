---- mine

---- plugin
-- raw
-- require('fFHighlight').setup()
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

require('lazy-a')

require('hlslens').setup()
require('config')

-- config patch
require('config.treesitter')
require('config.nightfox')
-- require('arctic')
require('config.gitsigns')
require('config.session-manager')
require('config.ufo')
require('config.bqf')
require('config.ufo')
require('config.comment')
require("harpoon").setup({
    menu = {
        width = 120,
    }
})
require('nvim-highlight-colors').setup{}
require('m-tabline')
require('a-diffview')
require('m-flash')
require('toggleterm-m')
-- require('config.nvim-tree')
require('grug-far').setup({
   -- engine = 'ripgrep' is default, but 'astgrep' can be specified...
   debounceMs = 500,
   wrap = false,
   normalModeSearch = true,
   prefills = {
     search = '',
     replacement = '',
     filesFilter = '!public/',
     flags = '-i -F',
     paths = '',
   }
});
vim.keymap.set('n', '<leader>i', '<cmd>lua require("grug-far").toggle_instance({instanceName = "gf"})<CR>' )
vim.keymap.set('x', '<leader>i', '<cmd>lua require("grug-far").with_visual_selection({ prefills = { paths = vim.fn.expand("%") } })<CR>' )
require('fzf')
-- require('config.autosave')
require('vmlens')
require('lspConfig')
require('blinkConfig')
-- require('lint')
require('nvim-eslint').setup({})
--   on_attach = function(client, bufnr)
--   client.server_capabilities.documentFormattingProvider = true
--
--   local format = function()
--     vim.lsp.buf.format({ timeout_ms = 2000 })
--   end
--   vim.keymap.set('n', 'ff', format, { silent = true, buffer = bufnr, desc = 'eslint fix' })
-- end,
-- })
require('lspUI-config')
require('nvim-ts-autotag').setup({
  opts = {
    -- Defaults
    enable_close = true, -- Auto close tags
    enable_rename = true, -- Auto rename pairs of tags
    enable_close_on_slash = false -- Auto close on trailing </
  },
  -- Also override individual filetype configs, these take priority.
  -- Empty by default, useful if one of the "opts" global settings
  -- doesn't work well in a specific filetype
  per_filetype = {
    ["html"] = {
      enable_close = false
    }
  }
})
require('neo-tree').setup({
    filesystem = {
    filtered_items = {
      visible = false, -- when true, they will just be displayed differently than normal items
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_hidden = true, -- only works on Windows for hidden files/directories
      hide_by_name = {
        --"node_modules"
      },
      hide_by_pattern = { -- uses glob style patterns
        --"*.meta",
        --"*/src/*/tsconfig.json",
      },
      always_show = { -- remains visible even if other settings would normally hide it
        --".gitignored",
      },
      always_show_by_pattern = { -- uses glob style patterns
        --".env*",
      },
      never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
        --".DS_Store",
        --"thumbs.db"
      },
      never_show_by_pattern = { -- uses glob style patterns
        --".null-ls_*",
      },
    },
      window = {
      mappings = {
        ["<bs>"] = "navigate_up",
        ["."] = "set_root",
        ["H"] = "toggle_hidden",
        ["/"] = "fuzzy_finder",
        ["D"] = "fuzzy_finder_directory",
        ["#"] = "fuzzy_sorter", -- fuzzy sorting using the fzy algorithm
        -- ["D"] = "fuzzy_sorter_directory",
        ["f"] = "filter_on_submit",
        ["<c-x>"] = "clear_filter",
        ["[g"] = "prev_git_modified",
        ["]g"] = "next_git_modified",
        ["o"] = {
          "show_help",
          nowait = false,
          config = { title = "Order by", prefix_key = "o" },
        },
        ["oc"] = { "order_by_created", nowait = false },
        ["od"] = { "order_by_diagnostics", nowait = false },
        ["og"] = { "order_by_git_status", nowait = false },
        ["om"] = { "order_by_modified", nowait = false },
        ["on"] = { "order_by_name", nowait = false },
        ["os"] = { "order_by_size", nowait = false },
        ["ot"] = { "order_by_type", nowait = false },
        -- ['<key>'] = function(state) ... end,
      },
      fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
        ["<down>"] = "move_cursor_down",
        ["<C-j>"] = "move_cursor_down",
        ["<up>"] = "move_cursor_up",
        ["<C-k>"] = "move_cursor_up",
        ["<esc>"] = "close",
        ["<S-CR>"] = "close_keep_filter",
        ["<C-CR>"] = "close_clear_filter",
        ["<C-w>"] = { "<C-S-w>", raw = true },
        {
          -- normal mode mappings
          n = {
            ["j"] = "move_cursor_down",
            ["k"] = "move_cursor_up",
            ["<S-CR>"] = "close_keep_filter",
            ["<C-CR>"] = "close_clear_filter",
            ["<esc>"] = "close",
          }
        }
        -- ["<esc>"] = "noop", -- if you want to use normal mode
        -- ["key"] = function(state, scroll_padding) ... end,
      },
    },
  }
})
