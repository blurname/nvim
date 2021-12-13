local cmp = require'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
			  require('luasnip').lsp_expand(args.body) 
    end,
  },
  mapping = {
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
    ['<Esc>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-k>'] = cmp.mapping.scroll_docs(-4),
    ['<C-j>'] = cmp.mapping.scroll_docs(4),
  },
  sources = {
    { name = 'nvim_lsp' }, -- For nvim-lsp
    { name = 'luasnip' }, -- For ultisnips user.
    { name = 'nvim_lua' }, -- for nvim lua function
    { name = 'path' }, -- for path completion
    { name = 'buffer', keyword_length = 4 }, -- for buffer word completion
    --{ name = 'emoji', insert = true, } -- emoji completion
  },
  completion = {
    keyword_length = 1,
    completeopt = "menu,noselect"
  },
  experimental = {
    ghost_text = false
  },
	--formatting = {
		--format = lspkind.cmp_format({
			--with_text = false,
			--menu = {
				--nvim_lsp = "[LSP]",
				--ultisnips = "[US]",
				--nvim_lua = "[Lua]",
				--path = "[Path]",
				--buffer = "[Buffer]",
				--emoji = "[Emoji]",
			--},
		--}),
	--},
})
