local packer = require('packer')
return packer.startup({
	config = {
		opt_default = false,
		display = {open_cmd = 'tabedit', keybindings = {prompt_revert = 'R', diff = 'D'}},
    git = {
      default_url_format = 'https://github.com/%s' -- Lua format string used for "aaa/bbb" style plugins
    },
	},
	function()
		-- Packer can manage itself
		local function conf(name)
            return ([[require('config').%s()]]):format(name)
        end
    use {'wbthomason/packer.nvim'}

    -- autopair
    use {'Raimondi/delimitMate', event = 'InsertEnter',opt = true }

    use {
         'kevinhwang91/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- comment
    use {'numToStr/Comment.nvim'}
    use {'JoosepAlviste/nvim-ts-context-commentstring'}

    -- imporve f action
    -- use {'kevinhwang91/nvim-fFHighlight',opt = false}

    -- asyncSeries
    use {'skywind3000/vim-terminal-help'}
    use {'skywind3000/asynctasks.vim',keys={'<F5>','<F6>','<F7>','<F8>'},wants={'asyncrun.vim'},opt=true,config=conf('asynctask')}
    use {'skywind3000/asyncrun.vim'}

    -- themes
    --use {'sainnhe/everforest'}
    use { 'EdenEast/nightfox.nvim'}
    -- use {'catppuccin/nvim'}
    -- use {"rockyzhang24/arctic.nvim", branch ="v2",  requires = {"rktjmp/lush.nvim"}}
    --use { 'NTBBloodbath/doom-one.nvim'}
    --use { 'glepnir/zephyr-nvim' }
    --use { 'theniceboy/nvim-deus' }

    -- show color
    -- use {'equalsraf/neovim-gui-shim'}
    use {'norcalli/nvim-colorizer.lua'}

    -- statusline
    use {'kyazdani42/nvim-web-devicons'}
    -- use {'blurname/tabline.nvim'}

    --coc
    use {'neoclide/coc.nvim', branch = 'master', run = 'npm ci',disable=false}

    --vista.vim symbol navigation
    use {'tweekmonster/startuptime.vim', cmd = 'StartupTime',opt=true}
    -- fuzzy file finder
    use {'Yggdroot/LeaderF', run = ':LeaderfInstallCExtension'}
    -- use {'linjiX/LeaderF-git'}
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.2',
      -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
    -- use {
      -- 'paopaol/telescope-git-diffs.nvim',
      -- requires = {
      --   "nvim-lua/plenary.nvim",
      --   "sindrets/diffview.nvim",
      -- },
    -- }

    -- change surrounding symbol
    use {'machakann/vim-sandwich'}

    -- char search
    use {'kevinhwang91/nvim-hlslens'}
    use {'mg979/vim-visual-multi'}
    use {'haya14busa/vim-asterisk'}

    -- file-tree
    use {'MunifTanjim/nui.nvim'}

    --git
    use {'tpope/vim-fugitive',config=conf('fugitive')}
    use {'rbong/vim-flog',opt=true,cmd={'Flog','Flogsplit'}}
    --use {'TimUntersberger/neogit'}
    use {'kdheepak/lazygit.nvim'}
    use {'lewis6991/gitsigns.nvim'}
    use {'sindrets/diffview.nvim'}

    --quickfix
    use {'kevinhwang91/nvim-bqf'}
    use {'junegunn/fzf', run = function()vim.fn['fzf#install']()end}
    --use {'junegunn/fzf.vim', run = function()vim.fn['fzf#install']()end}
    use {'blurname/vim-grepper'}

    use {'lambdalisue/suda.vim'}

    use {'brenoprata10/nvim-highlight-colors'}

    -- use {'elkowar/yuck.vim'}

    use {'sbdchd/neoformat'}

    use {'nvim-lua/plenary.nvim'}

    -- session
    use {'Shatur/neovim-session-manager'}

    -- lsp
    -- use {'rescript-lang/vim-rescript'}

    -- fold
    use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}
    use {'ThePrimeagen/harpoon'}
    --use {'Yggdroot/indentLine'}

    use {'skywind3000/vim-quickui'}
    use {'skywind3000/vim-quickui-navigator' }

    -- copy between local & remote
    use {'ojroques/vim-oscyank'}

    -- use {'rcarriga/nvim-notify'}

    -- search
    use {'folke/flash.nvim'}
    -- use {'nvim-pack/nvim-spectre'}
    -- use '/home/bl/prjs/tabline.nvim'
    use {'blurname/nvim-spectre', branch = 'bl/dev'}
    use {'paopaol/telescope-git-diffs.nvim'}
	end
})
