local tabline = require'tabline.setup'
local h = require'tabline.helpers'
local k = vim.keymap

vim.o.showtabline = 2

-- only use your own mappings
local settings = {
  default_mappings = false,
  theme = 'apprentice',
  label_style = 'order',
  modes = {'tabs','buffers'},
  mode_badge = { tabs = 'Tab', buffers = 'Buf', args = 'A', auto = '' },
  tabs_badge = false,
  show_button = true,
  overflow_arrows = true
}

-- local L = '<leader><leader>'

local mappings = {
  ['mode next'] =   'tt',   -- change tabline mode
}
tabline.setup(settings)
tabline.mappings(mappings)


function close_tab_or_buffer()
  if h.tabs_mode() then
    vim.cmd('q')
  elseif h.buffers_mode() then
    close_buffer()
  end
end

function close_buffer()
  -- 获取当前 buffer 列表
  local buffers = vim.api.nvim_list_bufs()
  local windows = vim.api.nvim_tabpage_list_wins(0)
  -- 计算实际的 buffer 数量
  local buffer_count = #buffers
  local window_count = #windows

  -- 如果只有一个 buffer，则不执行关闭操作
  if buffer_count <= 1 then
    print("---无法关闭最后一个 buffer")
    return
  end

  -- 先看 window 数量，防止同一个 buffer 开多个 window 的情况下，全被删了
  if window_count >1 then
    vim.cmd('q')
    return
  end

  -- 关闭当前 buffer
  vim.cmd('bwipeout')

end

k.set('n','<c-w>',close_tab_or_buffer)
k.set('n','<c-h>',':Tabline prev 1<CR>')
k.set('n','<c-l>',':Tabline next 1<CR>')
