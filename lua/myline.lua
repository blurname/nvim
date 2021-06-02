local gl = require('galaxyline')
local gls = gl.section



gl.short_line_list = {'LuaTree','vista','dbui'}

local colors = {
	bg = '#3b4252',
	yellow = '#fabd2f',
	cyan = '#008080',
	darkblue = '#4c566a',
	green = '#de3f7c',
	orange = '#FF8800',
	purple = '#88c0d0',
	magenta = '#d8dee9',
	grey = '#3b4252',
	blue = '#0087d7',
	red = '#ec5f67'
}

local function lsp_status(status)
	shorter_stat = ''
	for match in string.gmatch(status, "[^%s]+")  do
		err_warn = string.find(match, "^[WE]%d+", 0)
		if not err_warn then
			shorter_stat = shorter_stat .. ' ' .. match
		end
	end
	return shorter_stat
end


local function get_coc_lsp()
  local status = vim.fn['coc#status']()
  if not status or status == '' then
      return ''
  end
  return lsp_status(status)
end

function get_diagnostic_info()
  if vim.fn.exists('*coc#rpc#start_server') == 1 then
    return get_coc_lsp()
    end
  return ''
end

local function get_current_func()
  local has_func, func_name = pcall(vim.fn.nvim_buf_get_var,0,'coc_current_function')
  if not has_func then return end
      return func_name
  end

CocStatus = get_diagnostic_info
CocFunc = get_current_func






local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
    return true
  end
  return false
end

-- gls.left[1] = {
--   FirstElement = {
--     provider = function() return '▋' end,
--     highlight = {colors.blue,colors.yellow}
--   },
-- }
-- gls.left[2] = {
--   ViMode = {
--     provider = function()
--       local alias = {n = 'NORMAL',i = 'INSERT',c= 'COMMAND',V= 'VISUAL', [''] = 'VISUAL'}
--       return alias[vim.fn.mode()]
--     end,
--     separator = '',
--     separator_highlight = {colors.yellow,function()
--       if not buffer_not_empty() then
--         return colors.purple
--       end
--       return colors.darkblue
--     end},
--     highlight = {colors.magenta,colors.yellow,'bold'},
--   },
-- }
-- gls.left[3] ={
--   FileIcon = {
--     provider = 'FileIcon',
--     condition = buffer_not_empty,
--     highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.darkblue},
--   },
-- }
gls.left[4] = {
  FileName = {
    provider = {'FileName','FileSize'},
    condition = buffer_not_empty,
    separator = '',
    separator_highlight = {colors.purple,colors.darkblue},
    highlight = {colors.magenta,colors.darkblue}
  }
}

gls.left[5] = {
  GitIcon = {
    provider = function() return '  ' end,
    condition = buffer_not_empty,
    highlight = {colors.orange,colors.purple},
  }
}
gls.left[6] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = buffer_not_empty,
    highlight = {colors.grey,colors.purple},
  }
}

local checkwidth = function()
  local squeeze_width  = vim.fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

gls.left[7] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = checkwidth,
    icon = ' ',
    highlight = {colors.blue,colors.purple},
  }
}
gls.left[8] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = checkwidth,
    icon = ' ',
    highlight = {colors.orange,colors.purple},
  }
}
gls.left[9] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = checkwidth,
    icon = ' ',
    highlight = {colors.red,colors.purple},
  }
}
gls.left[10] = {
  LeftEnd = {
    provider = function() return '' end,
    separator = '',
    separator_highlight = {colors.purple,colors.bg},
    highlight = {colors.purple,colors.purple}
  }
}
gls.left[11] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {colors.red,colors.bg}
  }
}
-- gls.left[12] = {
--   Space = {
--     provider = function () return ' ' end
--   }
-- }
gls.left[13] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = {colors.blue,colors.bg},
  }
}
gls.left[14] = {
    CocStatus = {
     provider = CocStatus,
     highlight = {colors.green,colors.bg},
    }
}

gls.left[15] = {
  CocFunc = {
    provider = CocFunc,
    icon = '  λ ',
    highlight = {colors.yellow,colors.bg},
  }
}
gls.right[1]= {
  FileFormat = {
    provider = 'FileFormat',
    separator = '',
    separator_highlight = {colors.bg,colors.purple},
    highlight = {colors.grey,colors.purple},
  }
}
gls.right[2] = {
  LineInfo = {
    provider = 'LineColumn',
    separator = ' | ',
    separator_highlight = {colors.darkblue,colors.purple},
    highlight = {colors.grey,colors.purple},
  },
}
gls.right[3] = {
  PerCent = {
    provider = 'LinePercent',
    separator = '',
    separator_highlight = {colors.darkblue,colors.purple},
    highlight = {colors.yellow,colors.darkblue},
  }
}
gls.right[4] = {
  ScrollBar = {
    provider = 'ScrollBar',
    highlight = {colors.yellow,colors.purple},
  }
}

gls.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    separator = '',
    separator_highlight = {colors.purple,colors.bg},
    highlight = {colors.grey,colors.purple}
  }
}


gls.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    separator = '',
    separator_highlight = {colors.purple,colors.bg},
    highlight = {colors.grey,colors.purple}
  }
}
