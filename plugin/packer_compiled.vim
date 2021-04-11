" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/home/b/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/b/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/b/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/b/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/b/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  LeaderF = {
    loaded = true,
    path = "/home/b/.local/share/nvim/site/pack/packer/start/LeaderF"
  },
  ["asyncrun.vim"] = {
    loaded = true,
    path = "/home/b/.local/share/nvim/site/pack/packer/start/asyncrun.vim"
  },
  ["asynctasks.vim"] = {
    loaded = true,
    path = "/home/b/.local/share/nvim/site/pack/packer/start/asynctasks.vim"
  },
  ["auto-pairs"] = {
    loaded = true,
    path = "/home/b/.local/share/nvim/site/pack/packer/start/auto-pairs"
  },
  ["coc.nvim"] = {
    loaded = true,
    path = "/home/b/.local/share/nvim/site/pack/packer/start/coc.nvim"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\1\2&\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\vmyline\frequire\0" },
    loaded = true,
    path = "/home/b/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/b/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/b/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/b/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  tcomment_vim = {
    loaded = true,
    path = "/home/b/.local/share/nvim/site/pack/packer/start/tcomment_vim"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/b/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-terminal-help"] = {
    loaded = true,
    path = "/home/b/.local/share/nvim/site/pack/packer/start/vim-terminal-help"
  },
  ["wildfire.vim"] = {
    loaded = true,
    path = "/home/b/.local/share/nvim/site/pack/packer/start/wildfire.vim"
  }
}

-- Config for: galaxyline.nvim
try_loadstring("\27LJ\1\2&\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\vmyline\frequire\0", "config", "galaxyline.nvim")
END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
