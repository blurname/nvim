--
-- Inspired by Vercel Light theme
-- Author: Based on arctic.lua structure with Vercel light colors
--
-- References:
-- 1. Scope naming: https://www.sublimetext.com/docs/scope_naming.html
-- 2. VSCode theme color: https://code.visualstudio.com/api/references/theme-color
-- 3. Vercel light theme colors
--

local utils = require('util.color')

-- Vercel light theme color palette
local red = '#c62128'
local dark_red = '#b32c62'
local orange = '#9e5200'
local brown = '#397c3b'
local yellow = '#9e5200'
local yellow_orange = '#9e5200'
local green = '#397c3b'
local blue_green = '#027d70'
local blue = '#005ee9'
local light_blue = '#005ee9'
local dark_blue = '#005ee9'
local dark_pink = '#7200c4'

local gray = '#a8a8a8' -- StatuslineNC's fg
local gray2 = '#a8a8a8' -- LineNr
local gray3 = '#666666'

local white = '#ffffff' -- Editor background
local light_gray = '#fafafa' -- Activity bar, sidebar background
local light_gray2 = '#ebebeb' -- Borders
local light_gray3 = '#cccccc' -- Secondary borders

local black = '#171717' -- Primary text
local black2 = '#666666' -- Secondary text

-- local cursorLineColor = '#F3F5F9'
local cursorLineColor = '#dfdfdf'

local norm_fg = '#171717' -- Main foreground
-- local norm_bg = '#EFEFEF' -- Main background
local norm_bg = '#FFFFFF' -- Main background

-- Signs for git in signcolumn
local gutter_git_added = '#397c3b'
local gutter_git_deleted = '#b32c62'
local gutter_git_modified = '#9e5200'

-- Undercurl for diagnostics
local error_red = '#c62128'
local warn_yellow = '#9e5200'
local info_blue = '#005ee9'
local hint_gray = '#666666'
local ok_green = '#397c3b'

local error_list = '#b32c62'
local warn_list = '#9e5200'

local hint_virtualtext_bg = '#f5f5f5'

local selected_item_bg = '#f0f0f0' -- Light selection background
local matched_chars = '#005ee9' -- Matched characters in autocomplete
local folded_line_bg = '#f5f5f5' -- Fold background
local floatwin_border = '#cccccc' -- Floating window border
local scrollbar = '#cccccc'
local indent_guide_fg = '#ebebeb'
local indent_guide_scope_fg = '#cccccc'
local win_separator = '#ebebeb'
local icon_fg = '#666666'
local directory = dark_blue
local winbar_fg = '#666666'

-- Tabline
local tab_bg = light_gray -- Tab background
local tab_active_fg = black -- Active tab foreground
local tab_active_bg = white -- Active tab background
local tab_inactive_fg = black2 -- Inactive tab foreground
local tab_inactive_bg = light_gray -- Inactive tab background
local tab_indicator_active_fg = '#171717'
local tab_indicator_inactive_fg = utils.darken(tab_active_bg, 0.1)

-- Statusline
local stl_fg = black2 -- statusBar.foreground
local stl_bg = light_gray -- statusBar.background
local stl_normal = '#005ee9'
local stl_insert = '#9e5200'
local stl_visual = '#7200c4'
local stl_replace = '#b32c62'
local stl_command = '#397c3b'
local stl_terminal = '#027d70'
local stl_pending = '#c62128'
local stl_inactive = '#a8a8a8'
local stl_on = '#397c3b'
local stl_off = '#c62128'

-- Colors used in quickfix and fzf finders
local filename = dark_pink
local lnum = '#397c3b'
local col = '#005ee9'

