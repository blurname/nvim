-- 搜索工具插件
return {
  -- hlslens 搜索高亮
  {
    'kevinhwang91/nvim-hlslens',
    config = function()
      require('hlslens').setup()

      -- hlslens 按键映射
      vim.keymap.set(
        'n',
        'n',
        [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
        { silent = true }
      )
      vim.keymap.set(
        'n',
        'N',
        [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
        { silent = true }
      )
      vim.keymap.set('n', '*', [[<Plug>(asterisk-z*)<Cmd>lua require('hlslens').start()<CR>]])
      vim.keymap.set('n', '#', [[<Plug>(asterisk-z#)<Cmd>lua require('hlslens').start()<CR>]])
      vim.keymap.set('n', 'g*', [[<Plug>(asterisk-gz*)<Cmd>lua require('hlslens').start()<CR>]])
      vim.keymap.set('n', 'g#', [[<Plug>(asterisk-gz#)<Cmd>lua require('hlslens').start()<CR>]])

      -- VM lens 集成
      local hlslens = require('hlslens')
      if hlslens then
        local overrideLens = function(render, posList, nearest, idx, relIdx)
          local _ = relIdx
          local lnum, col = unpack(posList[idx])

          local text, chunks
          if nearest then
            text = ('[%d/%d]'):format(idx, #posList)
            chunks = { { ' ', 'Ignore' }, { text, 'VM_Extend' } }
          else
            text = ('[%d]'):format(idx)
            chunks = { { ' ', 'Ignore' }, { text, 'HlSearchLens' } }
          end
          render.setVirt(0, lnum - 1, col - 1, chunks, nearest)
        end
        local lensBak
        local config = require('hlslens.config')
        local gid = vim.api.nvim_create_augroup('VMlens', {})
        vim.api.nvim_create_autocmd('User', {
          pattern = { 'visual_multi_start', 'visual_multi_exit' },
          group = gid,
          callback = function(ev)
            if ev.match == 'visual_multi_start' then
              lensBak = config.override_lens
              config.override_lens = overrideLens
            else
              config.override_lens = lensBak
            end
            hlslens.start()
          end,
        })
      end
    end,
  },

  -- asterisk 搜索增强
  { 'haya14busa/vim-asterisk' },

  -- FZF
  {
    'junegunn/fzf',
    build = function()
      vim.fn['fzf#install']()
    end,
  },

  -- Grepper
  { 'blurname/vim-grepper' },

  -- Grug-far 搜索替换
  {
    'MagicDuck/grug-far.nvim',
    config = function()
      require('grug-far').setup({
        debounceMs = 500,
        wrap = false,
        normalModeSearch = true,
        prefills = {
          search = '',
          replacement = '',
          filesFilter = '!public/',
          flags = '-i -F',
          paths = '',
        },
        keymaps = {
          gotoLocation = { n = 'o' },
          openLocation = { n = '<enter>' },
        },
      })
      vim.keymap.set('n', '<leader>i', '<cmd>lua require("grug-far").toggle_instance({instanceName = "gf"})<CR>')
      vim.keymap.set(
        'x',
        '<leader>i',
        '<cmd>lua require("grug-far").with_visual_selection({ prefills = { paths = vim.fn.expand("%") } })<CR>'
      )
    end,
  },

  -- FZF 配置
  {
    'blurname/fzf-config',
    name = 'fzf-config',
    virtual = true,
    config = function()
      local color = require('utils.helpers')

      local cached_ansi = {}
      vim.g.fzf_action = {
        ['ctrl-x'] = 'split',
        ['ctrl-v'] = 'vsplit',
        ['ctrl-t'] = 'tab split',
      }

      vim.g.fzf_layout = {
        window = {
          width = 0.7,
          height = 0.5,
          xoffset = 0.9,
          yoffset = 0.6,
        },
      }

      local fd_prefix = 'fd --hidden --follow --color=never --type f --type l --exclude .git'
      local cached_fzf_query
      local cached_finder

      if not cached_fzf_query then
        cached_fzf_query = vim.fn.tempname()
      end

      local function shortpath(path)
        local short = vim.fn.fnamemodify(path, ':~:.')
        short = vim.fn.pathshorten(short)
        return short == '' and '~/' or (short:match('/$') and short or short .. '/')
      end

      local function get_expect(extra_keys, with_defaults)
        extra_keys = extra_keys or {}
        if with_defaults == nil then
          with_defaults = true
        end
        local extra = table.concat(extra_keys, ',')
        return with_defaults and ('ctrl-x,ctrl-v,ctrl-t,' .. extra) or extra
      end

      local function get_fzf_opts(from_resume, extra_opts)
        extra_opts = extra_opts or {}
        local common_opts = {
          '--ansi',
          '--multi',
          '--bind',
          'result:execute-silent(echo {q} > ' .. cached_fzf_query .. ')',
        }
        if from_resume then
          common_opts = vim.list_extend(common_opts, {
            '--bind',
            'start:transform-query:cat ' .. cached_fzf_query,
          })
        end
        return vim.list_extend(common_opts, extra_opts)
      end

      local function sink_file(lines)
        local key = lines[1]
        local cmd = vim.g.fzf_action[key] or 'edit'
        for i = 2, #lines do
          vim.cmd(cmd .. ' ' .. lines[i])
        end
      end

      local function run(finder, from_resume)
        cached_finder = finder
        finder(from_resume)
      end

      -- Resume
      vim.keymap.set('n', '<leader>j', function()
        if not cached_finder then
          return
        end
        run(cached_finder, true)
      end)

      -- Files
      local function files(from_resume)
        local fd_cmd = fd_prefix

        local spec = {
          ['sink*'] = sink_file,
          options = get_fzf_opts(from_resume, {
            '--prompt',
            shortpath(vim.uv.cwd()),
            '--expect',
            get_expect(),
          }),
        }

        local old_fzf_cmd = vim.env.FZF_DEFAULT_COMMAND
        vim.env.FZF_DEFAULT_COMMAND = fd_cmd
        vim.fn['fzf#run'](vim.fn['fzf#wrap'](spec))
        vim.env.FZF_DEFAULT_COMMAND = old_fzf_cmd
      end

      vim.keymap.set('n', '<leader>l', function()
        run(files)
      end)

      -- Buffer list
      vim.keymap.set('n', '<leader>b', ':Neotree buffers position=float<cr>')

      -- List package.json
      local function listPackageJson(from_resume)
        local spec = {
          ['sink*'] = sink_file,
          options = get_fzf_opts(from_resume, {
            '--prompt',
            shortpath(vim.uv.cwd()),
            '--expect',
            get_expect(),
          }),
        }

        local old_fzf_cmd = vim.env.FZF_DEFAULT_COMMAND
        vim.env.FZF_DEFAULT_COMMAND = 'fd package.json'
        vim.fn['fzf#run'](vim.fn['fzf#wrap'](spec))
        vim.env.FZF_DEFAULT_COMMAND = old_fzf_cmd
      end

      vim.keymap.set('n', '<F10>', function()
        run(listPackageJson)
      end)
    end,
  },
}

