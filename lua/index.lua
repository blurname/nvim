---- mine

---- plugin
-- raw
require('fFHighlight').setup()
require('hlslens').setup()
-- require('keymap')
require('config')

-- config patch
require('config.treesitter')
require('config.nightfox')
--require('config.gitsigns')
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
-- require("flash").setup()
require('nvim-highlight-colors').setup{}
require('m-tabline')
require('a-spectre')
require('a-telescope')