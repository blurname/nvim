local nightfox = require('nightfox')

-- This function set the configuration of nightfox. If a value is not passed in the setup function
-- it will be taken from the default configuration above

local palettes = {
  -- Everything defined under `all` will be applied to each style.
  dayfox = {
    comment = "#837a72",
    bg0     = "#e4dcd4", -- Dark bg (status line and float)
    bg1     = "#EFF0F2", -- Default bg
    bg2     = "#dbd1dd", -- Lighter bg (colorcolm folds)
    bg3     = "#d3c7bb", -- Lighter bg (cursor line)
    bg4     = "#aab0ad", -- Conceal, border fg

    fg0     = "#302b5d", -- Lighter fg
    fg1     = "#3d2b5a", -- Default fg
    fg2     = "#643f61", -- Darker fg (status line)
    fg3     = "#824d5b", -- Darker fg (line numbers, fold colums)

    sel0    = "#e7d2be", -- Popup bg, visual selection bg
    sel1    = "#a4c1c2", -- Popup sel bg, search bg

  },
}
nightfox.setup({
  options = {
  styles = {
    -- comments = "italic", -- change style of comments to be italic
		keywords = "bold", -- change style of keywords to be bold
		functions = "italic,bold", -- styles can be a comma separated list
  },
  --transparent = true,
  --dim_inactive = true,
  },
  palettes = palettes,
})
-- vim.cmd("colorscheme nightfox")

-- Load the configuration set above and apply the colorscheme
-- vim.cmd("colorscheme dayfox")
-- vim.cmd("colorscheme nordfox")
-- vim.cmd("colorscheme nightfox")
