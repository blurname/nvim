local nightfox = require('nightfox')

-- This function set the configuration of nightfox. If a value is not passed in the setup function
-- it will be taken from the default configuration above
nightfox.setup({
  fox = "dayfox", -- change the colorscheme to use nordfox
	--transparent = true,
  styles = {
    comments = "italic", -- change style of comments to be italic
		keywords = "bold", -- change style of keywords to be bold
		functions = "italic,bold" -- styles can be a comma separated list
  },
  --inverse {
    --match_paren = true, -- inverse the highlighting of match_parens
  --},
  colors = {
    --red = "#FF0000", -- Override the red color for MAX POWER
		--bg_alt = "#c94f6d",
		--black ="#c94f6d",
		--black_dm ="#c94f6d",
		--black_br ="#c94f6d",
		--none = "#c94f6d",
  },
  hlgroups = {
    --TSPunctDelimiter = { fg = "${red}" }, -- Override a highlight group with the color red
    --LspCodeLens = { bg = "#000000", style = "italic" },
  }
})

-- Load the configuration set above and apply the colorscheme
nightfox.load()

