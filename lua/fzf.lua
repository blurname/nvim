local color = require('util.color')
-- https://github.com/rockyzhang24/dotfiles/blob/master/.config/nvim/plugin/fzf.lua
local system = {}



---@type table<string, string> A map from highlight group to ANSI color code
local cached_ansi = {}
vim.g.fzf_action = {
    ['ctrl-x'] = 'split',
    ['ctrl-v'] = 'vsplit',
    ['ctrl-t'] = 'tab split',
}

vim.g.fzf_layout = {
  window= {
    width= 0.7, 
    height= 0.5,  
    xoffset = 0.9,
    yoffset = 0.6
  },
}
---Color a string by ANSI color code that is converted from a highlight group
---@param str string string to be colored
---@param hl string highlight group name
---@param from_type string? which color type in the highlight group will be used, 'fg', 'bg' or 'sp'
---@param to_type string? which ANSI color type will be output, 'fg' or 'bg'
local function ansi_string(str, hl, from_type, to_type)
    from_type = from_type or 'fg'
    to_type = to_type or 'fg'
    if not cached_ansi[hl] then
        cached_ansi[hl] = color.hl2ansi(hl, from_type, to_type)
    end
    return cached_ansi[hl] .. str .. '\x1b[m'
end

---Execute an external command asynchronously
---@param command string|table The external command
---@param opts table? opts for vim.system
---@param on_success function?
---@param on_error function?
function system.async(command, opts, on_success, on_error)
    opts = opts or {}
    local cmd
    if type(command) == 'string' then
        cmd = vim.split(command, ' ')
    else
        cmd = command
    end
    vim.system(cmd, opts, function(obj)
        if obj.code == 0 then
            if type(on_success) == 'function' then
                on_success(obj.stdout)
            end
        elseif type(on_error) == 'function' then
            on_error(obj.stderr, obj.stdout)
        end
    end)
end

---Execute an external command synchronously
---@param command string|table
function system.sync(command)
    local cmd
    if type(command) == 'string' then
        cmd = vim.split(command, ' ')
    else
        cmd = command
    end
    return vim.system(cmd):wait()
end

-- local fd_prefix = 'fd --hidden --follow --color=never --type f --type l ' .. vim.env.FD_EXCLUDE
local fd_prefix = 'fd --hidden --follow --color=never --type f --type l --exclude .git'

local cached_fzf_query -- cached the last fzf query
local cached_rg_query -- cached the last rg query (for live greps)
local cached_finder -- cached the last executed fzf finder
if not cached_fzf_query then
    cached_fzf_query = vim.fn.tempname()
end


-- Record the pid of the tail command so that we can kill it right after all contents are written to
--
-- the pipe to terminate the fzf "loading" indicator.
local tail_pid = vim.fn.tempname()

---Cache the given finder for later fzf resume and run the finder (launch fzf UI, process entries
---and send the entries to fzf for display)
---@param finder function
---@param from_resume boolean? Whether it is called from fzf resume
local function run(finder, from_resume)
    cached_finder = finder
    finder(from_resume)
end
-- Resume
vim.keymap.set('n', '<leader>j', function()
    if not cached_finder then
        -- notify.warn('No resume finder available!')
        return
    end
    run(cached_finder, true)
end)

---Launch fzf. Its contents can be an external command's output, or a lua table containing all
---entries.
---@param spec table The spec dictionary, see https://github.com/junegunn/fzf/blob/master/README-VIM.md
---@param handle_contents function? Build the table containing all fzf entries and write them to the
---pipe
---@param fzf_cmd string? External bash command
local function fzf(spec, handle_contents, fzf_cmd)
    local old_fzf_cmd = vim.env.FZF_DEFAULT_COMMAND
     vim.env.FZF_DEFAULT_COMMAND = fzf_cmd

    if handle_contents and not fzf_cmd then
        fifopipe = vim.fn.tempname()
        system.sync('mkfifo ' .. fifopipe)
        -- vim.env.FZF_DEFAULT_COMMAND = 'cat ' .. fifopipe
        vim.env.FZF_DEFAULT_COMMAND = 'tail -n +1 -f ' .. fifopipe .. ' & echo $! > ' .. tail_pid
        vim.uv.fs_open(fifopipe, 'w', -1, vim.schedule_wrap(function(err, fd)
            if err then
                error(err)
            end
            output_pipe = vim.uv.new_pipe(false)
            output_pipe:open(fd)
            handle_contents()
        end))
    end

    vim.fn['fzf#run'](vim.fn['fzf#wrap'](spec))

    vim.env.FZF_DEFAULT_COMMAND = old_fzf_cmd
