vim.cmd([[
    hi BqfPreviewBorder guifg=#50a14f ctermfg=71
    hi link BqfPreviewRange Search
]])

require('bqf').setup({
    auto_enable = true,
    auto_resize_height = true, -- highly recommended enable
    preview = {
        win_height = 12,
        win_vheight = 12,
        delay_syntax = 80,
        border_chars = {'┃', '┃', '━', '━', '┏', '┓', '┗', '┛', '█'},
        show_title = false,
        should_preview_cb = function(bufnr, qwinid)
            local ret = true
            local bufname = vim.api.nvim_buf_get_name(bufnr)
            local fsize = vim.fn.getfsize(bufname)
            if fsize > 100 * 1024 then
                -- skip file size greater than 100k
                ret = false
            elseif bufname:match('^fugitive://') then
                -- skip fugitive buffer
                ret = false
            end
            return ret
        end
    },
    -- make `drop` and `tab drop` to become preferred
    func_map = {
        drop = 'o',
        openc = 'O',
        split = '<C-s>',
        tabdrop = '<C-t>',
        -- set to empty string to disable
        tabc = '',
        ptogglemode = 'z,',
    },
    filter = {
        fzf = {
            action_for = {['ctrl-s'] = 'split', ['ctrl-t'] = 'tab drop'},
            extra_opts = {'--bind', 'ctrl-o:toggle-all', '--prompt', '> '}
        }
    }
})



local fn = vim.fn
local cmd = vim.cmd
local api = vim.api

    --packadd nvim-treesitter
-- cmd([[
--     packadd nvim-bqf
-- ]])

-- https://github.com/mhinz/vim-grepper
-- vim.g.grepper = {tools = {'rg', 'grep'}, searchreg = 1}
-- cmd(([[
--     aug Grepper
--         au!
--         au User Grepper ++nested %s
--     aug END
-- ]]):format([[call setqflist([], 'r', {'context': {'bqf': {'pattern_hl': '\%#' . getreg('/')}}})]]))

-- try `gsiw` under word
-- cmd([[
--     nmap gs  <plug>(GrepperOperator)
--     xmap gs  <plug>(GrepperOperator)
-- ]])

-- https://github.com/neoclide/coc.nvim
-- if you use coc-fzf, you should disable its CocLocationsChange event
-- to make bqf work for <Plug>(coc-references)

-- vim.schedule(function()
--     cmd('au! CocFzfLocation User CocLocationsChange')
-- end)
vim.g.coc_enable_locationlist = 0
cmd([[
    aug Coc
        au!
        au User CocLocationsChange lua _G.jumpToLoc()
    aug END
]])

-- just use `_G` prefix as a global function for a demo
-- please use module instead in reality
function _G.jumpToLoc(locs)
    locs = locs or vim.g.coc_jump_locations
    fn.setloclist(0, {}, ' ', {title = 'CocLocationList', items = locs})
    local winid = fn.getloclist(0, {winid = 0}).winid
    if winid == 0 then
        cmd('abo lw')
    else
        api.nvim_set_current_win(winid)
    end
end

function _G.diagnostic()
    fn.CocActionAsync('diagnosticList', '', function(err, res)
        if err == vim.NIL then
            local items = {}
            for _, d in ipairs(res) do
                local text = ('[%s%s] %s'):format((d.source == '' and 'coc.nvim' or d.source),
                    (d.code == vim.NIL and '' or ' ' .. d.code), d.message:match('([^\n]+)\n*'))
                local item = {
                    filename = d.file,
                    lnum = d.lnum,
                    end_lnum = d.end_lnum,
                    col = d.col,
                    end_col = d.end_col,
                    text = text,
                    type = d.severity
                }
                table.insert(items, item)
            end
            fn.setqflist({}, ' ', {title = 'CocDiagnosticList', items = items})

            cmd('bo cope')
        end
    end)
end
-- you can also subscribe User `CocDiagnosticChange` event to reload your diagnostic in quickfix
-- dynamically, enjoy yourself :)
