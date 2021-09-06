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
  ["LeaderF-snippet"] = {
    loaded = true,
    path = "/home/bl/.local/share/nvim/site/pack/packer/start/LeaderF-snippet"
  },
  ["asyncrun.vim"] = {
    loaded = true,
    path = "/home/bl/.local/share/nvim/site/pack/packer/start/asyncrun.vim"
  },
  ["asynctasks.vim"] = {
    loaded = true,
    path = "/home/bl/.local/share/nvim/site/pack/packer/start/asynctasks.vim"
  },
  ["clever-f.vim"] = {
    loaded = true,
    path = "/home/bl/.local/share/nvim/site/pack/packer/start/clever-f.vim"
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
  ["far.vim"] = {
    loaded = true,
    path = "/home/bl/.local/share/nvim/site/pack/packer/start/far.vim"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\1\2'\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\feviline\frequire\0" },
    loaded = true,
    path = "/home/bl/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["neoscroll.nvim"] = {
    loaded = true,
    path = "/home/bl/.local/share/nvim/site/pack/packer/start/neoscroll.nvim"
  },
  ["neovim-gui-shim"] = {
    loaded = true,
    path = "/home/bl/.local/share/nvim/site/pack/packer/start/neovim-gui-shim"
  },
  ["nvim-bqf"] = {
    loaded = true,
    path = "/home/bl/.local/share/nvim/site/pack/packer/start/nvim-bqf"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/bl/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
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
  ["onedark.vim"] = {
    loaded = true,
    path = "/home/bl/.local/share/nvim/site/pack/packer/start/onedark.vim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/bl/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  rnvimr = {
    loaded = true,
    path = "/home/bl/.local/share/nvim/site/pack/packer/start/rnvimr"
  },
  tcomment_vim = {
    loaded = true,
    path = "/home/bl/.local/share/nvim/site/pack/packer/start/tcomment_vim"
  },
  ultisnips = {
    loaded = true,
    path = "/home/bl/.local/share/nvim/site/pack/packer/start/ultisnips"
  },
  ["vim-deus"] = {
    loaded = true,
    path = "/home/bl/.local/share/nvim/site/pack/packer/start/vim-deus"
  },
  ["vim-flog"] = {
    loaded = true,
    path = "/home/bl/.local/share/nvim/site/pack/packer/start/vim-flog"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/bl/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-sandwich"] = {
    loaded = true,
    path = "/home/bl/.local/share/nvim/site/pack/packer/start/vim-sandwich"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/home/bl/.local/share/nvim/site/pack/packer/start/vim-snippets"
  },
  ["vim-terminal-help"] = {
    loaded = true,
    path = "/home/bl/.local/share/nvim/site/pack/packer/start/vim-terminal-help"
  },
  ["vista.vim"] = {
    loaded = true,
    path = "/home/bl/.local/share/nvim/site/pack/packer/start/vista.vim"
  },
  ["wildfire.vim"] = {
    loaded = true,
    path = "/home/bl/.local/share/nvim/site/pack/packer/start/wildfire.vim"
  },
  ["zephyr-nvim"] = {
    loaded = true,
    path = "/home/bl/.local/share/nvim/site/pack/packer/start/zephyr-nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: galaxyline.nvim
time([[Config for galaxyline.nvim]], true)
try_loadstring("\27LJ\1\2'\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\feviline\frequire\0", "config", "galaxyline.nvim")
time([[Config for galaxyline.nvim]], false)
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
