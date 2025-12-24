-- 补全相关插件
return {
  -- Coc.nvim
  {
    'neoclide/coc.nvim',
    branch = 'master',
    build = 'npm ci',
    config = function()
      local keyset = vim.keymap.set

      -- Coc 全局扩展
      vim.g.coc_global_extensions = {
        'coc-json',
        'coc-vimlsp',
        'coc-html',
        'coc-css',
        'coc-tsserver',
        'coc-rust-analyzer',
        'coc-yank',
        'coc-emmet',
        'coc-eslint',
        'coc-snippets',
        'coc-lit-html',
        'coc-git',
        'coc-oxc',
        'coc-lists',
        'coc-styled-components',
        '@yaegassy/coc-tailwindcss3',
      }
      vim.g.coc_default_semantic_highlight_groups = 0

      -- 辅助函数
      local function check_back_space()
        local col = vim.fn.col('.') - 1
        return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
      end

      -- 显示文档
      local function show_documentation()
        if vim.fn.CocAction('hasProvider', 'hover') then
          vim.fn.CocActionAsync('doHover')
        else
          vim.api.nvim_feedkeys('K', 'in', false)
        end
      end

      -- 跳入/跳出 Coc 浮动窗口
      local function jump_in_out_coc_float()
        local winids = vim.fn['coc#float#get_float_win_list']()
        local current_winid = vim.fn.win_getid()
        for _, id in ipairs(winids) do
          if id == current_winid then
            vim.fn['coc#float#close_all']()
            return
          end
        end
        vim.fn['coc#float#jump']()
      end

      -- Toggle Outline
      local function toggle_outline()
        local winid = vim.fn['coc#window#find']('cocViewId', 'OUTLINE')
        if winid == -1 then
          vim.fn.CocActionAsync('showOutline', 1)
        else
          vim.fn['coc#window#close'](winid)
        end
      end

      -- 按键映射
      keyset('n', 'K', show_documentation, { silent = true })
      keyset('n', 'U', jump_in_out_coc_float, { silent = true })
      keyset('i', '<c-k>', 'coc#refresh()', { silent = true, expr = true })

      -- Tab 补全
      keyset('i', '<TAB>', function()
        if vim.fn['coc#pum#visible']() == 1 then
          return vim.fn['coc#pum#next'](1)
        elseif check_back_space() then
          return '<Tab>'
        else
          return vim.fn['coc#refresh']()
        end
      end, { silent = true, noremap = true, expr = true, replace_keycodes = false })

      keyset('i', '<S-TAB>', function()
        if vim.fn['coc#pum#visible']() == 1 then
          return vim.fn['coc#pum#prev'](1)
        else
          return '<C-h>'
        end
      end, { silent = true, noremap = true, expr = true, replace_keycodes = false })

      -- Enter 确认补全
      keyset('i', '<CR>', function()
        if vim.fn['coc#pum#visible']() == 1 then
          return vim.fn['coc#pum#confirm']()
        else
          return '<C-g>u<CR><c-r>=coc#on_enter()<CR>'
        end
      end, { silent = true, noremap = true, expr = true, replace_keycodes = false })

      -- 跳转定义
      keyset('n', 'gd', '<Plug>(coc-definition)', { silent = true })
      keyset('n', 'gy', '<Plug>(coc-type-definition)', { silent = true })
      keyset('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
      keyset('n', 'gr', '<Plug>(coc-references)', { silent = true, nowait = true })

      -- 浮动窗口滚动
      keyset('n', '<A-f>', function()
        if vim.fn['coc#float#has_scroll']() == 1 then
          return vim.fn['coc#float#scroll'](1)
        else
          return '<C-f>'
        end
      end, { silent = true, nowait = true, expr = true })

      keyset('n', '<A-b>', function()
        if vim.fn['coc#float#has_scroll']() == 1 then
          return vim.fn['coc#float#scroll'](0)
        else
          return '<C-b>'
        end
      end, { silent = true, nowait = true, expr = true })

      keyset('i', '<A-f>', function()
        if vim.fn['coc#float#has_scroll']() == 1 then
          return '<c-r>=coc#float#scroll(1)<cr>'
        else
          return '<Right>'
        end
      end, { silent = true, nowait = true, expr = true, replace_keycodes = false })

      keyset('i', '<A-b>', function()
        if vim.fn['coc#float#has_scroll']() == 1 then
          return '<c-r>=coc#float#scroll(0)<cr>'
        else
          return '<Left>'
        end
      end, { silent = true, nowait = true, expr = true, replace_keycodes = false })

      keyset('v', '<A-f>', function()
        if vim.fn['coc#float#has_scroll']() == 1 then
          return vim.fn['coc#float#scroll'](1)
        else
          return '<C-f>'
        end
      end, { silent = true, nowait = true, expr = true })

      keyset('v', '<A-b>', function()
        if vim.fn['coc#float#has_scroll']() == 1 then
          return vim.fn['coc#float#scroll'](0)
        else
          return '<C-b>'
        end
      end, { silent = true, nowait = true, expr = true })

      -- 文本对象
      keyset('x', 'if', '<Plug>(coc-funcobj-i)')
      keyset('o', 'if', '<Plug>(coc-funcobj-i)')
      keyset('x', 'af', '<Plug>(coc-funcobj-a)')
      keyset('o', 'af', '<Plug>(coc-funcobj-a)')
      keyset('x', 'ic', '<Plug>(coc-classobj-i)')
      keyset('o', 'ic', '<Plug>(coc-classobj-i)')
      keyset('x', 'ac', '<Plug>(coc-classobj-a)')
      keyset('o', 'ac', '<Plug>(coc-classobj-a)')

      -- CocList
      keyset('n', '<space>s', ':<C-u>CocList -I symbols<cr>', { silent = true, nowait = true })

      -- Git chunk 导航 (由 gitsigns 处理，这里保留 coc-git 的备用)
      -- keyset('n', 'gk', '<Plug>(coc-git-prevchunk)')
      -- keyset('n', 'gj', '<Plug>(coc-git-nextchunk)')
      keyset('n', '<leader>gs', ':<C-u>CocList --normal --no-quit --auto-preview gstatus<CR>', { silent = true })

      -- Yank 历史
      keyset('n', '<leader>p', ':<C-u>CocList --normal yank<cr>', { silent = true })

      -- 重命名
      keyset('n', '<F2>', '<Plug>(coc-rename)')
      keyset('n', '<leader>cl', '<Plug>(coc-codelens-action)')

      -- 诊断导航
      keyset('n', '<c-k>', '<Plug>(coc-diagnostic-prev)', { silent = true })
      keyset('n', '<c-j>', '<Plug>(coc-diagnostic-next)', { silent = true })

      -- 代码操作
      keyset('n', '<leader><leader>', '<plug>(coc-codeaction)')

      -- ESLint 自动修复
      keyset('n', "''", ':CocCommand eslint.executeAutofix<cr>', { silent = true })

      -- Quickfix 导航
      keyset('n', '<a-q>', ':cprev<cr>', { silent = true })
      keyset('n', '<a-e>', ':cnext<cr>', { silent = true })

      -- Outline 切换
      keyset('n', '<c-]>', toggle_outline, { silent = true, nowait = true })

      -- 范围选择
      keyset('n', '<C-e>', '<Plug>(coc-range-select)', { silent = true })
      keyset('x', '<C-e>', '<Plug>(coc-range-select)', { silent = true })

      -- 命令
      vim.api.nvim_create_user_command('OR', "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})
      vim.api.nvim_create_user_command('Fold', function(opts)
        vim.fn.CocAction('fold', opts.args)
      end, { nargs = '?' })
      vim.api.nvim_create_user_command('FoldGit', 'CocCommand git.foldUnchanged', {})
      vim.api.nvim_create_user_command(
        'CocNearExplorer',
        "call CocAction('runCommand', 'explorer.doAction', 'closest', ['reveal:0'], [['relative', 0, 'file']])",
        {}
      )
    end,
  },

  -- Blink.cmp
  {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*',
    opts_extend = { 'sources.default' },
  },

  -- ESLint
  { 'esmuellert/nvim-eslint' },

  -- LspUI
  { 'jinzhongjia/LspUI.nvim' },
}
