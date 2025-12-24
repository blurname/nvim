-- UI 相关插件
return {
  -- 主题
  {
    'EdenEast/nightfox.nvim',
    config = function()
      require('nightfox').setup({
        options = {
          styles = {
            keywords = 'bold',
            functions = 'bold',
          },
        },
      })
      vim.cmd('colorscheme nordfox')
    end,
  },

  -- 颜色显示
  { 'norcalli/nvim-colorizer.lua' },
  { 'brenoprata10/nvim-highlight-colors', config = true },

  -- 图标
  { 'kyazdani42/nvim-web-devicons' },

  -- Tabline 配置
  {
    'blurname/tabline-config',
    name = 'tabline-config',
    virtual = true,
    config = function()
      vim.o.showtabline = 2

      local function close_tab_or_buffer()
        if string.find(vim.fn.bufname(0), 'diffview://') then
          print('In diffview tabpage, using DiffviewClose to close')
        else
          vim.cmd('q')
        end
      end

      vim.keymap.set('n', '<c-w>', close_tab_or_buffer, { nowait = true })
      vim.keymap.set('n', '<c-l>', ':tabnext<CR>')
      vim.keymap.set('n', '<c-h>', ':tabprevious<CR>')
    end,
  },

  -- Outline
  {
    'hedyhli/outline.nvim',
    config = function()
      vim.keymap.set('n', '<leader>s', '<cmd>Outline<CR>', { desc = 'Toggle Outline' })
      require('outline').setup({})
    end,
  },

  -- 启动时间测量
  { 'tweekmonster/startuptime.vim', cmd = 'StartupTime' },
}

