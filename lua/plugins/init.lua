-- 插件管理入口 - lazy.nvim 设置
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
vim.opt.rtp:prepend(lazypath)

local lazy = require('lazy')

lazy.setup({
  -- 从各个分类模块导入插件
  { import = 'plugins.editor' },
  { import = 'plugins.ui' },
  { import = 'plugins.git' },
  { import = 'plugins.search' },
  { import = 'plugins.navigation' },
  { import = 'plugins.tools' },
  { import = 'plugins.completion' },
})

