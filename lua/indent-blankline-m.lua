-- Highlight group from rainbow-delimiters
local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}local hooks = require "ibl.hooks"
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)
require("ibl").setup {
  indent = {
    highlight = highlight, 
    char = "▏", -- Thiner, not suitable when enable scope
    tab_char = "▏",
  },
  whitespace = {
    highlight = highlight,
    remove_blankline_trail = false,
  },
  -- scope = { enabled = false }
}
-- hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

---@type LazyPluginSpec
-- return {
  --   "lukas-reineke/indent-blankline.nvim",
  --   event = "VeryLazy",
  --   opts = {
    --     indent = {
      --       char = "▏", -- Thiner, not suitable when enable scope
      --       tab_char = "▏",
      --     },
      --     scope = {
        --       -- Rely on treesitter, bad performance
        --       enabled = false,
        --       -- highlight = highlight,
        --     },
        --   },
        --   config = function(_, opts)
          --     local ibl = require "ibl"
          --
          --     ibl.setup(opts)
          --   end,
          -- }
