local k = vim.keymap
 local h = require'tabline.helpers'

function closeTabOrBuffer()
  if h.tabs_mode() then
    vim.cmd('q')
  elseif h.buffers_mode() then
    vim.cmd('bw')
  end
end

k.set('n','<c-w>',closeTabOrBuffer)


