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

		use {'tomtom/tcomment_vim'}
		use {'jiangmiao/auto-pairs'}
		-- press enter to selcet the whole
		use {'gcmt/wildfire.vim'}
		-- asyncSeries
		use {'skywind3000/vim-terminal-help'}
		use {'skywind3000/asynctasks.vim'}
		use {'skywind3000/asyncrun.vim'}
		-- themes

		use {'glepnir/zephyr-nvim'}
		use {'sainnhe/edge'}
		use {'ajmwagar/vim-deus'}
		use {'sainnhe/everforest'}

		-- show color
		use {'norcalli/nvim-colorizer.lua'}

		use {'equalsraf/neovim-gui-shim'}
		-- statusline
		use	{'glepnir/galaxyline.nvim', branch = 'main', config = function() require 'myline' end}

		use {'kyazdani42/nvim-web-devicons'}

		--coc
		use {'neoclide/coc.nvim', branch = 'release'}
		-- fuzzy file finder
		use {'Yggdroot/LeaderF', run = ':LeaderfInstallCExtension'} 

		-- change surrounding symbol
		use {'tpope/vim-surround'}

		-- snippet
		use {'honza/vim-snippets'}
		use {'skywind3000/LeaderF-snippet',disable = false,} 
		use {'SirVer/ultisnips',}
		--
		-- replace
		use {'brooth/far.vim'}
		-- char search
		use {'justinmk/vim-sneak'}

		-- file-tree
		use {'kyazdani42/nvim-tree.lua'}
		-- auto-save {	
		use {'Pocco81/AutoSave.nvim'}

	end
})
