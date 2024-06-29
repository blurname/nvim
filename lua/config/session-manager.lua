-- local Path = require('plenary.path')
-- local config = require('session_manager.config')
-- require('session_manager').setup({
--   sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'), -- The directory where the session files will be saved.
--   session_filename_to_dir = session_filename_to_dir, -- Function that replaces symbols into separators and colons to transform filename into a session directory.
--   dir_to_session_filename = dir_to_session_filename, -- Function that replaces separators and colons into special symbols to transform session directory into a filename. Should use `vim.uv.cwd()` if the passed `dir` is `nil`.
--   autoload_mode = config.AutoloadMode.LastSession, -- Define what to do when Neovim is started without arguments. See "Autoload mode" section below.
--   autosave_last_session = true, -- Automatically save last session on exit and on session switch.
--   autosave_ignore_not_normal = true, -- Plugin will not save a session when no buffers are opened, or all of them aren't writable or listed.
--   autosave_ignore_dirs = {}, -- A list of directories where the session will not be autosaved.
--   autosave_ignore_filetypes = { -- All buffers of these file types will be closed before the session is saved.
--     'gitcommit',
--     'gitrebase',
--   },
--   autosave_ignore_buftypes = {}, -- All buffers of these bufer types will be closed before the session is saved.
--   autosave_only_in_session = false, -- Always autosaves session. If true, only autosaves after a session is active.
--   max_path_length = 80,  -- Shorten the display path if length exceeds this threshold. Use 0 if don't want to shorten the path at all.
-- })
--
--
-- require("auto-session").setup {
--   log_level = "error",
--
--   cwd_change_handling = {
--     restore_upcoming_session = true, -- already the default, no need to specify like this, only here as an example
--     pre_cwd_changed_hook = nil, -- already the default, no need to specify like this, only here as an example
--     post_cwd_changed_hook = function() -- example refreshing the lualine status line _after_ the cwd changes
--       require("lualine").refresh() -- refresh lualine so the new session name is displayed in the status bar
--     end,
--   },
-- }
--
--
--
require('possession').setup {
    -- sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'), -- The directory where the session files will be saved.
    silent = false,
    load_silent = true,
    debug = false,
    logfile = false,
    prompt_no_cr = false,
    autosave = {
        current = true,  -- or fun(name): boolean
        cwd = true, -- or fun(): boolean
        tmp = true,  -- or fun(): boolean
        tmp_name = 'tmp', -- or fun(): string
        on_load = true,
        on_quit = true,
    },
    autoload = 'last', -- or 'last' or 'auto_cwd' or 'last_cwd' or fun(): string
    commands = {
        save = 'PossessionSave',
        load = 'PossessionLoad',
        save_cwd = 'PossessionSaveCwd',
        load_cwd = 'PossessionLoadCwd',
        rename = 'PossessionRename',
        close = 'PossessionClose',
        delete = 'PossessionDelete',
        show = 'PossessionShow',
        list = 'PossessionList',
        list_cwd = 'PossessionListCwd',
        migrate = 'PossessionMigrate',
    },
    hooks = {
        before_save = function(name) return {} end,
        after_save = function(name, user_data, aborted) end,
        before_load = function(name, user_data) return user_data end,
        after_load = function(name, user_data) end,
    },
    plugins = {
        close_windows = {
            hooks = {'before_save', 'before_load'},
            preserve_layout = true,  -- or fun(win): boolean
            match = {
                floating = true,
                buftype = {},
                filetype = {},
                custom = false,  -- or fun(win): boolean
            },
        },
        delete_hidden_buffers = {
            hooks = {
                'before_load',
                vim.o.sessionoptions:match('buffer') and 'before_save',
            },
            force = false,  -- or fun(buf): boolean
        },
        nvim_tree = false,
        neo_tree = false,
        symbols_outline = false,
        outline = false,
        tabby = false,
        dap = false,
        dapui = false,
        neotest = false,
        delete_buffers = false,
    },
}
