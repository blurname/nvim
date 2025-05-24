local LspUI = require("LspUI")
local lsp_ui_config = require("LspUI.config")
local default_transparency = 100

--- @type LspUI_rename_config
local default_rename_config = {
	enable = true,
	command_enable = true,
	auto_select = true,
	key_binding = {
		exec = "<CR>",
		quit = "<ESC>",
	},
        -- transparency = default_transparency,
}

--- @type LspUI_lightbulb_config
local default_lightbulb_config = {
	enable = true,
	-- whether cache code action, if do, code action will use lightbulb's cache
	-- Sadly, currently this option is invalid, I haven't implemented caching yet
	is_cached = true,
	icon = "💡",
	-- defalt is 250 milliseconds, this will reduce calculations when you move the cursor frequently, but it will cause the delay of lightbulb, false will disable it
	debounce = 250, 
}

--- @type LspUI_code_action_config
local default_code_action_config = {
	enable = true,
	command_enable = true,
	gitsigns = false, -- this will support gitsigns code actions, if you install gitsigns
	-- keybind support number keybind emmit code action
	key_binding = {
		exec = "<cr>",
		prev = "k",
		next = "j",
		quit = "<ESC>",
	},
        -- transparency = default_transparency,
}

--- @type LspUI_diagnostic_config
local default_diagnostic_config = {
    enable = false,
    command_enable = false,
        transparency = default_transparency,
}

--- @type LspUI_hover_config
local default_hover_config = {
  enable = true,
  command_enable = true,
	-- these keybind only works when there are multiple hovers
	key_binding = {
		prev = "p",
		next = "n",
		quit = "q",
	},
        -- transparency = default_transparency,
}

--- @type LspUI_inlay_hint_config
local default_inlay_hint_config = {
    enable = false,
    command_enable = false,
    filter = {
        whitelist = {},
        blacklist = {},
    },
}

-- for definition, type_definition, declaration, implementation, reference
-- we define two windows, call left is main view, right is secondary view

--- @type LspUI_definition_config
local default_definition_config = {
    enable = false,
    command_enable = false,
}

--- @type LspUI_type_definition_config
local default_type_definition_config = {
    enable = false,
    command_enable = false,
}

--- @type LspUI_declaration_config
local default_declaration_config = {
    enable = false,
    command_enable = false,
}

--- @type LspUI_implementation_config
local default_implementation_config = {
    enable = false,
    command_enable = false,
}

--- @type LspUI_reference_config
local default_reference_config = {
    enable = false,
    command_enable = false,
}

--- @type LspUI_pos_keybind_config
-- keybind for definition, type definition, reference, declaration, implemantation
local default_pos_keybind_config = {
    main = {
        back = "<leader>l",
        hide_secondary = "<leader>h",
    },
    secondary = {
        jump = "o",
        jump_split = "sh",
        jump_vsplit = "sv",
        jump_tab = "t",
        toggle_fold = "<Cr>",
        next_entry = "J",
        prev_entry = "K",
        quit = "q",
        hide_main = "<leader>h",
        fold_all = "w",
        expand_all = "e",
        enter = "<leader>l",
    },
    transparency = default_transparency,
}

--- @type LspUI_signature
local default_signature_config = {
    enable = false, -- default is disabled
    icon = "✨", -- icon for
    color = { -- color for virtual text 
        fg = "#FF8C00",
        bg = nil,
    },
    debounce = 300, -- debounce delay time
}

-- default config
--- @type LspUI_config
local default_config = {
    rename = default_rename_config,
    lightbulb = default_lightbulb_config,
    code_action = default_code_action_config,
    diagnostic = default_diagnostic_config,
    hover = default_hover_config,
    inlay_hint = default_inlay_hint_config,
    definition = default_definition_config,
    type_definition = default_type_definition_config,
    declaration = default_declaration_config,
    implementation = default_implementation_config,
    reference = default_reference_config,
    pos_keybind = default_pos_keybind_config,
    signature = default_signature_config,
}
LspUI.setup(default_config)
