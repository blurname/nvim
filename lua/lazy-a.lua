local lazy = require("lazy")
return lazy.setup({
    -- autopair
      {'Raimondi/delimitMate', event = 'InsertEnter',lazy=true},

      {'kevinhwang91/nvim-treesitter',build = ':TSUpdate'},

    -- comment
      {'numToStr/Comment.nvim'},
      {'JoosepAlviste/nvim-ts-context-commentstring'},

    -- imporve f action
    --   {'kevinhwang91/nvim-fFHighlight',opt = false}

    -- asyncSeries
      {'skywind3000/vim-terminal-help'},
      {'skywind3000/asynctasks.vim'},
      {'skywind3000/asyncrun.vim'},

    -- themes
      { 'EdenEast/nightfox.nvim'},

    -- show color
      {'norcalli/nvim-colorizer.lua'},

    -- statusline
      {'kyazdani42/nvim-web-devicons'},

    --coc
      -- {'neoclide/coc.nvim', branch = 'master', build = 'npm ci'},

    --vista.vim symbol navigation
      {'tweekmonster/startuptime.vim', cmd = 'StartupTime'},
    -- fuzzy file finder
      -- {'Yggdroot/LeaderF', run = ':LeaderfInstallCExtension'},

    -- change surrounding symbol
      {'machakann/vim-sandwich'},

    -- char search
      {'kevinhwang91/nvim-hlslens'},
      {'mg979/vim-visual-multi'},
      {'haya14busa/vim-asterisk'},

    -- file-tree

    --git
      {'tpope/vim-fugitive'},
      {'rbong/vim-flog',cmd={'Flog','Flogsplit'}},
      {'kdheepak/lazygit.nvim'},
      {'lewis6991/gitsigns.nvim'},
      {'sindrets/diffview.nvim'},

    --quickfix
      {'kevinhwang91/nvim-bqf'},
      {'junegunn/fzf', build = function()vim.fn['fzf#install']()end},
      {'blurname/vim-grepper'},

      {'lambdalisue/suda.vim'},

      {'brenoprata10/nvim-highlight-colors'},

    --   {'elkowar/yuck.vim'}

      -- {'sbdchd/neoformat'},

      {'nvim-lua/plenary.nvim'},

    -- session
      {'Shatur/neovim-session-manager'},

    -- lsp

    -- fold
      {'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async'},
      {'ThePrimeagen/harpoon'},
    --  {'Yggdroot/indentLine'}

      {'skywind3000/vim-quickui'},
      {'skywind3000/vim-quickui-navigator' },

    -- copy between local & remote
      {'ojroques/vim-oscyank'},

    --   {'rcarriga/nvim-notify'}

    -- search
      {'folke/flash.nvim'},
    --   '/home/bl/prjs/tabline.nvim'
      -- {'blurname/nvim-spectre', branch = 'bl/dev'},
      {'akinsho/toggleterm.nvim'},
      {'willothy/flatten.nvim'},
      -- {'lukas-reineke/indent-blankline.nvim'},
      {'MagicDuck/grug-far.nvim'},
      {'nvim-tree/nvim-tree.lua'},
      {
        'saghen/blink.cmp',
        -- optional: provides snippets for the snippet source
        dependencies = { 'rafamadriz/friendly-snippets' },

        -- use a release tag to download pre-built binaries
        version = '1.*',
        -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
        -- build = 'cargo build --release',
        -- If you use nix, you can build from source using latest nightly rust with:
        -- build = 'nix run .#build-plugin',
        opts_extend = { "sources.default" }
      },
      -- {'mfussenegger/nvim-lint'},
      {'esmuellert/nvim-eslint'},
      {'jinzhongjia/LspUI.nvim',},
      {'windwp/nvim-ts-autotag'},
      {'nvim-neo-tree/neo-tree.nvim',
      dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
      },
    },
      {
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
    -- Uncomment whichever supported plugin(s) you use
    -- "nvim-tree/nvim-tree.lua",
    -- "nvim-neo-tree/neo-tree.nvim",
    -- "simonmclean/triptych.nvim"
    },
    config = function()
      require("lsp-file-operations").setup()
    end,
  },
  {
  "hedyhli/outline.nvim",
  config = function()
    -- Example mapping to toggle outline
    vim.keymap.set("n", "<leader>s", "<cmd>Outline<CR>",
      { desc = "Toggle Outline" })

    require("outline").setup {
      -- Your setup opts here (leave empty to use defaults)
    }
  end,
},
{
  'moonbit-community/moonbit.nvim',
  ft = { 'moonbit' },
  opts = {
    mooncakes = {
      virtual_text = true,   -- virtual text showing suggestions
      use_local = true,      -- recommended, use index under ~/.moon
    },
    -- optionally disable the treesitter integration
    treesitter =  {
      enabled = true,
      -- Set false to disable automatic installation and updating of parsers.
      auto_install = true
    },
    -- configure the language server integration
    -- set `lsp = false` to disable the language server integration
    lsp = {
      -- provide an `on_attach` function to run when the language server starts
      on_attach = function(client, bufnr) end,
      -- provide client capabilities to pass to the language server
      capabilities = vim.lsp.protocol.make_client_capabilities(),
    }
  },
}
})
