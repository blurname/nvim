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

time("Luarocks path setup", true)
local package_path_str = "C:\\Users\\naugh\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?.lua;C:\\Users\\naugh\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?\\init.lua;C:\\Users\\naugh\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?.lua;C:\\Users\\naugh\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?\\init.lua"
local install_cpath_pattern = "C:\\Users\\naugh\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\lua\\5.1\\?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time("Luarocks path setup", false)
time("try_loadstring definition", true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

time("try_loadstring definition", false)
time("Defining packer_plugins", true)
_G.packer_plugins = {
  LeaderF = {
    loaded = true,
    path = "C:\\Users\\naugh\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\LeaderF"
  },
  ["LeaderF-snippet"] = {
    loaded = true,
    path = "C:\\Users\\naugh\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\LeaderF-snippet"
  },
  ["asyncrun.vim"] = {
    loaded = true,
    path = "C:\\Users\\naugh\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\asyncrun.vim"
  },
  ["asynctasks.vim"] = {
    loaded = true,
    path = "C:\\Users\\naugh\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\asynctasks.vim"
  },
  ["auto-pairs"] = {
    loaded = true,
    path = "C:\\Users\\naugh\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\auto-pairs"
  },
  ["coc.nvim"] = {
    loaded = true,
    path = "C:\\Users\\naugh\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\coc.nvim"
  },
  edge = {
    loaded = true,
    path = "C:\\Users\\naugh\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\edge"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\2\n&\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\vmyline\frequire\0" },
    loaded = true,
    path = "C:\\Users\\naugh\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\galaxyline.nvim"
  },
  ["neovim-gui-shim"] = {
    loaded = true,
    path = "C:\\Users\\naugh\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\neovim-gui-shim"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "C:\\Users\\naugh\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-colorizer.lua"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "C:\\Users\\naugh\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "C:\\Users\\naugh\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\packer.nvim"
  },
  tcomment_vim = {
    loaded = true,
    path = "C:\\Users\\naugh\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\tcomment_vim"
  },
  ultisnips = {
    loaded = true,
    path = "C:\\Users\\naugh\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\ultisnips"
  },
  ["vim-deus"] = {
    loaded = true,
    path = "C:\\Users\\naugh\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-deus"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "C:\\Users\\naugh\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-surround"
  },
  ["vim-terminal-help"] = {
    loaded = true,
    path = "C:\\Users\\naugh\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-terminal-help"
  },
  ["wildfire.vim"] = {
    loaded = true,
    path = "C:\\Users\\naugh\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\wildfire.vim"
  },
  ["zephyr-nvim"] = {
    loaded = true,
    path = "C:\\Users\\naugh\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\zephyr-nvim"
  }
}

time("Defining packer_plugins", false)
-- Config for: galaxyline.nvim
time("Config for galaxyline.nvim", true)
try_loadstring("\27LJ\2\n&\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\vmyline\frequire\0", "config", "galaxyline.nvim")
time("Config for galaxyline.nvim", false)
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
