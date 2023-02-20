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

		-- comment
		use {'preservim/nerdcommenter',keys ='<Plug>NERDCommenterToggle',opt=true}

    -- autopair
    use {'Raimondi/delimitMate', event = 'InsertEnter',opt = true }

    use {
         'kevinhwang91/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- imporve f action
    use {'kevinhwang91/nvim-fFHighlight',opt = false}

    -- asyncSeries
    use {'skywind3000/vim-terminal-help'}
    use {'skywind3000/asynctasks.vim',keys={'<F5>','<F6>','<F7>','<F8>'},wants={'asyncrun.vim'},opt=true,config=conf('asynctask')}
    use {'skywind3000/asyncrun.vim',opt=true}

    -- themes
    use {'sainnhe/everforest'}
    use { 'EdenEast/nightfox.nvim'}
    use { 'glepnir/zephyr-nvim' }

    -- show color
    -- use {'equalsraf/neovim-gui-shim'}
    use {'norcalli/nvim-colorizer.lua'}

    -- statusline
    use {'kyazdani42/nvim-web-devicons'}
    --use {'famiu/feline.nvim'}

    --coc
    use {'neoclide/coc.nvim', branch = 'master', run = 'yarn install --frozen-lockfile',disable=false}

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
    --use {'nvim-neo-tree/neo-tree.nvim', branch='v2.x'}
    use {'MunifTanjim/nui.nvim'}

    --git
    use {'tpope/vim-fugitive',config=conf('fugitive')}
    use {'rbong/vim-flog',opt=true,cmd={'Flog','Flogsplit'}}
    --use {'TimUntersberger/neogit'}
    use {'kdheepak/lazygit.nvim'}
    use {'lewis6991/gitsigns.nvim'}

    --quickfix
    use {'kevinhwang91/nvim-bqf'}
    use {'junegunn/fzf', run = function()vim.fn['fzf#install']()end}
    use {'mhinz/vim-grepper', run = function()vim.fn['fzf#install']()end}

    use {'lambdalisue/suda.vim',opt=true,keys={'n','<leader>W'},config=conf('suda')}
    use {'KabbAmine/vCoolor.vim'}
    use {'elkowar/yuck.vim'}
    use {'sbdchd/neoformat'}

    use {'nvim-lua/plenary.nvim'}

    -- session
    use {'Shatur/neovim-session-manager'}

    -- lsp
    use {'rescript-lang/vim-rescript'}

    -- fold
    use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}
	end
})
