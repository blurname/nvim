require('tiny-inline-diagnostic').setup({
  preset = "minimal",
  -- preset = "classic",
  signs = {
        left = "",       -- Left border character
        right = "",      -- Right border character
        diag = "",       -- Diagnostic indicator character
        arrow = "    ",   -- Arrow pointing to diagnostic
        up_arrow = "    ", -- Upward arrow for multiline
        vertical = " │",   -- Vertical line for multiline
        vertical_end = " └", -- End of vertical line for multiline
    },
  -- transparent_cursorline = false,
  -- hi = {
  --   background = "#171717",
  -- }
})
