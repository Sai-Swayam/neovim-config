-- ============================================================
-- Retro Base
-- A clean, reusable Neovim colorscheme foundation
-- ============================================================

-- ------------------------------------------------------------
-- Reset
-- ------------------------------------------------------------

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
	vim.cmd("syntax reset")
end
vim.g.colors_name = "retro-base"

-- ------------------------------------------------------------
-- Palette
-- ------------------------------------------------------------
-- Change these colors later to create your own themes.
-- The important idea:
--     palette -> semantic colors -> highlight groups
-- Do NOT normally put hex values directly in highlight groups.
-- ------------------------------------------------------------

local palettes = {
	-- ========================================================
	-- LIGHT
	-- ========================================================
	light = {
		-- Backgrounds
		bg          = "#f4f1ea",
		bg_alt      = "#ebe8df",
		bg_float    = "#eeece5",
		bg_visual   = "#d9e1d5",
		bg_cursor   = "#e1e6dc",
		-- Foreground
		fg          = "#252822",
		fg_dim      = "#62675e",
		fg_muted    = "#858a80",
		fg_disabled = "#a5a9a0",
		-- Borders
		border      = "#c7c9c0",
		border_alt  = "#d6d7cf",
		-- Main accent
		accent      = "#3f7448",
		accent_dim  = "#5b895f",
		accent_bg   = "#dce8d9",
		-- Syntax colors
		keyword     = "#76519a",
		type        = "#356d88",
		function_   = "#8a5a22",
		string      = "#477448",
		constant    = "#9a4e3d",
		number      = "#8b5b91",
		operator    = "#596158",
		special     = "#9a6528",
		-- Diagnostics
		error       = "#b83a35",
		warning     = "#a66b16",
		info        = "#356d9b",
		hint        = "#3e8066",
		-- Diff
		added       = "#477a4d",
		changed     = "#8a6b24",
		removed     = "#a9443d",
		-- Special
		selection   = "#d6dfd1",
		search      = "#e8c96d",
		search_fg   = "#292b24",
	},
	-- ========================================================
	-- DARK
	-- ========================================================
	dark = {
		-- Backgrounds
		bg          = "#171916",
		bg_alt      = "#1e211d",
		bg_float    = "#20231f",
		bg_visual   = "#303a2f",
		bg_cursor   = "#252a23",
		-- Foreground
		fg          = "#dfe6da",
		fg_dim      = "#92998c",
		fg_muted    = "#6f766b",
		fg_disabled = "#4f554d",
		-- Borders
		border      = "#3a4038",
		border_alt  = "#2c312b",
		-- Main accent
		accent      = "#83bd6b",
		accent_dim  = "#679852",
		accent_bg   = "#263725",
		-- Syntax colors
		keyword     = "#c49ad8",
		type        = "#78b5c9",
		function_   = "#d2a76d",
		string      = "#8fbd79",
		constant    = "#d28b79",
		number      = "#bd91c5",
		operator    = "#b0b8aa",
		special     = "#d0a05d",
		-- Diagnostics
		error       = "#ef7770",
		warning     = "#e0b267",
		info        = "#78a9df",
		hint        = "#75c7a2",
		-- Diff
		added       = "#78a86d",
		changed     = "#c5a65b",
		removed     = "#d56e68",
		-- Special
		selection   = "#344032",
		search      = "#c6a94e",
		search_fg   = "#171916",
	},
}
-- ------------------------------------------------------------
-- Select palette
-- ------------------------------------------------------------
local colors
if vim.o.background == "dark" then
	colors = palettes.dark
else
	colors = palettes.light
