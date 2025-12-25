-- 编辑器增强插件
return {
  -- 自动配对
  { 'Raimondi/delimitMate', event = 'InsertEnter', lazy = true },

  -- Treesitter
  {
    'kevinhwang91/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { 'nix', 'lua', 'elvish', 'kdl', 'tsx', 'typescript' },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      })
      vim.g.skip_ts_context_commentstring_module = true
      require('ts_context_commentstring').setup({
        enable_autocmd = false,
      })
    end,
  },

  -- 注释
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup({
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      })

      -- Comment.nvim 跨平台快捷键 (使用原来的 VimScript 风格映射)
      -- if vim.fn.has('win32') == 1 then
        vim.cmd([[
          vnoremap <c-_> <Plug>(comment_toggle_linewise_visual)
          nnoremap <c-_> <Plug>(comment_toggle_linewise_current)
        ]])
      -- else
        vim.cmd([[
          vnoremap <c-/> <Plug>(comment_toggle_linewise_visual)
          nnoremap <c-/> <Plug>(comment_toggle_linewise_current)
        ]])
      -- end
    end,
  },
  { 'JoosepAlviste/nvim-ts-context-commentstring' },

  -- 改变包围符号
  { 'machakann/vim-sandwich' },

  -- Flash 跳转
  {
    'folke/flash.nvim',
    config = function()
      require('flash').setup({
        modes = {
          search = {
            enabled = false,
          },
          char = {
            keys = { 'f', 'F', ';', ',' },
            label = { exclude = 'hljkiardcxpyv' },
            jump_labels = true,
            char_actions = function(motion)
              return {
                [';'] = 'prev',
                [','] = 'next',
              }
            end,
          },
        },
      })
    end,
  },

  -- 折叠
  {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    config = function()
      vim.o.fillchars = [[eob: ,fold: ,foldopen:▾,foldsep: ,foldclose:▸]]
      require('ufo').setup()
    end,
  },

  -- 多光标
  { 'mg979/vim-visual-multi' },

  -- Auto tag
  { 'windwp/nvim-ts-autotag' },

  -- Moonbit 支持
  {
    'moonbit-community/moonbit.nvim',
    ft = { 'moonbit' },
    opts = {
      mooncakes = {
        virtual_text = true,
        use_local = true,
      },
      treesitter = {
        enabled = true,
        auto_install = true,
      },
      lsp = {
        on_attach = function(client, bufnr) end,
        capabilities = vim.lsp.protocol.make_client_capabilities(),
      },
    },
  },

  -- 内联诊断
  {
    'rachartier/tiny-inline-diagnostic.nvim',
    event = 'VeryLazy',
    priority = 1000,
  },
}

