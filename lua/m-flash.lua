require("flash").setup({
  -- forward = false,
  -- when `false`, find only matches in the given direction
  -- wrap = false,
  modes = {
    search = {
      enabled = false,
      before = true
    },
    char = {
      keys = { "f", ";", "," },
      label = { exclude = "hljkiardcxpyv" },
      jump_labels = true,
      char_actions = function(motion)
        return {
          [";"] = "prev", -- set to `right` to always go right
          [","] = "next", -- set to `left` to always go left
        }
      end,
      search = {wrap = true}
    },
  }
})

