return require('packer').startup({
	config = {
		opt_default = false,
		git = {
			default_url_format = 'https://github.com.cnpmjs.org/%s'
		}
	},
	function()
		-- Packer can manage itself
		use {'wbthomason/packer.nvim'}
-- comment
		use {'tomtom/tcomment_vim'}
		-- use {'jiangmiao/auto-pairs'}
		-- autopair
		use {'Raimondi/delimitMate', event = 'InsertEnter',opt = true }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

		-- press enter to selcet the whole
		use {'gcmt/wildfire.vim'}

		-- imporve f action
		use {'rhysd/clever-f.vim'}

		-- asyncSeries
		
		use {'skywind3000/vim-terminal-help'}
		use {'skywind3000/asynctasks.vim'}
		use {'skywind3000/asyncrun.vim'}

		-- themes
		use {'glepnir/zephyr-nvim'}
		use {'ajmwagar/vim-deus'}
		use {'sainnhe/edge'}
		use {'sainnhe/everforest'}
		use {'joshdick/onedark.vim'}

		-- show color
		use {'norcalli/nvim-colorizer.lua'}
		use {'equalsraf/neovim-gui-shim'}

		-- statusline
		use	{'glepnir/galaxyline.nvim', branch = 'main', config = function() require 'eviline' end}
		use {'kyazdani42/nvim-web-devicons'}

		--coc
		use {'neoclide/coc.nvim', branch = 'master', run = 'yarn install --frozen-lockfile'}

		--vista.vim symbol navigation
		use {'liuchengxu/vista.vim'}

		-- fuzzy file finder
		use {'Yggdroot/LeaderF', run = ':LeaderfInstallCExtension'} 

		-- change surrounding symbol
		-- use {'tpope/vim-surround'}
		use {'machakann/vim-sandwich'}

		-- snippet
		use {'honza/vim-snippets'}
		-- use {'skywind3000/LeaderF-snippet',disable = false,} 
		-- use {'SirVer/ultisnips',}

		-- replace
		use {'brooth/far.vim'}

		-- char search
		use {'kevinhwang91/nvim-hlslens'}

		-- file-tree
		use {'kyazdani42/nvim-tree.lua',disable = true}
		use {'kevinhwang91/rnvimr',opt = false}

		-- auto-save {	
		use {'Pocco81/AutoSave.nvim'}

		--git
		use {'tpope/vim-fugitive'}
		use {'rbong/vim-flog'}

		--quickfix
		use {'kevinhwang91/nvim-bqf'}

		--scroll
		-- use {'karb94/neoscroll.nvim'}

		--fold

	end
})
