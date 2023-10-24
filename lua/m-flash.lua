require("flash").setup({
    -- forward = false,
    -- when `false`, find only matches in the given direction
    -- wrap = false,
  modes = {
    search = {
      enabled = false
    },
    char = {
      keys = { "f", "F", ";", "," },
      label = { exclude = "hljkiardcxpyv" },
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

