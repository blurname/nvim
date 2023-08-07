local function source_vim_files(directory)
  local files = vim.fn.readdir(directory)
  if not files then
    return
  end

  for _, file in ipairs(files) do
    local path = directory .. '/' .. file
    local filetype = vim.fn.fnamemodify(path, ':e')
    if filetype == 'vim' then
      vim.cmd('source ' .. path)
    elseif vim.fn.isdirectory(path) == 1 then
      source_vim_files(path)
    end
  end
end

local VIM_CONFI = '/home/bl/.config/nvim/vim'
source_vim_files(VIM_CONFI)
