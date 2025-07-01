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
-- require('arctic')
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
     filesFilter = '!public/',
     flags = '-i -F',
     paths = '',
   }
});
vim.keymap.set('n', '<F4>', '<cmd>lua require("grug-far").toggle_instance({instanceName = "gf"})<CR>' )
require('fzf')
-- require('config.autosave')
require('vmlens')
require('lspConfig')
require('blinkConfig')
-- require('lint')
require('nvim-eslint').setup({})
--   on_attach = function(client, bufnr)
--   client.server_capabilities.documentFormattingProvider = true
--
--   local format = function()
--     vim.lsp.buf.format({ timeout_ms = 2000 })
--   end
--   vim.keymap.set('n', 'ff', format, { silent = true, buffer = bufnr, desc = 'eslint fix' })
-- end,
-- })
require('lspUI-config')
require('nvim-ts-autotag').setup({
  opts = {
    -- Defaults
    enable_close = true, -- Auto close tags
    enable_rename = true, -- Auto rename pairs of tags
    enable_close_on_slash = false -- Auto close on trailing </
  },
  -- Also override individual filetype configs, these take priority.
  -- Empty by default, useful if one of the "opts" global settings
  -- doesn't work well in a specific filetype
  per_filetype = {
    ["html"] = {
      enable_close = false
    }
  }
})
