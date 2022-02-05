local packer = require('packer')
return packer.startup({
	config = {
		opt_default = false,
		display = {open_cmd = 'tabedit', keybindings = {prompt_revert = 'R', diff = 'D'}},
		git = {
			default_url_format = 'https://github.com.cnpmjs.org/%s'
		}
	},
	function()
		-- Packer can manage itself
		local function conf(name)
            return ([[require('config').%s()]]):format(name)
        end
		use {'wbthomason/packer.nvim'}

		-- comment
		use {'preservim/nerdcommenter',keys ='<Plug>NERDCommenterToggle',opt=true}

		-- autopair
		use {'Raimondi/delimitMate', event = 'InsertEnter',opt = true }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
		use{'nvim-treesitter/playground'}

		-- imporve f action
		use {'rhysd/clever-f.vim',keys={'f','F','t','T'},config=conf('cleverf')}

		-- asyncSeries
		use {'skywind3000/vim-terminal-help'}
		use {'skywind3000/asynctasks.vim',keys={'<F5>','<F6>','<F7>','<F8>'},wants={'asyncrun.vim'},opt=true,config=conf('asynctask')}
		use {'skywind3000/asyncrun.vim',opt=true}

		-- themes
		--use {'sainnhe/edge'}
		--use {'sainnhe/everforest'}
		use{ 'EdenEast/nightfox.nvim'}
		use {'folke/tokyonight.nvim'}


		-- show color
		-- use {'equalsraf/neovim-gui-shim'}
		use {'norcalli/nvim-colorizer.lua'}

		-- statusline
		use {'kyazdani42/nvim-web-devicons'}
    use {'famiu/feline.nvim'}

		--coc
    use {'neoclide/coc.nvim', branch = 'master', run = 'yarn install --frozen-lockfile',disable=false}
		--use {'neoclide/coc.nvim', branch = 'release'}

		--vista.vim symbol navigation
		use {'tweekmonster/startuptime.vim', cmd = 'StartupTime',opt=true}
		-- fuzzy file finder
		use {'Yggdroot/LeaderF', run = ':LeaderfInstallCExtension'} 

		-- change surrounding symbol
		use {'machakann/vim-sandwich'}

		-- char search
		use {'kevinhwang91/nvim-hlslens'}
		use {'mg979/vim-visual-multi'}
		use {'haya14busa/vim-asterisk'}

		-- file-tree
		--use {'kevinhwang91/rnvimr',opt = false}

		-- auto-save {	
		use {'Pocco81/AutoSave.nvim'}

		--git
		use {'tpope/vim-fugitive'}
		use {'rbong/vim-flog',opt=true,cmd={'Flog','Flogsplit'}}

		--quickfix
		use {'kevinhwang91/nvim-bqf',branch = 'dev'}
		use {'lambdalisue/suda.vim',opt=true,keys={'n','<leader>W'},config=conf('suda')}
		use {'KabbAmine/vCoolor.vim'}
		use {'elkowar/yuck.vim'}
		use {'sbdchd/neoformat'}

		--nvim-lsp
		use{'neovim/nvim-lspconfig'}
    use{'williamboman/nvim-lsp-installer'}
		
		--nvim-cmp
		use {'hrsh7th/cmp-nvim-lsp'}
		use {'hrsh7th/cmp-buffer'}
		use {'hrsh7th/cmp-path'}
		--use {'hrsh7th/cmp-cmdline'}
		use {'hrsh7th/nvim-cmp'}
		
		--nvim-snip
		use {'L3MON4D3/LuaSnip'}
		use {'saadparwaiz1/cmp_luasnip'}

		use {'nvim-lua/plenary.nvim'}
		use {'lewis6991/gitsigns.nvim'}

		-- init.lua
		use {"lukas-reineke/indent-blankline.nvim"}
	end
})
