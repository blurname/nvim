local lazy = require('lazy')
return lazy.setup({

		-- comment
		 {'preservim/nerdcommenter'},

    -- autopair
     {'Raimondi/delimitMate'},

     { 'kevinhwang91/nvim-treesitter', build=':TSUpdate' },

    -- imporve f action
     {'kevinhwang91/nvim-fFHighlight'},

    -- asyncSeries
     {'skywind3000/vim-terminal-help'},
     {'skywind3000/asynctasks.vim',dependencies={'asyncrun.vim'}},
     {'skywind3000/asyncrun.vim'},

    -- themes
     { 'EdenEast/nightfox.nvim'},

    -- show color
    --  {'equalsraf/neovim-gui-shim'}
     {'norcalli/nvim-colorizer.lua'},

    -- statusline
     {'kyazdani42/nvim-web-devicons'},

    --coc
     {'neoclide/coc.nvim', branch = 'master', build = 'yarn install --frozen-lockfile'},

    --vista.vim symbol navigation
     {'tweekmonster/startuptime.vim', cmd = 'StartupTime'},
    -- fuzzy file finder
     {'Yggdroot/LeaderF', build = ':LeaderfInstallCExtension'},
     {'linjiX/LeaderF-git'},

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
     {'rbong/vim-flog'},
     {'kdheepak/lazygit.nvim'},

    --quickfix
     {'kevinhwang91/nvim-bqf'},

     {'lambdalisue/suda.vim'},
     {'KabbAmine/vCoolor.vim'},
     {'elkowar/yuck.vim'},
     {'sbdchd/neoformat'},

     {'nvim-lua/plenary.nvim'},

    -- session
     {'Shatur/neovim-session-manager'},

    -- lsp
     {'rescript-lang/vim-rescript'},

    -- fold
     {'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async'},
     {'ThePrimeagen/harpoon'},

     {'skywind3000/vim-quickui'},
     { 'skywind3000/vim-quickui-navigator' },

    -- copy between local & remote
     {'ojroques/vim-oscyank'},

     {'rcarriga/nvim-notify'}
	--end
})
