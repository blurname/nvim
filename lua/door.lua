---- mine
require('close')

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
require("harpoon").setup({
    menu = {
        width = 120,
    }
})
-- require("flash").setup()
require('Comment').setup {
  pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
}
require('nvim-highlight-colors').setup{}
require('m-tabline')
