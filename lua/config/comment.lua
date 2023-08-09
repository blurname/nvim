local api = require('Comment.api')
local k = vim.keymap
-- Comment.nvim

require('Comment').setup {
  pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
}
-- map <c-_> instead of <c-/>
-- k.set('v','<c-_>', function () api.locked("toggle.linewise")(vim.fn.visualmode()) end)
-- k.set('n','<c-_>',api.toggle.linewise.current)
