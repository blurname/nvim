local colors = {
    bg = '#3b4252',
    fg = '#abb2bf',
    yellow = '#e0af68',
    cyan = '#56b6c2',
    darkblue = '#5e81ac',
    green = '#98c379',
    orange = '#d19a66',
    violet = '#a9a1e1',
    magenta = '#c678dd',
    blue = '#61afef',
    red = '#e86671'
}

local vi_mode_colors = {
    NORMAL = colors.green,
    INSERT = colors.red,
    VISUAL = colors.magenta,
    OP = colors.green,
    BLOCK = colors.blue,
    REPLACE = colors.violet,
    ['V-REPLACE'] = colors.violet,
    ENTER = colors.cyan,
    MORE = colors.cyan,
    SELECT = colors.orange,
    COMMAND = colors.green,
    SHELL = colors.green,
    TERM = colors.green,
    NONE = colors.yellow
}

local function file_osinfo()
    local os = vim.bo.fileformat:upper()
    local icon
    if os == 'UNIX' then
        icon = ' '
    else
        icon = ' '
    end
    return icon
end

--local lsp = require 'feline.providers.lsp'
local vi_mode_utils = require 'feline.providers.vi_mode'
local function coc_status()
    return vim.trim(vim.g.coc_status or '')
end
local coc_diag_get = function(status)
  --local info = vim.b.coc_diagnostic_info
  --return (count > 0) and ' '..count..' ' or ''
  local info = vim.b.coc_diagnostic_info
	if info then
		if status =='warning' then
			return info.warning
		end
		if status =='error' then
			return info.error
		end
		if status =='information' then
			return info.information
		end
		if status =='hint' then
			return info.hint
		end
	end
end
local coc_diag_exist = function(status)
  local info = vim.b.coc_diagnostic_info
	if info then
		if status =='warning' then
			return info.warning >0
		end
		if status =='error' then
			return info.error >0
		end
		if status =='information' then
			return info.information >0
		end
		if status =='hint'  then
			return info.hint >0
		end
	end
end
-- LuaFormatter off

local comps = {
    vi_mode = {
        left = {
            provider = function()
              return ' '..vi_mode_utils.get_vim_mode()
            end,
            hl = function()
                local val = {
                    name = vi_mode_utils.get_mode_highlight_name(),
                    fg = vi_mode_utils.get_mode_color(),
										style = 'bold',
                }
                return val
            end,
            right_sep = ' ',
        },
    },
    file = {
        info = {
            provider = 'file_info',
            file_modified_icon = '',
            hl = {
                fg = colors.blue,
                style = 'bold'
            },
						opts ={type = "relative"},
        },
        encoding = {
            provider = 'file_encoding',
            left_sep = ' ',
            hl = {
                fg = colors.violet,
                style = 'bold'
            }
        },
        type = {
            provider = 'file_type'
        },
        os = {
            provider = file_osinfo,
            left_sep = ' ',
            hl = {
                fg = colors.violet,
                style = 'bold'
            }
        },
        position = {
            provider = 'position',
            hl = {
                fg = colors.cyan,
								 style = 'bold'
            }
        },
    },
    --left_end = {
        --provider = function() return '' end,
        --hl = {
            --fg = colors.blue,
        --}
    --},
    line_percentage = {
        provider = 'line_percentage',
        left_sep = ' ',
        hl = {
            style = 'bold'
        }
    },
    scroll_bar = {
        provider = 'scroll_bar',
        left_sep = ' ',
        hl = {
            fg = colors.blue,
            style = 'bold'
        }
    },
		diagnos = {
				err = {
						-- provider = 'diagnostic_errors',
						provider = function()
								return '' .. coc_diag_get("error")
						end,
						-- left_sep = ' ',
						enabled = function() return coc_diag_exist('error') end,
						hl = {
								fg = colors.red,
						}
				},
				warn = {
						-- provider = 'diagnostic_warnings',
						provider = function()
								return '' ..  coc_diag_get("warning")
						end,
						-- left_sep = ' ',
						enabled = function() return coc_diag_exist('warning') end,
						hl = {
								fg = colors.yellow,
								style = 'bold'
						}
				},
				info = {
						-- provider = 'diagnostic_info',
						provider = function()
								return '' .. coc_diag_get("Information")
						end,
						-- left_sep = ' ',
						enabled = function() return coc_diag_exist('Information') end,
						hl = {
								fg = colors.blue,
						}
				},
				hint = {
						-- provider = 'diagnostic_hints',
						provider = function()
								return '' .. coc_diag_get("hint")
						end,
						-- left_sep = ' ',
						enabled = function() return coc_diag_exist('hint') end,
						hl = {
								fg = colors.cyan,
						}
				},
		},
		lsp = {
				name = {
						provider = coc_status,
						right_sep = ' ',
						icon = '  ',
						hl = {
								fg = colors.yellow,
						}
				}
		},
		git = {
				branch = {
						provider = 'git_branch',
						icon = ' ',
						left_sep = ' ',
						hl = {
								fg = colors.violet,
								style = 'bold'
						},
				},
				--add = {
						--provider = 'git_diff_added',
						--hl = {
								--fg = colors.green
						--}
				--},
				--change = {
						--provider = 'git_diff_changed',
						--hl = {
								--fg = colors.orange
						--}
				--},
				--remove = {
						--provider = 'git_diff_removed',
						--hl = {
								--fg = colors.red
						--}
				--}
		}
}

local components = {
  active = {},
  inactive = {},
}

table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.inactive, {})
table.insert(components.inactive, {})

table.insert(components.active[1], comps.vi_mode.left)
table.insert(components.active[1], comps.file.info)
table.insert(components.active[1], comps.git.branch)
--table.insert(components.active[1], comps.git.add)
--table.insert(components.active[1], comps.git.change)
--table.insert(components.active[1], comps.git.remove)
--table.insert(components.inactive[1], comps.vi_mode.left)
table.insert(components.inactive[1], comps.file.info)
table.insert(components.active[2], comps.diagnos.err)
table.insert(components.active[2], comps.diagnos.warn)
table.insert(components.active[2], comps.diagnos.hint)
table.insert(components.active[2], comps.diagnos.info)
table.insert(components.active[2], comps.lsp.name)
table.insert(components.active[3], comps.file.os)
table.insert(components.active[3], comps.file.position)
table.insert(components.active[3], comps.line_percentage)
table.insert(components.active[3], comps.scroll_bar)
--table.insert(components.active[3], comps.vi_mode.right)

-- require'feline'.setup {}

require'feline'.setup {
		components = components,
		vi_mode_colors = vi_mode_colors,
		--force_inactive = {
				--filetypes = {
						--'packer',
						--'NvimTree',
						--'fugitive',
						--'fugitiveblame'
				--},
				--buftypes = {'terminal'},
				--bufnames = {}
		--}
}
