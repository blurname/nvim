local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp = require'cmp'
local luasnip = require("luasnip")
cmp.setup({
  snippet = {
    expand = function(args)
			  require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
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
