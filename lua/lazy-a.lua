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
      {'neoclide/coc.nvim', branch = 'master', build = 'npm ci'},

    --vista.vim symbol navigation
      {'tweekmonster/startuptime.vim', cmd = 'StartupTime'},
    -- fuzzy file finder
      {'Yggdroot/LeaderF', run = ':LeaderfInstallCExtension'},

    -- change surrounding symbol
      {'machakann/vim-sandwich'},

    -- char search
      {'kevinhwang91/nvim-hlslens'},
      {'mg979/vim-visual-multi'},
      {'haya14busa/vim-asterisk'},

    -- file-tree
      {'MunifTanjim/nui.nvim'},

    --git
      {'tpope/vim-fugitive'},
      {'rbong/vim-flog',cmd={'Flog','Flogsplit'}},
    --  {'TimUntersberger/neogit'}
      {'kdheepak/lazygit.nvim'},
      {'lewis6991/gitsigns.nvim'},
      {'sindrets/diffview.nvim'},

    --quickfix
      {'kevinhwang91/nvim-bqf'},
      {'junegunn/fzf', build = function()vim.fn['fzf#install']()end},
    --  {'junegunn/fzf.vim', run = function()vim.fn['fzf#install']()end}
      {'blurname/vim-grepper'},

      {'lambdalisue/suda.vim'},

      {'brenoprata10/nvim-highlight-colors'},

    --   {'elkowar/yuck.vim'}

      {'sbdchd/neoformat'},

      {'nvim-lua/plenary.nvim'},

    -- session
      {'Shatur/neovim-session-manager'},

    -- lsp
    --   {'rescript-lang/vim-rescript'}

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
    --   {'nvim-pack/nvim-spectre'}
    --   '/home/bl/prjs/tabline.nvim'
      {'blurname/nvim-spectre', branch = 'bl/dev'},
      {'paopaol/telescope-git-diffs.nvim'},
      {'akinsho/toggleterm.nvim'},
      {'willothy/flatten.nvim'},
      {'lukas-reineke/indent-blankline.nvim'}
})