end
-- ------------------------------------------------------------
-- Helper
-- ------------------------------------------------------------
local function hi(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end
-- ============================================================
-- CORE EDITOR
-- ============================================================
hi("Normal", {
	fg = colors.fg,
	bg = colors.bg,
})
hi("NormalNC", {
	fg = colors.fg_dim,
	bg = colors.bg,
})
hi("NormalFloat", {
	fg = colors.fg,
	bg = colors.bg_float,
})
hi("FloatBorder", {
	fg = colors.border,
	bg = colors.bg_float,
})
hi("FloatTitle", {
	fg = colors.accent,
	bg = colors.bg_float,
	bold = true,
})
hi("Cursor", {
	fg = colors.bg,
	bg = colors.accent,
})
hi("CursorIM", {
	fg = colors.bg,
	bg = colors.accent,
})
hi("CursorLine", {
	bg = colors.bg_cursor,
})
hi("CursorColumn", {
	bg = colors.bg_cursor,
})
hi("ColorColumn", {
	bg = colors.bg_alt,
})
hi("SignColumn", {
	fg = colors.fg_muted,
	bg = colors.bg,
})
hi("FoldColumn", {
	fg = colors.fg_muted,
	bg = colors.bg,
})
hi("Folded", {
	fg = colors.fg_dim,
	bg = colors.bg_alt,
})
-- ============================================================
-- LINE NUMBERS / GUTTER
-- ============================================================
hi("LineNr", {
	fg = colors.fg_muted,
	bg = colors.bg,
})
hi("CursorLineNr", {
	fg = colors.accent,
	bg = colors.bg_cursor,
	bold = true,
})
hi("LineNrAbove", {
	fg = colors.fg_disabled,
})
hi("LineNrBelow", {
	fg = colors.fg_disabled,
})
-- ============================================================
-- SELECTION / SEARCH
-- ============================================================
hi("Visual", {
	bg = colors.selection,
})
hi("VisualNOS", {
	bg = colors.selection,
})
hi("Search", {
	fg = colors.search_fg,
	bg = colors.search,
})
hi("IncSearch", {
	fg = colors.search_fg,
	bg = colors.accent,
	bold = true,
})
hi("CurSearch", {
	fg = colors.search_fg,
	bg = colors.accent,
	bold = true,
})
hi("Substitute", {
	fg = colors.search_fg,
	bg = colors.warning,
})
-- ============================================================
-- SYNTAX
-- ============================================================
hi("Comment", {
	fg = colors.fg_muted,
	italic = true,
})
hi("Constant", {
	fg = colors.constant,
})
hi("String", {
	fg = colors.string,
})
hi("Character", {
	fg = colors.string,
})
hi("Number", {
	fg = colors.number,
})
hi("Float", {
	fg = colors.number,
})
hi("Boolean", {
	fg = colors.constant,
})
hi("Identifier", {
	fg = colors.fg,
})
hi("Function", {
	fg = colors.function_,
})
hi("Statement", {
	fg = colors.keyword,
})
hi("Conditional", {
	fg = colors.keyword,
})
hi("Repeat", {
	fg = colors.keyword,
})
hi("Label", {
	fg = colors.keyword,
})
hi("Operator", {
	fg = colors.operator,
})
hi("Keyword", {
	fg = colors.keyword,
})
hi("Exception", {
	fg = colors.error,
})
hi("PreProc", {
	fg = colors.special,
})
hi("Include", {
	fg = colors.special,
})
hi("Define", {
	fg = colors.special,
})
hi("Macro", {
	fg = colors.special,
})
hi("PreCondit", {
	fg = colors.special,
})
hi("Type", {
	fg = colors.type,
})
hi("StorageClass", {
	fg = colors.keyword,
})
hi("Structure", {
	fg = colors.type,
})
hi("Typedef", {
	fg = colors.type,
})
hi("Special", {
	fg = colors.special,
})
hi("SpecialChar", {
	fg = colors.special,
})
hi("Tag", {
	fg = colors.accent,
})
hi("Delimiter", {
	fg = colors.operator,
})
hi("Debug", {
	fg = colors.error,
})
hi("Underlined", {
	underline = true,
})
hi("Error", {
	fg = colors.error,
})
-- ============================================================
-- TREESITTER
-- ============================================================
hi("@comment", {
	link = "Comment",
})
hi("@variable", {
	fg = colors.fg,
})
hi("@variable.builtin", {
	fg = colors.special,
})
hi("@variable.parameter", {
	fg = colors.fg,
})
hi("@variable.member", {
	fg = colors.type,
})
hi("@constant", {
	link = "Constant",
})
hi("@constant.builtin", {
	fg = colors.constant,
})
hi("@module", {
	fg = colors.type,
})
hi("@label", {
	link = "Label",
})
hi("@string", {
	link = "String",
})
hi("@string.escape", {
	fg = colors.special,
})
hi("@string.special", {
	fg = colors.special,
})
hi("@character", {
	link = "Character",
})
hi("@number", {
	link = "Number",
})
hi("@boolean", {
	link = "Boolean",
})
hi("@float", {
	link = "Float",
})
hi("@function", {
	link = "Function",
})
hi("@function.call", {
	link = "Function",
})
hi("@function.builtin", {
	fg = colors.function_,
})
hi("@function.method", {
	link = "Function",
})
hi("@function.method.call", {
	link = "Function",
})
hi("@constructor", {
	fg = colors.type,
})
hi("@operator", {
	link = "Operator",
})
hi("@keyword", {
	link = "Keyword",
})
hi("@keyword.function", {
	fg = colors.keyword,
})
hi("@keyword.return", {
	fg = colors.keyword,
})
hi("@keyword.operator", {
	fg = colors.operator,
})
hi("@keyword.import", {
	fg = colors.special,
})
hi("@conditional", {
	link = "Conditional",
})
hi("@repeat", {
	link = "Repeat",
})
hi("@exception", {
	link = "Exception",
})
hi("@type", {
	link = "Type",
})
hi("@type.builtin", {
	fg = colors.type,
})
hi("@type.definition", {
	fg = colors.type,
})
hi("@attribute", {
	fg = colors.special,
})
hi("@property", {
	fg = colors.type,
})
hi("@field", {
	fg = colors.type,
})
hi("@punctuation.delimiter", {
	fg = colors.operator,
})
hi("@punctuation.bracket", {
	fg = colors.operator,
})
hi("@punctuation.special", {
	fg = colors.special,
})
hi("@tag", {
	fg = colors.accent,
})
hi("@tag.attribute", {
	fg = colors.type,
})
hi("@tag.delimiter", {
	fg = colors.operator,
})
-- ============================================================
-- LSP SEMANTIC TOKENS
-- ============================================================
hi("@lsp.type.variable", {
	fg = colors.fg,
})
hi("@lsp.type.parameter", {
	fg = colors.fg,
})
hi("@lsp.type.property", {
	fg = colors.type,
})
hi("@lsp.type.field", {
	fg = colors.type,
})
hi("@lsp.type.function", {
	fg = colors.function_,
})
hi("@lsp.type.method", {
	fg = colors.function_,
})
hi("@lsp.type.type", {
	fg = colors.type,
})
hi("@lsp.type.class", {
	fg = colors.type,
})
hi("@lsp.type.enum", {
	fg = colors.type,
})
hi("@lsp.type.interface", {
	fg = colors.type,
})
hi("@lsp.type.namespace", {
	fg = colors.type,
})
hi("@lsp.type.parameter", {
	fg = colors.fg,
})
hi("@lsp.type.comment", {
	link = "Comment",
})
-- ============================================================
-- STATUSLINE
-- ============================================================
hi("StatusLine", {
	fg = colors.fg,
	bg = colors.bg_alt,
})
hi("StatusLineNC", {
	fg = colors.fg_muted,
	bg = colors.bg_alt,
})
hi("StatusLineTerm", {
	fg = colors.fg,
	bg = colors.bg_alt,
})
hi("StatusLineTermNC", {
	fg = colors.fg_muted,
	bg = colors.bg_alt,
})
-- ============================================================
-- TABLINE
-- ============================================================
hi("TabLine", {
	fg = colors.fg_muted,
	bg = colors.bg_alt,
})
hi("TabLineFill", {
	fg = colors.fg_muted,
	bg = colors.bg_alt,
})
hi("TabLineSel", {
	fg = colors.accent,
	bg = colors.bg,
	bold = true,
})
-- ============================================================
-- WINDOW / SPLIT UI
-- ============================================================
hi("VertSplit", {
	fg = colors.border,
	bg = colors.bg,
})
hi("WinSeparator", {
	fg = colors.border,
	bg = colors.bg,
})
hi("WinBar", {
	fg = colors.fg_dim,
	bg = colors.bg,
})
hi("WinBarNC", {
	fg = colors.fg_muted,
	bg = colors.bg,
})
-- ============================================================
-- COMMAND LINE / MESSAGES
-- ============================================================
hi("MsgArea", {
	fg = colors.fg,
	bg = colors.bg,
})
hi("MsgSeparator", {
	fg = colors.border,
	bg = colors.bg,
})
hi("ModeMsg", {
	fg = colors.accent,
	bold = true,
})
hi("MoreMsg", {
	fg = colors.accent,
})
hi("Question", {
	fg = colors.accent,
	bold = true,
})
hi("WarningMsg", {
	fg = colors.warning,
})
hi("ErrorMsg", {
	fg = colors.error,
	bold = true,
})
hi("CmdLine", {
	fg = colors.fg,
	bg = colors.bg,
})
hi("CmdLineIcon", {
	fg = colors.accent,
})
hi("CmdLineIconHL", {
	fg = colors.accent,
})
hi("CmdLinePrompt", {
	fg = colors.accent,
	bold = true,
})
hi("CmdLinePromptIcon", {
	fg = colors.accent,
})
hi("Confirm", {
	fg = colors.fg,
	bg = colors.bg_float,
})
hi("ConfirmDefault", {
	fg = colors.accent,
	bold = true,
})
-- ============================================================
-- POPUP MENU
-- ============================================================
hi("Pmenu", {
	fg = colors.fg,
	bg = colors.bg_float,
})
hi("PmenuSel", {
	fg = colors.fg,
	bg = colors.accent_bg,
	bold = true,
})
hi("PmenuSbar", {
	bg = colors.bg_alt,
})
hi("PmenuThumb", {
	bg = colors.border,
})
hi("PmenuKind", {
	fg = colors.type,
	bg = colors.bg_float,
})
hi("PmenuKindSel", {
	fg = colors.type,
	bg = colors.accent_bg,
})
hi("PmenuExtra", {
	fg = colors.fg_muted,
	bg = colors.bg_float,
})
hi("PmenuExtraSel", {
	fg = colors.fg_dim,
	bg = colors.accent_bg,
})
-- ============================================================
-- DIAGNOSTICS
-- ============================================================
hi("DiagnosticError", {
	fg = colors.error,
})
hi("DiagnosticWarn", {
	fg = colors.warning,
})
hi("DiagnosticInfo", {
	fg = colors.info,
})
hi("DiagnosticHint", {
	fg = colors.hint,
})
hi("DiagnosticOk", {
	fg = colors.added,
})
hi("DiagnosticVirtualTextError", {
	fg = colors.error,
	bg = colors.bg,
})
hi("DiagnosticVirtualTextWarn", {
	fg = colors.warning,
	bg = colors.bg,
})
hi("DiagnosticVirtualTextInfo", {
	fg = colors.info,
	bg = colors.bg,
})
hi("DiagnosticVirtualTextHint", {
	fg = colors.hint,
	bg = colors.bg,
})
hi("DiagnosticUnderlineError", {
	sp = colors.error,
	undercurl = true,
})
hi("DiagnosticUnderlineWarn", {
	sp = colors.warning,
	undercurl = true,
})
hi("DiagnosticUnderlineInfo", {
	sp = colors.info,
	undercurl = true,
})
hi("DiagnosticUnderlineHint", {
	sp = colors.hint,
	undercurl = true,
})
hi("DiagnosticSignError", {
	fg = colors.error,
})
hi("DiagnosticSignWarn", {
	fg = colors.warning,
})
hi("DiagnosticSignInfo", {
	fg = colors.info,
})
hi("DiagnosticSignHint", {
	fg = colors.hint,
})
-- ============================================================
-- GIT / DIFF
-- ============================================================
hi("DiffAdd", {
	fg = colors.added,
	bg = colors.bg,
})
hi("DiffChange", {
	fg = colors.changed,
	bg = colors.bg,
})
hi("DiffDelete", {
	fg = colors.removed,
	bg = colors.bg,
})
hi("DiffText", {
	fg = colors.changed,
	bg = colors.bg_visual,
})
hi("Added", {
	fg = colors.added,
})
hi("Changed", {
	fg = colors.changed,
})
hi("Removed", {
	fg = colors.removed,
})
-- ============================================================
-- SPELLING
-- ============================================================
hi("SpellBad", {
	sp = colors.error,
	undercurl = true,
})
hi("SpellCap", {
	sp = colors.warning,
	undercurl = true,
})
hi("SpellLocal", {
	sp = colors.info,
	undercurl = true,
})
hi("SpellRare", {
	sp = colors.hint,
	undercurl = true,
})
-- ============================================================
-- FOLD / MATCH
-- ============================================================
hi("MatchParen", {
	fg = colors.accent,
	bg = colors.accent_bg,
	bold = true,
})
hi("Conceal", {
	fg = colors.fg_muted,
})
hi("NonText", {
	fg = colors.fg_disabled,
})
hi("Whitespace", {
	fg = colors.fg_disabled,
})
hi("SpecialKey", {
	fg = colors.fg_disabled,
})
-- ============================================================
-- TELESCOPE
-- ============================================================
hi("TelescopeNormal", {
	fg = colors.fg,
	bg = colors.bg_float,
})
hi("TelescopeBorder", {
	fg = colors.border,
	bg = colors.bg_float,
})
hi("TelescopeTitle", {
	fg = colors.accent,
	bg = colors.bg_float,
	bold = true,
})
hi("TelescopePromptNormal", {
	fg = colors.fg,
	bg = colors.bg_alt,
})
hi("TelescopePromptBorder", {
	fg = colors.border,
	bg = colors.bg_alt,
})
hi("TelescopePromptTitle", {
	fg = colors.accent,
	bg = colors.bg_alt,
	bold = true,
})
hi("TelescopePromptPrefix", {
	fg = colors.accent,
	bg = colors.bg_alt,
})
hi("TelescopeSelection", {
	fg = colors.fg,
	bg = colors.accent_bg,
})
hi("TelescopeSelectionCaret", {
	fg = colors.accent,
	bg = colors.accent_bg,
})
hi("TelescopeMatching", {
	fg = colors.accent,
	bold = true,
})
hi("TelescopePreviewNormal", {
	fg = colors.fg,
	bg = colors.bg_float,
})
hi("TelescopePreviewBorder", {
	fg = colors.border,
	bg = colors.bg_float,
})
hi("TelescopePreviewTitle", {
	fg = colors.accent,
	bg = colors.bg_float,
	bold = true,
})
-- ============================================================
-- LAZY.NVIM
-- ============================================================
hi("LazyNormal", {
	fg = colors.fg,
	bg = colors.bg_float,
})
hi("LazyBorder", {
	fg = colors.border,
	bg = colors.bg_float,
})
hi("LazyH1", {
	fg = colors.accent,
	bold = true,
})
hi("LazyButton", {
	fg = colors.fg,
	bg = colors.bg_alt,
})
hi("LazyButtonActive", {
	fg = colors.fg,
	bg = colors.accent_bg,
	bold = true,
})
hi("LazySpecial", {
	fg = colors.special,
})
hi("LazyProgressDone", {
	fg = colors.added,
})
hi("LazyProgressTodo", {
	fg = colors.fg_muted,
})
-- ============================================================
-- MASON
-- ============================================================
hi("MasonNormal", {
	fg = colors.fg,
	bg = colors.bg_float,
})
hi("MasonHeader", {
	fg = colors.accent,
	bg = colors.bg_alt,
	bold = true,
})
hi("MasonHeaderSecondary", {
	fg = colors.type,
	bg = colors.bg_alt,
	bold = true,
})
hi("MasonHighlight", {
	fg = colors.accent,
})
hi("MasonHighlightBlock", {
	fg = colors.fg,
	bg = colors.accent_bg,
})
hi("MasonHighlightBlockBold", {
	fg = colors.fg,
	bg = colors.accent_bg,
	bold = true,
})
hi("MasonMuted", {
	fg = colors.fg_muted,
})
hi("MasonMutedBlock", {
	fg = colors.fg_muted,
	bg = colors.bg_alt,
})
hi("MasonError", {
	fg = colors.error,
})
hi("MasonWarning", {
	fg = colors.warning,
})
hi("MasonHeading", {
	fg = colors.accent,
	bold = true,
})
-- ============================================================
-- TERMINAL
-- ============================================================
hi("TermCursor", {
	fg = colors.bg,
	bg = colors.accent,
})
hi("TermCursorNC", {
	fg = colors.bg,
	bg = colors.fg_muted,
})
-- ============================================================
-- QUICKFIX / LOCATION LIST
-- ============================================================
hi("QuickFixLine", {
	fg = colors.fg,
	bg = colors.accent_bg,
	bold = true,
})
hi("qfFileName", {
	fg = colors.accent,
})
hi("qfLineNr", {
	fg = colors.fg_muted,
})
-- ============================================================
-- NEO-VIM LSP UI
-- ============================================================
hi("LspReferenceText", {
	bg = colors.accent_bg,
})
hi("LspReferenceRead", {
	bg = colors.accent_bg,
})
hi("LspReferenceWrite", {
	bg = colors.accent_bg,
	bold = true,
})
hi("LspCodeLens", {
	fg = colors.fg_muted,
})
hi("LspCodeLensSeparator", {
	fg = colors.border,
})
hi("LspInlayHint", {
	fg = colors.fg_muted,
	bg = colors.bg_alt,
})
-- ============================================================
-- END
-- ============================================================

vim.g.colors_name = "retro-base"