end

---Get fzf options
---@param from_resume boolean? Whether the finder is called by fzf resume
---@param extra_opts table? Extra options
local function get_fzf_opts(from_resume, extra_opts)
    extra_opts = extra_opts or {}
    local common_opts = {
        '--ansi',
        '--multi',
        '--bind',
        -- Cache the query for fzf resume
        'result:execute-silent(echo {q} > ' .. cached_fzf_query .. ')',
    }
    -- When the finder is called by fzf resume, use the fzf's start event to fetch the cached query
    if from_resume then
        common_opts = vim.list_extend(common_opts, {
            '--bind',
            'start:transform-query:cat ' .. cached_fzf_query,
        })
    end
    return vim.list_extend(common_opts, extra_opts)
end

local function shortpath(path)
    local short = vim.fn.fnamemodify(path, ':~:.')
    short = vim.fn.pathshorten(short)
    return short == '' and '~/' or (short:match('/$') and short or short .. '/')
end

---@param extra_keys table? Extra keys for --expect
---@param with_defaults boolean? Whether include the default keys, i.e., ctrl-x, ctrl-v and ctrl-t
local function get_expect(extra_keys, with_defaults)
    extra_keys = extra_keys or {}
    if with_defaults == nil then
        with_defaults = true
    end
    local extra = table.concat(extra_keys, ',')
    return with_defaults and ('ctrl-x,ctrl-v,ctrl-t,' .. extra) or extra
end

---@param label string The label or a shell command to generate the label
local function set_preview_label(label)
    return string.format('focus:transform-preview-label:echo [ %s ]', label)
end

-- Helper function for sink* to handle selected files
-- ENTER/CTRL-X/CTRL-V/CTRL-T to open files
---@param lines table The first item is the key; others are filenames.
local function sink_file(lines)
    local key = lines[1]
    local cmd = vim.g.fzf_action[key] or 'edit'
    for i = 2, #lines do
        -- Do nothing if it's the current file
        -- if vim.fn.fnamemodify(lines[i], ':p') ~= vim.fn.expand('%:p') then
        -- end
        vim.cmd(cmd .. ' ' .. lines[i])
    end
end

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

    fzf(spec, nil, fd_cmd)
end

vim.keymap.set('n', '<leader>l', function()
    run(files)
end)
-- Close the pipe and kill tail process to terminate fzf's "loading" indicator
local function finish()
    system.async({ 'bash', '-c', 'kill -9 $(<' .. tail_pid .. ')' }, {}, nil, system_on_error)
    output_pipe:close()
    output_pipe = nil
end

---Write fzf entries to the pipe
---@param entries table Fzf entries
---@param multiline boolean? Whether each entry is a multiline item
local function write(entries, multiline)
    output_pipe:write(vim.tbl_map(function(x)
            return not multiline and x .. '\n' or x
    end, entries), function()
        finish()
    end)
end


