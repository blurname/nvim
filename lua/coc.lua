local M = {}
local api = vim.api
local fn = vim.fn
local cmd = vim.cmd

local utils = require('kutils')
local diag_qfid
local sign_icons

function M.go2def()
    local cur_bufnr = api.nvim_get_current_buf()
    local by
    if vim.bo.ft == 'help' then
        api.nvim_feedkeys(api.nvim_replace_termcodes('<C-]>', true, false, true), 'n', false)
        by = 'tag'
    else
        local err = M.a2sync('definitions')
        if not err then
            fn.CocAction('jumpDefinition', 'drop')
            by = 'coc'
        else
            local cword = fn.expand('<cword>')
            if not pcall(function()
                local wv = fn.winsaveview()
                cmd('ltag ' .. cword)
                local def_size = fn.getloclist(0, {size = 0}).size
                by = 'ltag'
                if def_size > 1 then
                    api.nvim_set_current_buf(cur_bufnr)
                    fn.winrestview(wv)
                    cmd('abo lw')
                elseif def_size == 1 then
                    cmd('lcl')
                    fn.search(cword, 'cs')
                end
            end) then
                fn.searchdecl(cword)
                by = 'search'
            end
        end
    end
    if api.nvim_get_current_buf() ~= cur_bufnr then
        cmd('norm! zz')
    end

    if by then
        utils.cool_echo('go2def: ' .. by, 'Special')
    end
end

function M.show_documentation()
    local ft = vim.bo.ft
    if ft == 'vim' or ft == 'help' then
        cmd(('sil! h %s'):format(fn.expand('<cword>')))
    elseif api.nvim_eval([[CocAction('hasProvider', 'hover')]]) then
        fn.CocActionAsync('definitionHover')
    else
        cmd('norm! K')
    end
end

-- function M.outline()
--     local o = fn.CocAction('listLoadItems', 'outline')
-- end

function M.diagnostic_change()
    if vim.v.exiting == vim.NIL then
        local info = fn.getqflist({id = diag_qfid, winid = 0, nr = 0})
        if info.winid ~= 0 then
            M.diagnostic(info.winid, info.nr, true)
        end
    end
end

function M.diagnostic(winid, nr, keep)
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
            local id
            if winid and nr then
                id = diag_qfid
            else
                local info = fn.getqflist({id = diag_qfid, winid = 0, nr = 0})
                id, winid, nr = info.id, info.winid, info.nr
            end
            local action = id == 0 and ' ' or 'r'
            fn.setqflist({}, action,
                {id = id ~= 0 and id or nil, title = 'CocDiagnosticList', items = items})

            if id == 0 then
                local info = fn.getqflist({id = id, nr = 0})
                diag_qfid, nr = info.id, info.nr
            end

            if not keep then
                if winid == 0 then
                    cmd('bo cope')
                else
                    api.nvim_set_current_win(winid)
                end
            else
                cmd(('sil %dchi'):format(nr))
            end
        end
    end)
end

function M.jump2loc(locs, skip)
    locs = locs or vim.g.coc_jump_locations
    local ctx
    local loc_ranges = vim.tbl_map(function(val)
        return val.range
    end, locs)
    ctx = {bqf = {lsp_ranges_hl = loc_ranges}}
    fn.setloclist(0, {}, ' ', {title = 'CocLocationList', items = locs, context = ctx})
    if not skip then
        local winid = fn.getloclist(0, {winid = 0}).winid
        if winid == 0 then
            cmd('abo lw')
        else
            api.nvim_set_current_win(winid)
        end
    end
end

local function get_cur_word()
    local lnum, col = unpack(api.nvim_win_get_cursor(0))
    local line = api.nvim_buf_get_lines(0, lnum - 1, lnum, true)[1]:match('%C*')
    local word = fn.matchstr(line:sub(1, col + 1), [[\k*$]]) ..
                     fn.matchstr(line:sub(col + 1, -1), [[^\k*]]):sub(2, -1)
    return ([[\<%s\>]]):format(word:gsub('[\\/~]', [[\%1]]))
end

-- CocHasProvider('documentHighlight') has probability of RPC failure
-- Write the hardcode of filetype for fallback highlight
local fb_bl_ft = {
    'qf', 'fzf', 'vim', 'sh', 'python', 'go', 'c', 'cpp', 'rust', 'java', 'lua', 'typescript',
    'javascript', 'css', 'html', 'xml'
}

local hl_fb_tbl = {}

function M.hl_fallback()
    if vim.tbl_contains(fb_bl_ft, vim.bo.ft) or api.nvim_get_mode().mode == 't' and vim.bo.bt ==
        'terminal' then
        return
    end

    local m_id, winid = unpack(hl_fb_tbl)
    pcall(fn.matchdelete, m_id, winid)

    winid = api.nvim_get_current_win()
    m_id = fn.matchadd('CocHighlightText', get_cur_word(), -1, -1, {window = winid})
    hl_fb_tbl = {m_id, winid}
