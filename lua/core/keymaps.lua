-- 通用按键映射
local keymap = vim.keymap.set

-- 禁用一些默认键
keymap('n', 'q:', '<nop>')
keymap('n', 'q', '<nop>')
keymap('n', 's', '<nop>')

-- 全选
keymap('n', '<c-a>', 'ggVG')

-- 清除搜索高亮
keymap('n', '<leader><CR>', ':nohlsearch<CR>')

-- 切换上一个 buffer
keymap('n', '<leader>3', '<Cmd>b #<CR>')

-- 窗口导航
keymap('n', '<A-h>', '<C-w>h')
keymap('n', '<A-l>', '<C-w>l')
keymap('n', '<A-i>', '<C-i>')
keymap('n', '<A-o>', '<C-o>')

-- 窗口大小调整
keymap('n', '<down>', ':res -5<CR>')
keymap('n', '<up>', ':res +5<CR>')
keymap('n', '<left>', ':vertical resize-5<CR>')
keymap('n', '<right>', ':vertical resize+5<CR>')

-- 移动当前窗口到新 tab
keymap('n', 'tn', '<C-w>T')

-- 分屏
keymap('n', 'sh', ':set nosplitright<CR>:vsplit<CR>:set splitright<CR>')
keymap('n', 'sl', ':set splitright<CR>:vsplit<CR>')

-- 保存
keymap('n', '<c-s>', ':wa<CR>')

-- 移动增强
keymap({ 'n', 'v' }, 'W', '5w')
keymap({ 'n', 'v' }, 'B', '5b')
keymap({ 'n', 'v' }, 'H', '^')
keymap({ 'n', 'v' }, 'L', 'g_')

-- 行上下移动
keymap('n', '<m-j>', ':m +1<CR>')
keymap('n', '<m-k>', ':m -2<CR>')

-- Tab 切换
keymap('n', '<m-1>', ':tabn 1<cr>', { silent = true })
keymap('n', '<m-2>', ':tabn 2<cr>', { silent = true })
keymap('n', '<m-3>', ':tabn 3<cr>', { silent = true })
keymap('n', '<m-4>', ':tabn 4<cr>', { silent = true })

-- 滚动控制
keymap('n', '<c-e>', '<c-u>')

-- 在前一个窗口滚动
local function tools_previous_cursor(mode)
  if vim.fn.winnr('$') <= 1 then
    return
  end
  vim.cmd('noautocmd silent! wincmd p')
  if mode == 6 then
    vim.cmd('normal! \\<c-u>')
  elseif mode == 7 then
    vim.cmd('normal! \\<c-d>')
  end
  vim.cmd('noautocmd silent! wincmd p')
end

keymap('n', '<M-e>', function() tools_previous_cursor(6) end, { silent = true })
keymap('n', '<M-d>', function() tools_previous_cursor(7) end, { silent = true })
keymap('i', '<M-e>', function() tools_previous_cursor(6) end, { silent = true })
keymap('i', '<M-d>', function() tools_previous_cursor(7) end, { silent = true })
keymap('n', '<M-up>', function() tools_previous_cursor(6) end, { silent = true })
keymap('n', '<M-down>', function() tools_previous_cursor(7) end, { silent = true })
keymap('i', '<M-up>', function() tools_previous_cursor(6) end, { silent = true })
keymap('i', '<M-down>', function() tools_previous_cursor(7) end, { silent = true })

-- 折叠快捷键
keymap({ 'n', 'v' }, 'z', 'za', { noremap = true, silent = true })

-- 获取文件路径和行号
local function get_file_path_line()
  local path_line = vim.fn.expand('%') .. ':' .. vim.fn.line('.')
  vim.fn.setreg('"', path_line)
  print(path_line)
  vim.cmd('silent OSCYankRegister ""')
end

local function get_file_path_relative()
  local path = vim.fn.expand('%:.')
  vim.fn.setreg('"', path)
  print(path)
  vim.cmd('silent OSCYankRegister ""')
end

