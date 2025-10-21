---- mine

---- plugin
-- raw
-- require('fFHighlight').setup()
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

require('lazy-a')

require('hlslens').setup()
require('config')

-- config patch
require('config.treesitter')
require('config.nightfox')
-- require('arctic')
-- require('vercel-light')
require('config.gitsigns')
require('config.session-manager')
require('config.bqf')
require('config.ufo')
require('config.comment')
require('config.neotree')
require("harpoon").setup({
    menu = {
        width = 120,
    }
})
require('nvim-highlight-colors').setup{}
require('m-tabline')
require('a-diffview')
require('m-flash')
require('toggleterm-m')
-- require('config.nvim-tree')
require('grug-far').setup({
   -- engine = 'ripgrep' is default, but 'astgrep' can be specified...
   debounceMs = 500,
   wrap = false,
   normalModeSearch = true,
   prefills = {
     search = '',
     replacement = '',
     filesFilter = '!public/',
     flags = '-i -F',
     paths = '',
   },
   keymaps = {
      gotoLocation = { n = 'o' },
      openLocation = { n = '<enter>' },
   }
});
vim.keymap.set('n', '<leader>i', '<cmd>lua require("grug-far").toggle_instance({instanceName = "gf"})<CR>' )
vim.keymap.set('x', '<leader>i', '<cmd>lua require("grug-far").with_visual_selection({ prefills = { paths = vim.fn.expand("%") } })<CR>' )
require('fzf')
-- require('config.autosave')
require('vmlens')
-- require('lspConfig')
-- require('blinkConfig')
-- require('lint')
-- require('nvim-eslint').setup({})
--   on_attach = function(client, bufnr)
--   client.server_capabilities.documentFormattingProvider = true
--
--   local format = function()
--     vim.lsp.buf.format({ timeout_ms = 2000 })
--   end
--   vim.keymap.set('n', 'ff', format, { silent = true, buffer = bufnr, desc = 'eslint fix' })
-- end,
-- })
-- require('lspUI-config')
-- require('nvim-ts-autotag').setup({
--   opts = {
--     -- Defaults
--     enable_close = true, -- Auto close tags
--     enable_rename = true, -- Auto rename pairs of tags
--     enable_close_on_slash = false -- Auto close on trailing </
--   },
--   -- Also override individual filetype configs, these take priority.
--   -- Empty by default, useful if one of the "opts" global settings
--   -- doesn't work well in a specific filetype
--   per_filetype = {
--     ["html"] = {
--       enable_close = false
--     }
--   }
-- })
-- require('diagnostic')

-- 查看 server log 专用配置
-- 每 1000 毫秒（1秒）刷新当前 log 文件
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.log",
  callback = function(args)
    -- 安全检查并停止已有定时器（避免重复创建）
    local timer_id, err = pcall(vim.api.nvim_buf_get_var, args.buf, "log_timer")
    if not err and timer_id then  -- 若变量存在且有效
      vim.fn.timer_stop(timer_id)
    end

    -- 创建新定时器
    local new_timer = vim.fn.timer_start(1000, function()
      if vim.fn.filereadable(vim.fn.expand("%")) == 1 and not vim.bo.modified then
        vim.cmd("checktime")
      end
    end, { ["repeat"] = -1 })

    -- 保存定时器 ID 到缓冲区变量
    vim.api.nvim_buf_set_var(args.buf, "log_timer", new_timer)
  end
})

-- 离开缓冲区时停止定时器
vim.api.nvim_create_autocmd("BufLeave", {
  pattern = "*.log",
  callback = function(args)
    -- 同样先检查变量是否存在
    local timer_id, err = pcall(vim.api.nvim_buf_get_var, args.buf, "log_timer")
    if not err and timer_id then
      vim.fn.timer_stop(timer_id)
      vim.api.nvim_buf_del_var(args.buf, "log_timer")
    end
  end
})
