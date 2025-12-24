-- 自动命令
local api = vim.api

-- 切换上一个 tab
vim.g.last_tab = vim.fn.tabpagenr()
api.nvim_create_autocmd('TabLeave', {
  pattern = '*',
  callback = function()
    vim.g.last_tab = vim.fn.tabpagenr()
  end,
})

vim.keymap.set('n', '<leader><tab>', function()
  vim.cmd('execute "tabnext " . g:last_tab')
end, { silent = true })

-- 自动重新加载文件
vim.opt.autoread = true
api.nvim_create_autocmd({ 'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI' }, {
  pattern = '*',
  callback = function()
    if vim.fn.mode() ~= 'c' then
      vim.cmd('checktime')
    end
  end,
})

api.nvim_create_autocmd('FileChangedShellPost', {
  pattern = '*',
  callback = function()
    vim.cmd('echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None')
  end,
})

-- OSCYank - y 复制到剪切板
api.nvim_create_autocmd('TextYankPost', {
  pattern = '*',
  callback = function()
    if vim.v.event.operator == 'y' then
      vim.cmd('OSCYankRegister ""')
    end
  end,
})

-- 查看 server log 专用配置 - 每 1000 毫秒刷新当前 log 文件
api.nvim_create_autocmd('BufEnter', {
  pattern = '*.log',
  callback = function(args)
    local ok, timer_id = pcall(api.nvim_buf_get_var, args.buf, 'log_timer')
    if ok and timer_id then
      vim.fn.timer_stop(timer_id)
    end

    local new_timer = vim.fn.timer_start(1000, function()
      if vim.fn.filereadable(vim.fn.expand('%')) == 1 and not vim.bo.modified then
        vim.cmd('checktime')
      end
    end, { ['repeat'] = -1 })

    api.nvim_buf_set_var(args.buf, 'log_timer', new_timer)
  end,
})

api.nvim_create_autocmd('BufLeave', {
  pattern = '*.log',
  callback = function(args)
    local ok, timer_id = pcall(api.nvim_buf_get_var, args.buf, 'log_timer')
    if ok and timer_id then
      vim.fn.timer_stop(timer_id)
      api.nvim_buf_del_var(args.buf, 'log_timer')
    end
  end,
})

