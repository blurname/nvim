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

		-- imporve f action
		use {'rhysd/clever-f.vim',keys={'f','F','t','T'},config=conf(cleverf)}

		-- asyncSeries
		
		use {'skywind3000/vim-terminal-help'}
		use {'skywind3000/asynctasks.vim',keys={'<F5>','<F6>','<F7>','<F8>'},wants={'asyncrun.vim'},opt=true,config=conf('asynctask')}
		use {'skywind3000/asyncrun.vim',opt=true}

		-- themes
		use {'sainnhe/edge'}
		use {'sainnhe/everforest'}

		-- show color
		-- use {'equalsraf/neovim-gui-shim'}

		-- statusline
		use	{'glepnir/galaxyline.nvim', branch = 'main', config = function() require 'myline' end}
		use {'kyazdani42/nvim-web-devicons'}

		--coc
		use {'neoclide/coc.nvim', branch = 'master', run = 'yarn install --frozen-lockfile'}

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
		use {'kevinhwang91/rnvimr',opt = false}

		-- auto-save {	
		use {'Pocco81/AutoSave.nvim'}

		--git
		use {'tpope/vim-fugitive'}
		use {'rbong/vim-flog',opt=true,cmd={'Flog','Flogsplit'}}

		--quickfix
		use {'kevinhwang91/nvim-bqf'}
		use {'lambdalisue/suda.vim',opt=true,keys={'n','<leader>W'},config=conf(suda)}

	end
})
