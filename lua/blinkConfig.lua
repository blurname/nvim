require('blink.cmp').setup({
    -- NOTE:
    -- keymaps for snippet jumping forward and backward are defined in luasnip config
    keymap = {
        preset = 'none',
        ['<C-Enter>'] = { 'show', 'show_documentation', 'hide_documentation', 'fallback' },
        ['<C-e>'] = { 'cancel', 'fallback' },
        ['<C-\\>'] = { 'hide', 'fallback' },
        ['<CR>'] = { 'select_and_accept', 'fallback' },

        -- ['<Tab>'] = { 'select_next', 'show', 'fallback' },
        -- ['<S-Tab>'] = { 'select_prev', 'fallback' },

        ['<c-j>'] = { 'select_next', 'show', 'fallback' },
        ['<c-k>'] = { 'select_prev', 'fallback' },

        ['<a-k>'] = { 'scroll_documentation_up', 'fallback' },
        ['<a-j>'] = { 'scroll_documentation_down', 'fallback' },
        ['<C-space>'] = { function(cmp) cmp.show() end },
        -- ['Enter'] = {'select_and_accept','fallback'} 
    },
    sources = {
        default = { 'lsp', 'snippets', 'buffer', 'path' },
        providers = {
            -- lsp = {
            --     -- By default it fallbacks to 'buffer'. It means buffer items will only be listed
            --     -- when lsp returns 0 items. Remove 'buffer' from the fallbacks to make buffer items
            --     -- be always listed.
            --     fallbacks = {},
            -- },
            -- buffer = {
            --     min_keyword_length = 4,
            -- },
        },
    },
    -- snippets = {
    --     preset = 'luasnip',
    -- },
    completion = {
        list = {
            selection = {
                preselect = true,
                auto_insert = true,
            },
        },
        accept = {
            auto_brackets = {
                enabled = true,
            },
        },
        menu = {
            border = vim.g.border_style,
            draw = {
                columns = {
                    { 'kind_icon' },
                    { 'label', 'label_description', gap = 1 },
                },
            },
        },
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 0,
            update_delay_ms = 50,
            window = {
                border = vim.g.border_style,
                max_height = math.floor(vim.o.lines * 0.5),
                max_width = math.floor(vim.o.columns * 0.4),
            },
        },
        ghost_text = {
            enabled = false,
        },
    },
    fuzzy = {
        max_typos = function()
            return 0
        end,
    },
    -- appearance = {
    --     kind_icons = kind_icons,
    -- },

    -- Command line
    cmdline = {
        enabled = true,
        completion = {
            menu = {
                auto_show = function(_)
                    local cmdtype = vim.fn.getcmdtype()
                    return cmdtype == ':' or cmdtype == '/' or cmdtype == '?'
                end,
            },
            list = {
                selection = {
                    preselect = false,
                    auto_insert = true,
                },
            },
        },
        keymap = {
            preset = 'none',
            ['<Tab>'] = {
                function(cmp)
                    if cmp.is_visible() then
                        cmp.select_next()
                    else
                        cmp.show()
                    end
                end
            },
            ['<M-Tab>'] = {
                function(cmp)
                    if cmp.is_visible() then
                        cmp.select_prev()
                    else
                        cmp.show()
                    end
                end
            },
        },
    },
})
