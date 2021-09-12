-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/bl/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/bl/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/bl/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/bl/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/bl/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["AutoSave.nvim"] = {
    loaded = true,
    path = "/home/bl/.local/share/nvim/site/pack/packer/start/AutoSave.nvim"
  },
  LeaderF = {
    loaded = true,
    path = "/home/bl/.local/share/nvim/site/pack/packer/start/LeaderF"
  },
  ["asyncrun.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/bl/.local/share/nvim/site/pack/packer/opt/asyncrun.vim"
  },
  ["asynctasks.vim"] = {
    config = { "require('config').asynctask()" },
    keys = { { "", "<F5>" }, { "", "<F6>" }, { "", "<F7>" }, { "", "<F8>" } },
    loaded = false,
    needs_bufread = false,
    path = "/home/bl/.local/share/nvim/site/pack/packer/opt/asynctasks.vim",
    wants = { "asyncrun.vim" }
  },
  ["clever-f.vim"] = {
    config = { "require('config').nil()" },
    keys = { { "", "f" }, { "", "F" }, { "", "t" }, { "", "T" } },
    loaded = false,
    needs_bufread = false,
    path = "/home/bl/.local/share/nvim/site/pack/packer/opt/clever-f.vim"
  },
  ["coc.nvim"] = {
    loaded = true,
    path = "/home/bl/.local/share/nvim/site/pack/packer/start/coc.nvim"
  },
  delimitMate = {
    loaded = false,
    needs_bufread = false,
    path = "/home/bl/.local/share/nvim/site/pack/packer/opt/delimitMate"
  },
  edge = {
    loaded = true,
    path = "/home/bl/.local/share/nvim/site/pack/packer/start/edge"
  },
  everforest = {
    loaded = true,
    path = "/home/bl/.local/share/nvim/site/pack/packer/start/everforest"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\1\2&\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\vmyline\frequire\0" },
    loaded = true,
    path = "/home/bl/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  nerdcommenter = {
    keys = { { "", "<Plug>NERDCommenterToggle" } },
    loaded = false,
    needs_bufread = false,
    path = "/home/bl/.local/share/nvim/site/pack/packer/opt/nerdcommenter"
  },
  ["nvim-bqf"] = {
    loaded = true,
    path = "/home/bl/.local/share/nvim/site/pack/packer/start/nvim-bqf"
  },
  ["nvim-hlslens"] = {
    loaded = true,
    path = "/home/bl/.local/share/nvim/site/pack/packer/start/nvim-hlslens"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/bl/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/bl/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/bl/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  rnvimr = {
    loaded = true,
    path = "/home/bl/.local/share/nvim/site/pack/packer/start/rnvimr"
  },
  ["startuptime.vim"] = {
    commands = { "StartupTime" },
    loaded = false,
    needs_bufread = false,
    path = "/home/bl/.local/share/nvim/site/pack/packer/opt/startuptime.vim"
  },
  ["suda.vim"] = {
    config = { "require('config').nil()" },
    keys = { { "", "n" }, { "", "<leader>W" } },
    loaded = false,
    needs_bufread = false,
    path = "/home/bl/.local/share/nvim/site/pack/packer/opt/suda.vim"
  },
  ["vim-asterisk"] = {
    loaded = true,
    path = "/home/bl/.local/share/nvim/site/pack/packer/start/vim-asterisk"
  },
  ["vim-flog"] = {
    commands = { "Flog", "Flogsplit" },
    loaded = false,
    needs_bufread = true,
    path = "/home/bl/.local/share/nvim/site/pack/packer/opt/vim-flog"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/bl/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-sandwich"] = {
    loaded = true,
    path = "/home/bl/.local/share/nvim/site/pack/packer/start/vim-sandwich"
  },
  ["vim-terminal-help"] = {
    loaded = true,
    path = "/home/bl/.local/share/nvim/site/pack/packer/start/vim-terminal-help"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/home/bl/.local/share/nvim/site/pack/packer/start/vim-visual-multi"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: galaxyline.nvim
time([[Config for galaxyline.nvim]], true)
try_loadstring("\27LJ\1\2&\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\vmyline\frequire\0", "config", "galaxyline.nvim")
time([[Config for galaxyline.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Flogsplit lua require("packer.load")({'vim-flog'}, { cmd = "Flogsplit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file StartupTime lua require("packer.load")({'startuptime.vim'}, { cmd = "StartupTime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Flog lua require("packer.load")({'vim-flog'}, { cmd = "Flog", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> <Plug>NERDCommenterToggle <cmd>lua require("packer.load")({'nerdcommenter'}, { keys = "<lt>Plug>NERDCommenterToggle", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>W <cmd>lua require("packer.load")({'suda.vim'}, { keys = "<lt>leader>W", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> f <cmd>lua require("packer.load")({'clever-f.vim'}, { keys = "f", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> T <cmd>lua require("packer.load")({'clever-f.vim'}, { keys = "T", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> t <cmd>lua require("packer.load")({'clever-f.vim'}, { keys = "t", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> F <cmd>lua require("packer.load")({'clever-f.vim'}, { keys = "F", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <F5> <cmd>lua require("packer.load")({'asynctasks.vim'}, { keys = "<lt>F5>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <F8> <cmd>lua require("packer.load")({'asynctasks.vim'}, { keys = "<lt>F8>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <F7> <cmd>lua require("packer.load")({'asynctasks.vim'}, { keys = "<lt>F7>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> n <cmd>lua require("packer.load")({'suda.vim'}, { keys = "n", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <F6> <cmd>lua require("packer.load")({'asynctasks.vim'}, { keys = "<lt>F6>", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'delimitMate'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