-- Buffers
local function buffers(from_resume)
    local spec = {
        ['sink*'] = function(lines)
            local key = lines[1]
            if key == 'alt-bs' then
                -- ALT-BS to delete selected buffers
                for i = 2, #lines do
                    local bufnr = tonumber(string.match(lines[i], '%[(%d+)%]'))
                    require('rockyz.utils.buf_utils').bufdelete({ bufnr = bufnr, wipe = true })
                end
            else
                -- ENTER with only a single selection: switch to the buffer
                -- CTRL-X/V/T supports multiple selections
                if key == '' and #lines ~= 2 then
                    return
                end
                local action = vim.g.fzf_action[key]
                action = action and action .. ' | buffer ' or 'buffer '
                for i = 2, #lines do
                    local bufnr = string.match(lines[i], '%[(%d+)%]')
                    vim.cmd(action .. bufnr)
                end
            end
        end,
        options = get_fzf_opts(from_resume, {
            '--multi',
            '--header-lines',
            '1',
            '--with-nth',
            '3..',
            '--prompt',
            'Buffers> ',
            -- '--header',
            -- ':: ALT-BS (delete buffers)',
            '--expect',
            get_expect({'alt-bs'}),
            '--bind',
            set_preview_label('{3..}'),
        }),
    }

    local function handle_contents()
        local buflist = vim.api.nvim_list_bufs()
        local max_bufnr = 0
        local bufinfos = vim.iter(buflist):map(function(b)
            if vim.api.nvim_buf_is_valid(b) and vim.fn.buflisted(b) == 1 and vim.bo[b].filetype ~= 'qf' then
                max_bufnr = b > max_bufnr and b or max_bufnr
                return vim.fn.getbufinfo(b)[1]
            end
        end):totable()

        table.sort(bufinfos, function(a, b)
            return a.lastused > b.lastused
        end)

        local hls = {
            bufnr = 'Number',
            lnum = 'FzfLnum',
            col = 'FzfCol',
        }

        local max_bufnr_width = #ansi_string('', hls.bufnr) + #tostring(max_bufnr) + 2

        local entries = {}
        for _, bufinfo in ipairs(bufinfos) do
            local bufnr = bufinfo.bufnr
            local fullname = bufinfo.name
            local icon = '' -- ansi_devicon(fullname)
            local dispname = #fullname == 0 and '[No Name]' or vim.fn.fnamemodify(fullname, ':~:.')
            local current_buf = vim.api.nvim_get_current_buf()
            local alternate_buf = vim.fn.bufnr('#')
            local lnum = bufinfo.lnum
            local flags = {
                bufnr == current_buf and '%' or (bufnr == alternate_buf and '#' or ''),
                bufinfo.hidden == 1 and 'h' or 'a',
                vim.bo[bufnr].readonly and '=' or (vim.bo[bufnr].modifiable and '' or '-'),
                bufinfo.changed == 1 and '+' or '',
            }
            -- Entry: <fullname> <lnum> <[bufnr]> <flags> <bufname>:<lnum>
            -- {3..} will be presented.
            local entry = string.format(
                '%s %s %-' .. max_bufnr_width .. 's %3s %s %s:%s',
                #fullname == 0 and 'No_Name' or fullname,
                lnum,
                '[' .. ansi_string(bufnr, hls.bufnr) .. ']',
                table.concat(flags, ''),
                icon,
                dispname,
                ansi_string(tostring(lnum), hls.lnum)
            )
            table.insert(entries, entry)
        end
        write(entries)
    end

    fzf(spec, handle_contents)
end

vim.keymap.set('n', '<leader>b', function()
    run(buffers)
end)

local rg_prefix = 'rg --column --line-number --no-heading --color=always --smart-case --with-filename'
-- Use bat to preview text file
local bat_prefix = 'bat --color=always --paging=never --style=numbers'

---Generate the fzf options for rg and fzf integration
---@param rg string The final rg command
---@param rg_query string The initial query for rg
---@param path string File or directory for rg to search
---@param prompt string Fzf prompt string
---@param extra_opts table? Extra fzf options
---@param from_resume boolean? Whether or not the finder is called from fzf resume
---@return table Fzf options for live grep
local function get_fzf_opts_for_live_grep(rg, rg_query, path, prompt, extra_opts, from_resume)
    extra_opts = extra_opts or {}
    if not from_resume then
        cached_rg_query = vim.fn.tempname()
        cached_fzf_query = vim.fn.tempname()
        fzf_mode_enabled = vim.fn.tempname() -- tempfile to record whether it is currently in fzf mode
    end
    local is_fzf_mode = vim.uv.fs_stat(fzf_mode_enabled)
    local mode = is_fzf_mode and 'FZF' or 'RG'
    local search_enabled = is_fzf_mode and true or false
    -- Initial rg query
    if from_resume and vim.uv.fs_stat(cached_rg_query) then
        rg_query = '"$(cat ' .. cached_rg_query .. ')"'
    else
        rg_query = vim.fn.shellescape(rg_query)
    end
    -- Initial fzf query
    local set_query = ''
    if from_resume then
        set_query = string.format(
            '+transform-query(cat %s)',
            is_fzf_mode and cached_fzf_query or cached_rg_query
        )
    end
    -- Unbind the change event if it is called by fzf resume and rg's initial mode is fzf mode
    local unbind_change = ''
    if from_resume and is_fzf_mode then
        unbind_change = '+unbind(change)'
    end
    -- Print quickfix title used in winbar of quickfix window
    -- E.g., "Live Grep: Rg Query foo | Fzf Query bar"
    local print_qf_title = 'transform(rg_query=$(cat ' .. cached_rg_query .. '); rg_query=${rg_query:-[empty]}; fzf_query=$(cat ' .. cached_fzf_query .. '); fzf_query=${fzf_query:-[empty]}; echo "print(' .. prompt .. ': Rg Query $rg_query | Fzf Query $fzf_query)")'

    local opts =  {
        '--ansi',
        '--multi',
        '--prompt',
        string.format('%s [%s]> ', prompt, mode),
        '--bind',
        'start:reload(' .. rg .. ' ' .. rg_query .. ' ' .. path .. ')' .. set_query .. unbind_change,
        '--bind',
        'change:reload:' .. rg .. ' {q} ' .. path .. ' || true',
        '--bind',
        -- Cache the query into the specific tempfile based on the current mode
        'result:execute-silent([[ ! -e ' .. fzf_mode_enabled .. ' ]] && echo {q} > ' .. cached_rg_query .. ' || echo {q} > ' .. cached_fzf_query .. ')',
        '--bind',
        'alt-f:transform:\
        [[ ! -e ' .. fzf_mode_enabled .. ' ]] && { \
            touch ' .. fzf_mode_enabled .. '; \
            echo "unbind(change)+change-prompt(' .. prompt .. ' [FZF]> )+enable-search+transform-query(cat ' .. cached_fzf_query .. ')"; \
        } || { \
            rm ' .. fzf_mode_enabled .. '; \
            echo "change-prompt(' .. prompt .. ' [RG]> )+disable-search+reload(' .. rg .. ' {q} || true)+rebind(change)+transform-query(cat ' .. cached_rg_query .. ')"\
        }',
        '--bind',
        set_preview_label('$(echo {1} | sed "s|$HOME|~|"):{2}:{3}'),
        '--delimiter',
        ':',
        '--header',
        ':: ALT-F (toggle FZF mode and RG mode), CTRL-Q (send to quickfix), CTRL-L (send to loclist)',
        '--bind',
        'enter:print()+accept,ctrl-x:print(ctrl-x)+accept,ctrl-v:print(ctrl-v)+accept,ctrl-t:print(ctrl-t)+accept',
        '--bind',
        'ctrl-l:print(ctrl-l)+' .. print_qf_title .. '+accept',
        '--bind',
        'ctrl-q:print(ctrl-q)+' .. print_qf_title .. '+accept',
        '--preview-window',
        'down,45%,+{2}-/2',
        '--preview',
        bat_prefix .. ' --highlight-line {2} -- {1}',
    }

    if not search_enabled then
        table.insert(opts, '--disabled')
    end
    return vim.list_extend(opts, extra_opts)
