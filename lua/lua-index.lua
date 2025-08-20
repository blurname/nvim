---- mine

---- plugin
-- raw
-- require('fFHighlight').setup()
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

require('lazy-a')

require('hlslens').setup()
require('config')

-- config patch
require('config.treesitter')
require('config.nightfox')
require('config.gitsigns')
require('config.session-manager')
require('config.ufo')
require('config.bqf')
require('config.ufo')
require('config.comment')
require("harpoon").setup({
    menu = {
        width = 120,
    }
})
require('nvim-highlight-colors').setup{}
require('m-tabline')
require('a-diffview')
require('m-flash')
require('toggleterm-m')
require('config.nvim-tree')
require('grug-far').setup({
   -- engine = 'ripgrep' is default, but 'astgrep' can be specified...
   debounceMs = 500,
   wrap = false,
   normalModeSearch = true,
   prefills = {
     search = '',
     replacement = '',
     filesFilter = '',
     flags = '-i -F',
     paths = '',
   }
});
vim.keymap.set('n', '<leader>i', '<cmd>lua require("grug-far").toggle_instance({instanceName = "gf"})<CR>' )
vim.keymap.set('x', '<leader>i', '<cmd>lua require("grug-far").with_visual_selection({ prefills = { paths = vim.fn.expand("%") } })<CR>' )
require('fzf')
-- require('config.autosave')
require('vmlens')