local function get_file_path_absolute()
  local path = vim.fn.expand('%:p')
  vim.fn.setreg('"', path)
  print(path)
  vim.cmd('silent OSCYankRegister ""')
end

keymap('n', '<leader>\\', get_file_path_line)
vim.api.nvim_create_user_command('GetFilePathLineCommand', get_file_path_line, {})
vim.api.nvim_create_user_command('BlGetFilePathRelative', get_file_path_relative, {})
vim.api.nvim_create_user_command('BlGetFilePathLine', get_file_path_line, {})
vim.api.nvim_create_user_command('BlGetFilePathAbsolute', get_file_path_absolute, {})

-- 删除所有 buffer 除了当前
vim.api.nvim_create_user_command('Bda', 'silent! execute "%bd|e#|bd#"', {})

-- Quickfix 切换
local function toggle_quickfix()
  if vim.tbl_isempty(vim.fn.filter(vim.fn.getwininfo(), 'v:val.quickfix')) then
    vim.cmd('top copen')
  else
    vim.cmd('cclose')
  end
end

keymap('n', '<leader>q', toggle_quickfix, { silent = true })

-- Grepper 搜索
keymap('n', '<C-F>', ':Grepper -noprompt -tool rg -cword<CR><CR>')
keymap('n', 'q', '<plug>(GrepperOperator)', { nowait = true, silent = true })
keymap('x', 'q', '<plug>(GrepperOperator)', { nowait = true, silent = true })

-- 跳转到文件和行
local function jump_to_file_and_line(file_and_line)
  local parts = vim.split(file_and_line, ':')
  local file = parts[1]
  local line = parts[2]
  vim.cmd('e ' .. vim.fn.fnameescape(file))
  vim.cmd('normal! ' .. line .. 'G')
end

vim.api.nvim_create_user_command('JumpTo', function(opts)
  jump_to_file_and_line(opts.args)
end, { nargs = 1 })

-- 列出 console.log
vim.api.nvim_create_user_command('ListLog', 'GrepperRg blue]-', {})
vim.api.nvim_create_user_command('ListTodo', "GrepperRg 'TODO: bl'", {})

-- Console.log 包装函数
local function wrap_console_log(type)
  local word = ''
  local v_mode = vim.fn.visualmode()
  local begin_log_str = "console.log('🟦[blue]->"
  local log_line = ""

  if vim.bo.filetype == 'moonbit' then
    begin_log_str = 'println("🟦[blue]->'
  end

  if type == 'v' then
    if v_mode == 'v' then
      vim.cmd('normal! gvy')
      word = vim.fn.getreg('@')
    end
  elseif type == 'n' then
    word = vim.fn.expand('<cword>')
    print(word)
  end

  if word ~= '' then
    if vim.bo.filetype == 'moonbit' then
      log_line = begin_log_str .. word .. ': \\{' .. word .. '}")'
    else
      log_line = begin_log_str .. word .. ": ', " .. word .. ')'
    end
    vim.cmd('normal! o' .. log_line)
  end
end

keymap('n', '<leader>o', function() wrap_console_log('n') end)
keymap('x', '<leader>o', function() wrap_console_log('v') end)

-- Npm run 函数
local function npm_run_async()
  local line = vim.fn.getline('.')
  local start_quote = string.find(line, '"')
  if not start_quote then
    print('No command found within double quotes on the current line.')
    return
  end
  local end_quote = string.find(line, '"', start_quote + 1)
  if start_quote and end_quote and start_quote < end_quote then
    local command = 'npm run ' .. string.sub(line, start_quote + 1, end_quote - 1)
    vim.cmd('AsyncRun -mode=term -cwd=$(VIM_FILEDIR) ' .. command)
  else
    print('No command found within double quotes on the current line.')
  end
end

keymap('n', '<F9>', npm_run_async)

-- Terminal below 命令
vim.api.nvim_create_user_command('TerminalBelow', function(opts)
  vim.cmd('split | wincmd J | terminal ' .. opts.args)
end, { nargs = 1 })

