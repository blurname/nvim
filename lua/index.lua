---- mine

---- plugin
-- raw
-- require('fFHighlight').setup()
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
require("flash").setup({
  modes = {
    search = {
      enabled = false
    },
    char = {
      keys = { "f", "F", ";", "," },
      jump_labels = true,
      char_actions = function(motion)
        return {
          [";"] = "next", -- set to `right` to always go right
          [","] = "prev", -- set to `left` to always go left
        }
      end
    },
  }
})
require('nvim-highlight-colors').setup{}
require('m-tabline')
require('a-spectre')
require('a-telescope')
require('a-diffview')
