require("nvim-tree").setup({
  disable_netrw = true,
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
    side = "right"
  },
  renderer = {
    indent_width = 1,
    icons = {
      web_devicons = {
        file = {
          enable = false,
          color = true,
        },
        folder = {
          enable = false,
          color = true,
        },
      },
      show = {
        file = false,
        folder = true,
        folder_arrow = false,
        git = true,
        modified = true,
        hidden = false,
        diagnostics = true,
        bookmarks = true,
      },
    },
  },
  filters = {
    dotfiles = true,
  },
})
