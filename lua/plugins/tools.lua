-- 工具类插件
return {
  -- Terminal help
  { 'skywind3000/vim-terminal-help' },

  -- Async 任务
  {
    'skywind3000/asynctasks.vim',
    config = function()
      vim.g.asynctasks_term_pos = 'bottom'
      vim.g.asyncrun_open = 3
      vim.keymap.set('', '<F8>', '<cmd>AsyncTask file-run<cr>')
    end,
  },
  { 'skywind3000/asyncrun.vim' },

  -- Suda 提权保存
  {
    'lambdalisue/suda.vim',
    config = function()
      vim.keymap.set('n', '<leader>W', '<cmd>SudaWrite<cr>')
    end,
  },

  -- Plenary 工具库
  { 'nvim-lua/plenary.nvim' },

  -- Session 管理
  {
    'Shatur/neovim-session-manager',
    config = function()
      local Path = require('plenary.path')
      require('session_manager').setup({
        sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'),
        path_replacer = '__',
        colon_replacer = '++',
        autoload_mode = require('session_manager.config').AutoloadMode.CurrentDir,
        autosave_last_session = true,
        autosave_ignore_not_normal = true,
        autosave_ignore_filetypes = {
          'gitcommit',
        },
        autosave_only_in_session = false,
        max_path_length = 80,
      })
    end,
  },

  -- QuickUI
  { 'skywind3000/vim-quickui' },
  {
    'skywind3000/vim-quickui-navigator',
    config = function()
      vim.g.navigator = { prefix = '<LEADER><k>' }
      vim.g.navigator_popup = 1
      vim.g.navigator_popup_position = 'bottom'
      vim.g.navigator_popup_border = 0
      vim.keymap.set('n', '<leader>k', ':Navigator g:navigator<cr>', { silent = true })

      vim.g.navigator.p = {
        name = '+path',
        ['1'] = { ':BlGetFilePathRelative', 'GetFilePathRelative' },
        ['2'] = { ':BlGetFilePathLine', 'GetFilePathLine' },
        ['3'] = { ':BlGetFilePathAbsolute', 'GetFilePathAbsolute' },
      }

      vim.g.navigator.g = {
        name = '+git',
        c = { ':DiffviewClose', 'diff close' },
        h = { ':DiffviewHead', 'diff head' },
        d = { 'execute("DiffviewOpen") | CocDisable', 'diff current changes' },
        l = { ':DiffviewFileHistory', 'diff log branch' },
        b = { ':DiffviewFileHistory %', 'diff log file' },
        p = { ':Glfuzzy', 'diff log file' },
        f = { ':Flog', 'flog' },
        t = { ':Gitsigns toggle_current_line_blame', 'toggle git blame' },
      }

      vim.g.navigator.c = {
        name = '+coc',
        d = { ':CocDisable', 'coc disable' },
        e = { ':CocEnable', 'coc enable' },
      }

      vim.g.navigator.j = {
        name = 'jump',
        j = { ':JumpTo', 'jump to file with path and line' },
        y = { ':GetFilePathLineCommand', 'get current file path and line' },
      }

      vim.g.navigator.l = {
        name = 'list',
        c = { ':ListLog', 'list console.log contains blue' },
        t = { ':ListTodo', 'list Todo' },
      }
    end,
  },

  -- OSC Yank 远程复制
  { 'ojroques/vim-oscyank' },

  -- ToggleTerm
  {
    'akinsho/toggleterm.nvim',
    config = function()
      require('toggleterm').setup({
        persist_mode = false,
      })

      local Terminal = require('toggleterm.terminal').Terminal
      local lazygit = Terminal:new({
        cmd = 'lazygit',
        hidden = true,
        direction = 'float',
        on_open = function(term)
          vim.api.nvim_buf_set_keymap(
            term.bufnr,
            't',
            '<tab>',
            '<cmd>close<CR>',
            { noremap = true, silent = true, nowait = true }
          )
        end,
      })

      _G._lazygit_toggle = function()
        lazygit:toggle()
      end

      vim.keymap.set('n', '<tab>', '<cmd>lua _lazygit_toggle()<CR>', { noremap = true, silent = true, nowait = true })
      vim.keymap.set(
        'n',
        '<leader>gg',
        '<cmd>lua _lazygit_toggle()<CR>',
        { noremap = true, silent = true, nowait = true }
      )
    end,
  },

  -- Flatten - 嵌套 Neovim 支持
  {
    'willothy/flatten.nvim',
    config = function()
      require('flatten').setup({
        window = {
          open = 'alternate',
        },
      })
    end,
  },

  -- BQF - 增强 Quickfix
  {
    'kevinhwang91/nvim-bqf',
    config = function()
      vim.cmd([[
        hi BqfPreviewBorder guifg=#3e8e2d ctermfg=71
        hi BqfPreviewTitle guifg=#3e8e2d ctermfg=71
        hi BqfPreviewThumb guibg=#3e8e2d ctermbg=71
        hi link BqfPreviewRange Search
      ]])

      local fn = vim.fn

      function _G.qftf(info)
        local items
        local ret = {}
        if info.quickfix == 1 then
          items = fn.getqflist({ id = info.id, items = 0 }).items
        else
          items = fn.getloclist(info.winid, { id = info.id, items = 0 }).items
        end
        local validFmt = '%s │%5d:%-3d│%s %s'
        for i = info.start_idx, info.end_idx do
          local e = items[i]
          local fname = ''
          local str
          if e.valid == 1 then
            if e.bufnr > 0 then
              fname = fn.bufname(e.bufnr)
            end
            local lnum = e.lnum > 99999 and -1 or e.lnum
            local col = e.col > 999 and -1 or e.col
            local qtype = e.type == '' and '' or ' ' .. e.type:sub(1, 1):upper()
            str = validFmt:format(fname, lnum, col, qtype, e.text)
          else
            str = e.text
          end
          table.insert(ret, str)
        end
        return ret
      end

      vim.o.qftf = '{info -> v:lua._G.qftf(info)}'

      require('bqf').setup({
        auto_enable = true,
        auto_resize_height = false,
        preview = {
          winblend = 0,
          win_height = 12,
          win_vheight = 12,
          delay_syntax = 80,
          border = { '┏', '━', '┓', '┃', '┛', '━', '┗', '┃' },
          show_title = false,
          should_preview_cb = function(bufnr, qwinid)
            local ret = true
            local bufname = vim.api.nvim_buf_get_name(bufnr)
            local fsize = vim.fn.getfsize(bufname)
            if fsize > 100 * 1024 then
              ret = false
            elseif bufname:match('^fugitive://') then
              ret = false
            end
            return ret
          end,
        },
        func_map = {
          drop = 'O',
          open = 'o',
          openc = '<CR>',
          split = '<C-s>',
          tabdrop = '<C-t>',
          tabc = '',
          ptogglemode = 'z,',
        },
        filter = {
          fzf = {
            action_for = { ['ctrl-s'] = 'split', ['ctrl-t'] = 'tab drop' },
            extra_opts = { '--bind', 'ctrl-o:toggle-all', '--prompt', '> ' },
          },
        },
      })

      -- Grepper 集成
      vim.g.grepper = { tools = { 'rg', 'grep' }, searchreg = 1 }
      vim.cmd([[
        aug Grepper
          au!
          au User Grepper ++nested call setqflist([], 'r', {'context': {'bqf': {'pattern_hl': '\%#' . getreg('/')}}})
        aug END
      ]])

      -- Coc 集成
      vim.g.coc_enable_locationlist = 0
      vim.cmd([[
        aug Coc
          au!
          au User CocLocationsChange lua _G.jumpToLoc()
        aug END
      ]])
      vim.keymap.set('n', '<leader>a', '<Cmd>lua _G.diagnostic()<CR>', { silent = true })

      function _G.jumpToLoc(locs)
        locs = locs or vim.g.coc_jump_locations
        fn.setqflist({}, ' ', { title = 'CocLocationList', items = locs })
        vim.cmd('top copen')
      end

      function _G.diagnostic()
        fn.CocActionAsync('diagnosticList', '', function(err, res)
          if err == vim.NIL then
            local items = {}
            for _, d in ipairs(res) do
              local text = ('[%s%s] %s'):format(
                (d.source == '' and 'coc.nvim' or d.source),
                (d.code == vim.NIL and '' or ' ' .. d.code),
                d.message:match('([^\n]+)\n*')
              )
              local item = {
                filename = d.file,
                lnum = d.lnum,
                end_lnum = d.end_lnum,
                col = d.col,
                end_col = d.end_col,
                text = text,
                type = d.severity,
              }
              table.insert(items, item)
            end
            fn.setqflist({}, ' ', { title = 'CocDiagnosticList', items = items })
            vim.cmd('top cope')
          end
        end)
      end
    end,
  },
}

