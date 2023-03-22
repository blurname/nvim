local nightfox = require('nightfox')

-- This function set the configuration of nightfox. If a value is not passed in the setup function
-- it will be taken from the default configuration above
nightfox.setup({
  options = {
  styles = {
    --comments = "italic", -- change style of comments to be italic
		keywords = "bold", -- change style of keywords to be bold
		functions = "italic,bold", -- styles can be a comma separated list
  },
  --transparent = true,
  --dim_inactive = true,
  }
})

-- Load the configuration set above and apply the colorscheme
--vim.cmd("colorscheme nordfox")
--vim.cmd("colorscheme nightfox")