end

function M.a2sync(action, args, time)
    local done = false
    local err = false
    local res = ''
    args = args or {''}
    table.insert(args, function(e, r)
        if e ~= vim.NIL then
            err = true
        end
        if r ~= vim.NIL then
            res = r
        end
        done = true
    end)
    fn.CocActionAsync(action, unpack(args))
    local wait_ret = vim.wait(time or 1000, function()
        return done
    end)
    err, res = err or not wait_ret, wait_ret and res or 'timeout'
    return err, res
end

function M.code_action(...)
    local argv = {...}
    fn.CocActionAsync('codeActions', unpack(argv), function(err, res)
        if err == vim.NIL and type(res) == 'table' and #res > 0 then
            fn.CocActionAsync('codeAction', unpack(argv))
        else
            utils.cool_echo('No codeAction', 'WarningMsg')
        end
    end)
end

function M.organize_import()
    local err, ret = M.a2sync('organizeImport', {}, 1000)
    if err then
        if ret == 'timeout' then
            utils.cool_echo('organizeImport timeout', 'ErrorMsg')
        else
            utils.cool_echo('No action for organizeImport', 'WarningMsg')
        end
    end
end

function M.accept_complete()
    local mode = api.nvim_get_mode().mode
    if mode == 'i' then
        api.nvim_feedkeys(api.nvim_replace_termcodes('<C-l>', true, false, true), 'n', false)
    elseif mode == 'ic' and fn.pumvisible() == 1 then
        local ei_bak = vim.o.ei
        vim.o.ei = 'CompleteDone'
        vim.schedule(function()
            vim.o.ei = ei_bak
        end)
        api.nvim_feedkeys(api.nvim_replace_termcodes('<C-y>', true, false, true), 'n', false)
        if fn.pumvisible() == 1 then
            fn.CocActionAsync('stopCompletion')
        end
    end
end

function M.rename()
    vim.g.coc_jump_locations = nil
    fn.CocActionAsync('rename', '', function(err, res)
        if err == vim.NIL and res then
            local loc = vim.g.coc_jump_locations
            if loc then
                local uri = vim.uri_from_bufnr()
                local dont_open = true
                for _, lo in ipairs(loc) do
                    if lo.uri ~= uri then
                        dont_open = false
                        break
                    end
                end
                M.jump2loc(loc, dont_open)
            end
        end
    end)
end

function M.skip_snippet()
    fn.CocActionAsync('snippetNext')
    return api.nvim_replace_termcodes([[\<BS>]], true, false, true)
end

function M.switch_file()
    local ft = vim.bo.ft
    if ft == 'go' then
        cmd('CocCommand go.test.toggle')
    elseif ft == 'c' or ft == 'cpp' then
        cmd('CocCommand clangd.switchSourceHeader')
    end
end

function M.sign_icons(level)
    return sign_icons[level]
end

local function init()
    diag_qfid = -1

    cmd('hi link CocSem_parameter Parameter')
    cmd('hi link CocSem_variable NONE')
    cmd('hi link CocSem_namespace Namespace')

    fn['coc#config']('languageserver.lua.settings.Lua.workspace',
        {library = {[vim.env.VIMRUNTIME .. '/lua'] = true}})

    fn['coc#config']('snippets', {textmateSnippetsRoots = {fn.stdpath('config') .. '/snippets'}})
    fn.CocActionAsync('reloadExtension', 'coc-snippets')

    local diag_config = fn['coc#util#get_config']('diagnostic')
    sign_icons = {
        hint = diag_config.hintSign,
        info = diag_config.infoSign,
        warning = diag_config.warningSign,
        error = diag_config.errorSign
    }

    cmd([[
        aug Coc
            au!
            au User CocLocationsChange ++nested lua require('plugs.coc').jump2loc()
            au User CocDiagnosticChange ++nested lua require('plugs.coc').diagnostic_change()
            au CursorHold * sil! call CocActionAsync('highlight', '', v:lua.require('plugs.coc').hl_fallback)
            au User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
            au VimLeavePre * if get(g:, 'coc_process_pid', 0) | call system('kill -9 -- -' . g:coc_process_pid) | endif
            au FileType list lua vim.cmd('pa nvim-bqf') require('bqf.magicwin.handler').attach()
        aug END
    ]])

    cmd('hi! link CocHighlightText CurrentWord')
    if vim.g.colors_name == 'one' then
        cmd('hi! CocFadeOut guifg=#928374')
        cmd('hi! CocErrorSign guifg=#be5046')
        cmd('hi! CocWarningSign guifg=#e5c07b')
    end

end

init()

return M