end

---sink* for live grep
---ENTER/CTRL-X/CTRL-V/CTRL-T to open files and set cursor position
---CTRL-Q/CTRL-L to send selections to quickfix or location list
---@param lines table lines[1] is the query used as the title when sent to qf. For CTRL-Q/CTRL-L,
---lines[2] is the title for quickfix or loclist and lines[3..] are selected lines. For other keys,
---lines[2..] are selected lines.
local function sink_grep(lines)
    local key = lines[1]
    if key == 'ctrl-q' then
        grep_sel_to_qf(lines)
    elseif key == 'ctrl-l' then
        grep_sel_to_qf(lines, true)
    else
        for i = 2, #lines do
            local filename, lnum, col = lines[i]:match('^([^:]+):([^:]+):([^:]+):.*$')
            local cmd = vim.g.fzf_action[key] or 'edit'
            -- if vim.fn.fnamemodify(lines[i], ':p') ~= vim.fn.expand('%:p') then
            -- end
            vim.cmd(cmd .. ' ' .. filename)
            vim.api.nvim_win_set_cursor(0, { tonumber(lnum), tonumber(col) - 1 })
        end
    end
end
-- Live grep
local function live_grep(from_resume)
    local rg_cmd = rg_prefix .. ' --'
    local spec = {
        ['sink*'] = sink_grep,
        options = get_fzf_opts_for_live_grep(rg_cmd, '', '', 'Live Grep', {}, from_resume)
    }
    fzf(spec, nil, rg_cmd)
end

local function listPackageJson(from_resume)
    -- local rg_cmd = rg_prefix .. ' --'
    local spec = {
        -- ['source'] = "package.json",

        ['sink*'] = sink_file,
        options = get_fzf_opts(from_resume, {
            '--prompt',
            shortpath(vim.uv.cwd()),
            '--expect',
            get_expect(),
        }),
        -- options = get_fzf_opts_for_live_grep(rg_cmd, '', '', 'Live Grep', {}, from_resume)
    }
    fzf(spec, nil, 'fd package.json')
end
vim.keymap.set('n', '<Leader>i', function()
    run(live_grep)
end)

vim.keymap.set('n', '<F10>', function()
    run(listPackageJson)
end)
vim.keymap.set({'n', 'v'}, 'z', 'za', {noremap = true, silent = true})

