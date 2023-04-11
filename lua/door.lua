-- raw
require('colorizer').setup()
require('fFHighlight').setup()
require('hlslens').setup()

-- config patch
--require('config.treesitter')
require('config.nightfox')
--require('config.gitsigns')
require('config')
require('config.session-manager')
require('config.ufo')
require('config.bqf')
require('config.ufo')
require("harpoon").setup({
    menu = {
        width = 120,
    }
})
--require('config.feline')
--require('stl')

