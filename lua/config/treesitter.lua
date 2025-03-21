--local treesitter = require('nvim-treesitter.config')

require'nvim-treesitter.configs'.setup {
	ensure_installed = {"nix","lua","elvish","kdl",'tsx','typescript' }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	highlight = {
		enable = true,              -- false will disable the whole extension
		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		additional_vim_regex_highlighting = false,
	},
  -- context_commentstring = {
  --   enable = true,
  --   enable_autocmd = false,
  -- },
}
vim.g.skip_ts_context_commentstring_module = true
require('ts_context_commentstring').setup{
  enable_autocmd = false
}