local groups = {

    --
    -- Preset
    --

    FloatBorder = { fg = floatwin_border },
    ScrollbarSlider = { bg = scrollbar },
    ScrollbarGutter = { bg = norm_bg },
    SelectionHighlightBackground = { bg = selected_item_bg },
    LightBulb = { fg = '#9e5200' },
    CodeLens = { fg = '#666666' },
    GutterGitAdded = { fg = gutter_git_added },
    GutterGitDeleted = { fg = gutter_git_deleted },
    GutterGitModified = { fg = gutter_git_modified },
    Breadcrumb = { fg = winbar_fg, bg = norm_bg, bold = true },
    BreadcrumbNC = { fg = winbar_fg, bg = norm_bg },
    ScrollbarSliderHover = { bg = '#999999' },
    PeekViewBorder = { fg = '#005ee9' },
    PeekViewNormal = { bg = norm_bg },
    PeekViewTitle = { fg = black },
    PeekViewCursorLine = 'CursorLine',
    PeekViewMatchHighlight = { bg = '#f5e6d3' },
    GhostText = { fg = '#999999' },
    Icon = { fg = icon_fg },
    Description = { fg = black2 },
    ProgressBar = { fg = '#171717' },
    MatchedCharacters = { fg = matched_chars },
    Hint = 'MatchedCharacters',
    -- Git diff
    DiffLineAdded = { bg = '#e6f7e6' },
    DiffLineDeleted = { bg = '#ffeaea' },
    DiffLineChanged = { bg = '#f5e6d3' },
    DiffTextAdded = { bg = '#d4f4d4' },
    DiffTextDeleted = { bg = '#ffd6d6' },
    DiffTextChanged = { bg = '#f0d9b3' },
    -- Quickfix list
    QfSelection = { bg = selected_item_bg, bold = true },
    -- Inline hints
    InlayHint = { fg = '#666666', bg = hint_virtualtext_bg },
    InlayHintType = 'InlayHint',
    -- Winbar
    WinbarHeader = { fg = white, bg = stl_normal },
    WinbarTriangleSep = { fg = stl_normal },
    WinbarPath = { fg = icon_fg, bg = norm_bg, italic = true },
    WinbarFilename = { fg = winbar_fg, bg = norm_bg },
    WinbarModified = { fg = norm_fg, bg = norm_bg },
    WinbarError = { fg = error_list, bg = norm_bg },
    WinbarWarn = { fg = warn_list, bg = norm_bg },
    WinbarQuickfixTitle = { fg = orange },
    -- Tabline
    TabDefaultIcon = { fg = icon_fg, bg = tab_inactive_bg },
    TabDefaultIconActive = { fg = icon_fg, bg = tab_active_bg },
    TabError = { fg = error_list, bg = tab_inactive_bg },
    TabErrorActive = { fg = error_list, bg = tab_active_bg },
    TabWarn = { fg = warn_list, bg = tab_inactive_bg },
    TabWarnActive = { fg = warn_list, bg = tab_active_bg },
    TabIndicatorActive = { fg = tab_indicator_active_fg, bg = tab_active_bg },
    TabIndicatorInactive = { fg = tab_indicator_inactive_fg, bg = tab_inactive_bg },
    -- Indent scope
    IndentScopeSymbol = 'Delimiter',

    --
    -- diff
    --

    diffAdded = 'GutterGitAdded',
    diffRemoved = 'GutterGitDeleted',
    diffChanged = 'GutterGitModified',

    --
    -- LSP
    --

    LspReferenceText = 'SelectionHighlightBackground',
    LspReferenceRead = 'SelectionHighlightBackground',
    LspReferenceWrite = 'SelectionHighlightBackground',
    LspCodeLens = 'CodeLens',
    LspSignatureActiveParameter = { fg = matched_chars, bg = selected_item_bg, underline = true, bold = true },
    LspInlayHint = 'InlayHint',

    --
    -- Diagnostics
    --

    DiagnosticError = { fg = error_red },
    DiagnosticWarn = { fg = warn_yellow },
    DiagnosticInfo = { fg = info_blue },
    DiagnosticHint = { fg = hint_gray },
    DiagnosticOk = { fg = ok_green },
    DiagnosticVirtualTextError = { fg = error_red, bg = '#ffeaea', italic = true },
    DiagnosticVirtualTextWarn = { fg = warn_yellow, bg = '#f5e6d3', italic = true },
    DiagnosticVirtualTextInfo = { fg = info_blue, bg = '#e6f3ff', italic = true },
    DiagnosticVirtualTextHint = { fg = hint_gray, bg = hint_virtualtext_bg, italic = true },
    DiagnosticVirtualTextOk = { fg = ok_green, bg = '#e6f7e6', italic = true },
    DiagnosticVirtualLinesError = 'DiagnosticVirtualTextError',
    DiagnosticVirtualLinesWarn = 'DiagnosticVirtualTextWarn',
    DiagnosticVirtualLinesInfo = 'DiagnosticVirtualTextInfo',
    DiagnosticVirtualLinesHint = 'DiagnosticVirtualTextHint',
    DiagnosticVirtualLinesOk = 'DiagnosticVirtualTextOk',
    DiagnosticUnderlineError = { undercurl = true, sp = error_red },
    DiagnosticUnderlineWarn = { undercurl = true, sp = warn_yellow },
    DiagnosticUnderlineInfo = { undercurl = true, sp = info_blue },
    DiagnosticUnderlineHint = { undercurl = true, sp = hint_gray },
    DiagnosticUnderlineOk = { undercurl = true, sp = ok_green },
    DiagnosticFloatingError = 'DiagnosticError',
    DiagnosticFloatingWarn = 'DiagnosticWarn',
    DiagnosticFloatingInfo = 'DiagnosticInfo',
    DiagnosticFloatingHint = 'DiagnosticHint',
    DiagnosticFloatingOk = 'DiagnosticOk',
    DiagnosticSignError = 'DiagnosticError',
    DiagnosticSignWarn = 'DiagnosticWarn',
    DiagnosticSignInfo = 'DiagnosticInfo',
    DiagnosticSignHint = 'DiagnosticHint',
    DiagnosticSignOk = 'DiagnosticOk',
    DiagnosticUnnecessary = {},
    DiagnosticDeprecated = { fg = gray3, strikethrough = true },

    --
    -- Symbol kinds
    --

    SymbolKindText = { fg = norm_fg, bg = 'NONE' },
    SymbolKindMethod = { fg = '#7200c4', bg = 'NONE' },
    SymbolKindFunction = 'SymbolKindMethod',
    SymbolKindConstructor = 'SymbolKindMethod',
    SymbolKindField = { fg = '#005ee9', bg = 'NONE' },
    SymbolKindVariable = 'SymbolKindField',
    SymbolKindClass = { fg = '#9e5200', bg = 'NONE' },
    SymbolKindInterface = 'SymbolKindField',
    SymbolKindModule = 'SymbolKindText',
    SymbolKindProperty = 'SymbolKindText',
    SymbolKindUnit = 'SymbolKindText',
    SymbolKindValue = 'SymbolKindText',
    SymbolKindEnum = 'SymbolKindClass',
    SymbolKindKeyword = 'SymbolKindText',
    SymbolKindSnippet = 'SymbolKindText',
    SymbolKindColor = 'SymbolKindText',
    SymbolKindFile = 'SymbolKindText',
    SymbolKindReference = 'SymbolKindText',
    SymbolKindFolder = 'SymbolKindText',
    SymbolKindEnumMember = 'SymbolKindField',
    SymbolKindConstant = 'SymbolKindText',
    SymbolKindStruct = 'SymbolKindText',
    SymbolKindEvent = 'SymbolKindClass',
    SymbolKindOperator = 'SymbolKindText',
    SymbolKindTypeParameter = 'SymbolKindText',
    -- Other kinds from VSCode's symbolIcon.*
    SymbolKindArray = 'SymbolKindText',
    SymbolKindBoolean = 'SymbolKindText',
    SymbolKindKey = 'SymbolKindText',
    SymbolKindNamespace = 'SymbolKindText',
    SymbolKindString = 'SymbolKindText',
    SymbolKindNull = 'SymbolKindText',
    SymbolKindNumber = 'SymbolKindText',
    SymbolKindObject = 'SymbolKindText',
    SymbolKindPackage = 'SymbolKindText',

    --
    -- Editor
    --

    -- CursorLine = { bg = '#E8F3FF' },
    CursorLine = { bg = cursorLineColor }, -- 当前行颜色
    CursorColumn = 'CursorLine',
    ColorColumn = { bg = '#ebebeb' },
    Conceal = { fg = gray2 },
    Cursor = { fg = red, bg = red },
    CurSearch = { fg = norm_bg, bg = '#9e5200' },
    Directory = { fg = directory },
    DiffAdd = 'DiffLineAdded',
    DiffDelete = 'DiffLineDeleted',
    DiffChange = 'DiffLineChanged',
    DiffText = 'DiffTextChanged',
    EndOfBuffer = { fg = norm_bg },
    TermCursor = { fg = cursorLineColor, bg = '#9e5200' },
    ErrorMsg = { fg = error_red },
    WinSeparator = { fg = win_separator },
    VirtSplit = 'WinSeparator',
    LineNr = { fg = gray2 },
    CursorLineNr = { fg = '#666666', bold = true },
    Folded = { bg = folded_line_bg },
    CursorLineFold = 'CursorLineNr',
    FoldColumn = 'LineNr',
    SignColumn = 'LineNr',
    IncSearch = 'CurSearch',
    MatchParen = { fg = norm_fg, bg = '#005ee9', bold = true, underline = true },
    ModeMsg = { fg = norm_fg },
    MsgArea = { fg = norm_fg },
    MoreMsg = { fg = norm_fg },
    NonText = { fg = gray2 },
    Normal = { fg = norm_fg, bg = norm_bg },
    NormalNC = {  fg = norm_fg, bg = norm_bg },
    Pmenu = { fg = norm_fg, bg = light_gray },
    PmenuSel = { fg = black, bg = selected_item_bg, bold = true },
    PmenuSbar = 'ScrollbarGutter',
    PmenuThumb = 'ScrollbarSlider',
    PmenuMatch = { fg = matched_chars, bg = light_gray, bold = true },
    PmenuMatchSel = { fg = matched_chars, bg = selected_item_bg, bold = true },
    NormalFloat = 'Pmenu',
    Question = { fg = warn_yellow },
    QuickFixLine = 'QfSelection',
    Search = { fg = norm_fg, bg = '#f5e6d3' },
    SpecialKey = 'NonText',
    SpellBad = { undercurl = true, sp = error_red },
    SpellCap = { undercurl = true, sp = warn_yellow },
    SpellLocal = { undercurl = true, sp = info_blue },
    SpellRare = { undercurl = true, sp = info_blue },
    StatusLine = { bg = stl_bg },
    TabLine = { fg = tab_inactive_fg, bg = tab_inactive_bg },
    TabLineFill = { fg = 'NONE', bg = tab_bg },
    TabLineSel = { fg = tab_active_fg, bg = tab_active_bg, bold = true },
    Title = { fg = dark_blue, bold = true },
    Visual = { bg = cursorLineColor },
    WarningMsg = { fg = warn_yellow },
    Whitespace = { fg = indent_guide_fg },
    WildMenu = 'PmenuSel',
    Winbar = 'Breadcrumb',
    WinbarNC = 'BreadcrumbNC',

    --
    -- Statusline
    --

    StlModeNormal = { fg = white, bg = stl_normal },
    StlModeInsert = { fg = white, bg = stl_insert },
    StlModeVisual = { fg = white, bg = stl_visual },
    StlModeReplace = { fg = white, bg = stl_replace },
    StlModeCommand = { fg = white, bg = stl_command },
    StlModeTerminal = { fg = white, bg = stl_terminal },
    StlModePending = { fg = white, bg = stl_pending },

    StlModeSepNormal = { fg = stl_normal, bg = stl_bg },
    StlModeSepInsert = { fg = stl_insert, bg = stl_bg },
    StlModeSepVisual = { fg = stl_visual, bg = stl_bg },
    StlModeSepReplace = { fg = stl_replace, bg = stl_bg },
    StlModeSepCommand = { fg = stl_command, bg = stl_bg },
    StlModeSepTerminal = { fg = stl_terminal, bg = stl_bg },
    StlModeSepPending = { fg = stl_pending, bg = stl_bg },

    StlIcon = { fg = icon_fg, bg = stl_bg },

    StlComponentInactive = { fg = stl_inactive, bg = stl_bg },
    StlComponentOn = { fg = stl_on, bg = stl_bg },
    StlComponentOff = { fg = stl_off, bg = stl_bg },

    StlGitadded = { fg = gutter_git_added, bg = stl_bg },
    StlGitdeleted = { fg = gutter_git_deleted, bg = stl_bg },
    StlGitmodified = { fg = gutter_git_modified, bg = stl_bg },

    StlDiagnosticERROR = { fg = error_red, bg = stl_bg },
    StlDiagnosticWARN = { fg = warn_yellow, bg = stl_bg },
    StlDiagnosticINFO = { fg = info_blue, bg = stl_bg },
    StlDiagnosticHINT = { fg = hint_gray, bg = stl_bg },

    StlMacroRecording = 'StlComponentOff',
    StlMacroRecorded = 'StlComponentOn',

    StlFiletype = { fg = stl_fg, bg = stl_bg, bold = true },

    StlLocComponent = 'StlModeNormal',
    StlLocComponentSep = 'StlModeSepNormal',

    --
    -- Quickfix
    --

    QuickfixFilename = { fg = filename },
    QuickfixSeparatorLeft = { fg = norm_fg },
    QuickfixLnum = { fg = lnum },
    QuickfixCol = { fg = col },
    QuickfixSeparatorRight = { fg = norm_fg },
    QuickfixError = 'DiagnosticError',
    QuickfixWarn = 'DiagnosticWarn',
    QuickfixInfo = 'DiagnosticInfo',
    QuickfixHint = 'DiagnosticHint',

    --
    -- Syntax
    --

    Comment = { fg = green },

    Constant = { fg = dark_blue },
    String = { fg = brown },
    Character = 'Constant',
    Number = { fg = '#005ee9' },
    Boolean = 'Constant',
    Float = 'Number',

    Identifier = { fg = light_blue },
    Function = { fg = dark_pink },

    Statement = { fg = dark_blue },
    Conditional = { fg = dark_pink },
    Repeat = 'Conditional',
    Label = 'Conditional',
    Operator = { fg = norm_fg },
    Keyword = { fg = dark_pink },
    Exception = 'Conditional',

    PreProc = { fg = dark_pink },
    Include = 'PreProc',
    Define = 'PreProc',
    Macro = 'PreProc',
    PreCondit = 'PreProc',

    Type = { fg = dark_blue },
    StorageClass = 'Type',
    Structure = 'Type',
    Typedef = 'Type',

    Special = { fg = yellow_orange },
    SpecialChar = 'Special',
    Tag = 'Special',
    Delimiter = 'Special',
    SpecialComment = 'Special',
    Debug = 'Special',

    Underlined = { underline = true },
    Error = { fg = error_red },
    Todo = { fg = norm_bg, bg = yellow_orange, bold = true },

    --
    -- Treesitter
    --

    -- Identifiers
    ['@variable'] = 'Identifier',
    ['@variable.builtin'] = { fg = dark_blue },
    ['@variable.parameter'] = { fg = orange },
    ['@variable.parameter.builtin'] = '@variable.parameter',
    ['@variable.member'] = { fg = blue_green },

    ['@constant'] = 'Constant',
    ['@constant.builtin'] = '@constant',
    ['@constant.macro'] = '@function',

    ['@module'] = { fg = norm_fg },
    ['@module.builtin'] = { fg = dark_blue },
    ['@label'] = { fg = dark_blue },

    -- Literals
    ['@string'] = 'String',
    ['@string.documentation'] = { fg = green },
    ['@string.regexp'] = { fg = blue_green },
    ['@string.escape'] = { fg = yellow_orange },
    ['@string.special'] = { fg = yellow_orange },
    ['@string.special.symbol'] = { fg = norm_fg },
    ['@string.special.url'] = { fg = blue, underline = true },
    ['@string.special.path'] = { fg = blue_green },

    ['@character'] = 'Character',
    ['@character.special'] = 'SpecialChar',

    ['@boolean'] = 'Boolean',
    ['@number'] = 'Number',
    ['@number.float'] = 'Float',

    -- Types
    ['@type'] = 'Type',
    ['@type.builtin'] = { fg = dark_blue },
    ['@type.definition'] = 'Typedef',
    ['@type.qualifier'] = { fg = dark_pink },

    ['@attribute'] = { fg = yellow },
    ['@attribute.builtin'] = { fg = yellow },
    ['@property'] = { fg = blue_green },

    -- Functions
    ['@function'] = 'Function',
    ['@function.builtin'] = { fg = dark_blue },
    ['@function.call'] = '@function',
    ['@function.macro'] = 'Macro',

    ['@function.method'] = 'Function',
    ['@function.method.call'] = '@function.method',

    ['@constructor'] = { fg = yellow },
    ['@operator'] = 'Operator',

    -- Keywords
    ['@keyword'] = 'Keyword',
    ['@keyword.coroutine'] = '@keyword',
    ['@keyword.function'] = { fg = dark_pink },
    ['@keyword.operator'] = { fg = dark_pink },
    ['@keyword.import'] = 'Include',
    ['@keyword.type'] = { fg = dark_pink },
    ['@keyword.modifier'] = { fg = dark_pink },
    ['@keyword.repeat'] = 'Repeat',
    ['@keyword.return'] = { fg = dark_pink },
    ['@keyword.debug'] = 'Debug',
    ['@keyword.exception'] = 'Exception',

    ['@keyword.conditional'] = 'Conditional',
    ['@keyword.conditional.ternary'] = 'Operator',

    ['@keyword.directive'] = 'PreProc',
    ['@keyword.directive.define'] = 'Define',

    -- Punctuation
    ['@punctuation.delimiter'] = 'Delimiter',
    ['@punctuation.bracket'] = { fg = norm_fg },
    ['@punctuation.special'] = 'Special',

    -- Comments
    ['@comment'] = 'Comment',
    ['@comment.documentation'] = { fg = green },

    ['@comment.error'] = { fg = error_red },
    ['@comment.warning'] = { fg = warn_yellow },
    ['@comment.todo'] = 'Todo',
    ['@comment.note'] = { fg = info_blue },

    -- Markup
    ['@markup.strong'] = { bold = true },
    ['@markup.italic'] = { italic = true },
    ['@markup.strikethrough'] = { strikethrough = true },
    ['@markup.underline'] = { underline = true },

    ['@markup.heading'] = { fg = blue, bold = true },
    ['@markup.heading.1'] = { fg = blue, bold = true },
    ['@markup.heading.2'] = { fg = yellow, bold = true },
    ['@markup.heading.3'] = { fg = green, bold = true },
    ['@markup.heading.4'] = { fg = blue_green, bold = true },
    ['@markup.heading.5'] = { fg = dark_pink, bold = true },
    ['@markup.heading.6'] = { fg = gray3, bold = true },

    ['@markup.quote'] = { fg = gray3, italic = true },
    ['@markup.math'] = { fg = blue },

    ['@markup.link'] = { fg = blue_green },
    ['@markup.link.label'] = { fg = light_blue },
    ['@markup.link.url'] = { fg = blue, underline = true },

    ['@markup.raw'] = { fg = brown },
    ['@markup.raw.block'] = { fg = brown },

    ['@markup.list'] = { fg = dark_pink },
    ['@markup.list.checked'] = { fg = green },
    ['@markup.list.unchecked'] = { fg = gray3 },

    -- Tags (used in XML-like languages)
    ['@tag'] = { fg = dark_pink },
    ['@tag.builtin'] = { fg = dark_pink },
    ['@tag.attribute'] = { fg = yellow },
    ['@tag.delimiter'] = { fg = gray3 },

    -- Language specific

    -- CSS
    ['@property.css'] = { fg = light_blue },
    ['@property.id.css'] = { fg = blue },
    ['@property.class.css'] = { fg = yellow },
    ['@type.css'] = { fg = light_blue },
    ['@type.tag.css'] = { fg = dark_pink },
    ['@string.plain.css'] = { fg = green },
    ['@number.css'] = { fg = orange },

    -- TSX (Typescript React)
    ['@tag.tsx'] = { fg = dark_pink },
    ['@constructor.tsx'] = { fg = light_blue },
    ['@tag.delimiter.tsx'] = { fg = gray3 },

    -- JSX
    ['@tag.jsx'] = { fg = dark_pink },
    ['@constructor.jsx'] = { fg = light_blue },
    ['@tag.delimiter.jsx'] = { fg = gray3 },

    -- Lua
    ['@constructor.lua'] = { fg = dark_blue },

    -- Python
    ['@variable.builtin.python'] = { fg = dark_blue },

    -- Java
    ['@constant.java'] = { fg = dark_blue },

    -- C/C++
    ['@property.cpp'] = { fg = norm_fg },
    ['@property.c'] = { fg = norm_fg },

    -- Bash
    ['@function.builtin.bash'] = { fg = dark_blue },
    ['@parameter.bash'] = { fg = norm_fg },

    -- Git
    ['@text.gitcommit'] = { fg = norm_fg },
    ['@spell.gitcommit'] = {},
    ['@text.gitrebase'] = { fg = norm_fg },

    -- Diff
    ['@text.diff.add'] = 'DiffAdd',
    ['@text.diff.delete'] = 'DiffDelete',

    -- JSON
    ['@label.json'] = { fg = light_blue },

    -- YAML
    ['@field.yaml'] = { fg = light_blue },

    -- TOML
    ['@property.toml'] = { fg = light_blue },

    -- Vim
    ['@variable.vim'] = { fg = norm_fg },

    -- Help
    ['@text.reference'] = { fg = blue_green },
    ['@text.uri'] = { fg = blue_green, underline = true },
    ['@text.literal'] = { fg = brown },
    ['@text.title'] = { fg = blue, bold = true },

    -- Misc
    ['@none'] = {},
    ['@conceal'] = 'Conceal',

    ['@spell'] = {},
    ['@nospell'] = {},
}

-- Apply highlight groups
for group, opts in pairs(groups) do
    if type(opts) == 'string' then
        vim.api.nvim_set_hl(0, group, { link = opts })
    else
        vim.api.nvim_set_hl(0, group, opts)
    end
end

-- Set colorscheme name
vim.g.colors_name = 'vercel-light'

return groups
