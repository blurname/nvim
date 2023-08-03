local lazy = require('lazy')
return lazy.setup({
	--config = {
		--opt_default = false,
		--display = {open_cmd = 'tabedit', keybindings = {prompt_revert = 'R', diff = 'D'}},
    --git = {
      --default_url_format = 'https://github.com/%s' -- Lua format string used for "aaa/bbb" style plugins
    --},
	--},
	--function()
		-- Packer can manage itself
		--local function conf(name)
            --return ([[require('config').%s()]]):format(name)
        --end
    -- {'wbthomason/packer.nvim'},

		-- comment
		 {'preservim/nerdcommenter',keys ='<Plug>NERDCommenterToggle'},

    -- autopair
     {'Raimondi/delimitMate', event = 'InsertEnter'},

     {
         'kevinhwang91/nvim-treesitter',
        run = ':TSUpdate'
    },

    -- imporve f action
     {'kevinhwang91/nvim-fFHighlight'},

    -- asyncSeries
     {'skywind3000/vim-terminal-help'},
     {'skywind3000/asynctasks.vim',keys={'<F5>','<F6>','<F7>','<F8>'},wants={'asyncrun.vim'},config=conf('asynctask')},
     {'skywind3000/asyncrun.vim'},

    -- themes
    -- {'sainnhe/everforest'}
     { 'EdenEast/nightfox.nvim'},
    -- {"rockyzhang24/arctic.nvim", branch ="v2",  requires = {"rktjmp/lush.nvim"}},
    -- { 'NTBBloodbath/doom-one.nvim'}
    -- { 'glepnir/zephyr-nvim' }
    -- { 'theniceboy/nvim-deus' }
    -- {'hardhackerlabs/theme-vim',config=function() vim.cmd.colorscheme 'hardhacker' end}

    -- show color
    --  {'equalsraf/neovim-gui-shim'}
     {'norcalli/nvim-colorizer.lua'},

    -- statusline
     {'kyazdani42/nvim-web-devicons'},
    -- {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'},
    -- {'freddiehaddad/feline.nvim'}

    --coc
     {'neoclide/coc.nvim', branch = 'master', run = 'yarn install --frozen-lockfile'},

    --vista.vim symbol navigation
     {'tweekmonster/startuptime.vim', cmd = 'StartupTime'},
    -- fuzzy file finder
     {'Yggdroot/LeaderF', run = ':LeaderfInstallCExtension'},
     {'linjiX/LeaderF-git'},

    -- change surrounding symbol
     {'machakann/vim-sandwich'},

    -- char search
     {'kevinhwang91/nvim-hlslens'},
     {'mg979/vim-visual-multi'},
     {'haya14busa/vim-asterisk'},

    -- file-tree
    -- {'nvim-neo-tree/neo-tree.nvim', branch='v2.x'}
     {'MunifTanjim/nui.nvim'},

    --git
     {'tpope/vim-fugitive',config=conf('fugitive')},
     {'rbong/vim-flog',cmd={'Flog','Flogsplit'}},
    -- {'TimUntersberger/neogit'}
     {'kdheepak/lazygit.nvim'},
    -- {'lewis6991/gitsigns.nvim'}

    --quickfix
     {'kevinhwang91/nvim-bqf'},
     {'junegunn/fzf', run = function()vim.fn['fzf#install']()end},
     {'junegunn/fzf.vim', run = function()vim.fn['fzf#install']()end},
     {'mhinz/vim-grepper', run = function()vim.fn['fzf#install']()end},

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
    -- {'Yggdroot/indentLine'}

     {'skywind3000/vim-quickui'},
     { 'skywind3000/vim-quickui-navigator' },

    -- copy between local & remote
     {'ojroques/vim-oscyank'},

     {'rcarriga/nvim-notify'}
	--end
})
