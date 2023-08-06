  local tabline = require'tabline.setup'

  -- only use your own mappings
  local settings = {
    default_mappings = false, 
    theme = 'apprentice',
    label_style = 'order',
    modes = {'tabs','buffers'},
    mode_badge = { tabs = 'T', buffers = 'B', args = 'A', auto = '' },
    tabs_badge = false,
    show_button = true,
    overflow_arrows = true
  }

  -- local L = '<leader><leader>'

  local mappings = {
    ['mode next'] =   'T',   -- change tabline mode
    -- ['next'] =        '<c-l>',     -- select next buffer/tab
    -- ['prev'] =        '<c-h>',     -- select previous buffer/tab
    -- ['tabname'] =     'tN',     -- give a custom label to the current tab
    -- ['away'] =        L .. 'a', -- move current buffer away from sight (put last)
    -- ['filtering!'] =  L .. 'f', -- toggle buffer filtering based on cwd
    -- ['fullpath!'] =   L .. '/', -- toggle showing the paths/basenames
    -- ['pin!'] =        L .. 'p', -- toggle pin buffer
    -- ['reopen'] =      L .. 'u', -- reopen closed tab
    -- ['purge'] =       L .. 'x', -- close anything in the tabpage that isn't a regular buffer
    -- ['cleanup'] =     L .. 'X', -- delete all buffers that are unrelated to current directories
  }
  tabline.setup(settings)
  tabline.mappings(mappings)
