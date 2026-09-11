-- ~/.config/nvim/colors/retro-dune.lua
-- A complete, reliable colorscheme base for both dark and light backgrounds.
-- Structure: palette -> highlight group table -> apply.
-- Retheme later by only editing the `accent` block in each palette.

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
	vim.cmd("syntax reset")
end
vim.o.termguicolors            = true
vim.g.colors_name              = "retro-dune"

-------------------------------------------------------------------
-- PALETTES
-------------------------------------------------------------------

local palettes                 = {
	light = {
		-- warm CRT paper / phosphor background
		bg        = "#f2d9ad",
		bg_alt    = "#e8c995",
		bg_float  = "#f7e3bb",
		bg_visual = "#e6b968",
		bg_search = "#d99a32",

		-- dark amber-brown text
		fg        = "#2c2c2c",
		fg_dim    = "#8a531b",
		fg_muted  = "#a56a27",

		-- UI
		border    = "#a66b28",
		nontext   = "#c18a45",

		-- CRT amber accents
		red       = "#a93612",
		orange    = "#d94f0b",
		yellow    = "#b66a00",
		green     = "#65751b",
		cyan      = "#9a641c",
		blue      = "#76551f",
		purple    = "#8a431c",
		magenta   = "#a84418",

		-- semantic
		error     = "#b83216",
		warn      = "#a85d00",
		info      = "#76551f",
		hint      = "#8a641e",

		-- extremes
		black     = "#2a1608",
		white     = "#fff1cf",
	},
}

vim.o.background               = "light"
local p                        = palettes[vim.o.background] or palettes.light

-------------------------------------------------------------------
-- HIGHLIGHT GROUPS
-------------------------------------------------------------------

local hl                       = {}

-- Editor / UI ------------------------------------------------------
hl.Normal                      = { fg = p.fg, bg = p.bg }
hl.NormalNC                    = { fg = p.fg, bg = p.bg }
hl.NormalFloat                 = { fg = p.fg, bg = p.bg_float }
hl.FloatBorder                 = { fg = p.border, bg = p.bg_float }
hl.FloatTitle                  = { fg = p.blue, bg = p.bg_float, bold = true }
hl.SignColumn                  = { fg = p.fg_dim, bg = p.bg }
hl.ColorColumn                 = { bg = p.bg_alt }
hl.Cursor                      = { fg = p.bg, bg = p.fg }
hl.CursorLine                  = { bg = p.bg_alt }
hl.CursorLineNr                = { fg = p.yellow, bold = true }
hl.LineNr                      = { fg = p.fg_muted }
hl.WinSeparator                = { fg = p.border, bg = p.bg }
hl.VertSplit                   = { fg = p.border, bg = p.bg }
hl.StatusLine                  = { fg = p.fg, bg = p.bg_alt }
hl.StatusLineNC                = { fg = p.fg_muted, bg = p.bg_alt }
hl.TabLine                     = { fg = p.fg_muted, bg = p.bg_alt }
hl.TabLineFill                 = { bg = p.bg_alt }
hl.TabLineSel                  = { fg = p.fg, bg = p.bg, bold = true }
hl.Pmenu                       = { fg = p.fg, bg = p.bg_float }
hl.PmenuSel                    = { fg = p.bg, bg = p.blue, bold = true }
hl.PmenuSbar                   = { bg = p.bg_alt }
hl.PmenuThumb                  = { bg = p.fg_muted }
hl.WildMenu                    = { fg = p.bg, bg = p.blue }
hl.Visual                      = { bg = p.bg_visual }
hl.VisualNOS                   = { bg = p.bg_visual }
hl.Search                      = { fg = p.black, bg = p.bg_search }
hl.IncSearch                   = { fg = p.black, bg = p.orange }
hl.CurSearch                   = { fg = p.black, bg = p.orange }
hl.MatchParen                  = { fg = p.orange, bold = true, underline = true }
hl.NonText                     = { fg = p.nontext }
hl.Whitespace                  = { fg = p.nontext }
hl.SpecialKey                  = { fg = p.nontext }
hl.Folded                      = { fg = p.fg_dim, bg = p.bg_alt }
hl.FoldColumn                  = { fg = p.fg_muted, bg = p.bg }
hl.Directory                   = { fg = p.blue }
hl.Title                       = { fg = p.blue, bold = true }
hl.ErrorMsg                    = { fg = p.error, bold = true }
hl.WarningMsg                  = { fg = p.warn, bold = true }
hl.ModeMsg                     = { fg = p.fg, bold = true }
hl.MoreMsg                     = { fg = p.green }
hl.Question                    = { fg = p.green }
hl.MsgArea                     = { fg = p.fg, bg = p.bg }
hl.MsgSeparator                = { fg = p.border, bg = p.bg_alt }

-- Syntax -------------------------------------------------------------
hl.Comment                     = { fg = p.fg_muted, italic = true }
hl.Constant                    = { fg = p.orange }
hl.String                      = { fg = p.green }
hl.Character                   = { fg = p.green }
hl.Number                      = { fg = p.orange }
hl.Boolean                     = { fg = p.orange }
hl.Float                       = { fg = p.orange }
hl.Identifier                  = { fg = p.fg }
hl.Function                    = { fg = p.blue }
hl.Statement                   = { fg = p.purple }
hl.Conditional                 = { fg = p.purple }
hl.Repeat                      = { fg = p.purple }
hl.Label                       = { fg = p.purple }
hl.Operator                    = { fg = p.fg_dim }
hl.Keyword                     = { fg = p.purple }
hl.Exception                   = { fg = p.red }
hl.PreProc                     = { fg = p.cyan }
hl.Include                     = { fg = p.cyan }
hl.Define                      = { fg = p.cyan }
hl.Macro                       = { fg = p.cyan }
hl.PreCondit                   = { fg = p.cyan }
hl.Type                        = { fg = p.yellow }
hl.StorageClass                = { fg = p.yellow }
hl.Structure                   = { fg = p.yellow }
hl.Typedef                     = { fg = p.yellow }
hl.Special                     = { fg = p.cyan }
hl.SpecialChar                 = { fg = p.cyan }
hl.Tag                         = { fg = p.red }
hl.Delimiter                   = { fg = p.fg_dim }
hl.SpecialComment              = { fg = p.fg_muted, italic = true }
hl.Debug                       = { fg = p.red }
hl.Underlined                  = { underline = true }
hl.Ignore                      = { fg = p.fg_muted }
hl.Error                       = { fg = p.error, bold = true }
hl.Todo                        = { fg = p.black, bg = p.yellow, bold = true }

-- Treesitter (modern captures) ---------------------------------------
hl["@variable"]                = { fg = p.fg }
hl["@variable.builtin"]        = { fg = p.red }
hl["@variable.parameter"]      = { fg = p.fg_dim }
hl["@variable.member"]         = { fg = p.cyan }
hl["@constant"]                = { fg = p.orange }
hl["@constant.builtin"]        = { fg = p.orange, bold = true }
hl["@string"]                  = { link = "String" }
hl["@string.escape"]           = { fg = p.cyan }
hl["@character"]               = { link = "Character" }
hl["@number"]                  = { link = "Number" }
hl["@boolean"]                 = { link = "Boolean" }
hl["@function"]                = { link = "Function" }
hl["@function.builtin"]        = { fg = p.blue, italic = true }
hl["@function.call"]           = { link = "Function" }
hl["@method"]                  = { fg = p.blue }
hl["@method.call"]             = { fg = p.blue }
hl["@constructor"]             = { fg = p.yellow }
hl["@keyword"]                 = { link = "Keyword" }
hl["@keyword.function"]        = { fg = p.purple }
hl["@keyword.return"]          = { fg = p.purple, italic = true }
hl["@conditional"]             = { link = "Conditional" }
hl["@repeat"]                  = { link = "Repeat" }
hl["@operator"]                = { link = "Operator" }
hl["@type"]                    = { link = "Type" }
hl["@type.builtin"]            = { fg = p.yellow, italic = true }
hl["@property"]                = { fg = p.cyan }
hl["@field"]                   = { fg = p.cyan }
hl["@namespace"]               = { fg = p.yellow }
hl["@punctuation.bracket"]     = { fg = p.fg_dim }
hl["@punctuation.delimiter"]   = { fg = p.fg_dim }
hl["@punctuation.special"]     = { fg = p.cyan }
hl["@comment"]                 = { link = "Comment" }
hl["@tag"]                     = { fg = p.red }
hl["@tag.attribute"]           = { fg = p.orange, italic = true }
hl["@tag.delimiter"]           = { fg = p.fg_dim }

-- LSP / Diagnostics ---------------------------------------------------
hl.DiagnosticError             = { fg = p.error }
hl.DiagnosticWarn              = { fg = p.warn }
hl.DiagnosticInfo              = { fg = p.info }
hl.DiagnosticHint              = { fg = p.hint }
hl.DiagnosticUnderlineError    = { undercurl = true, sp = p.error }
hl.DiagnosticUnderlineWarn     = { undercurl = true, sp = p.warn }
hl.DiagnosticUnderlineInfo     = { undercurl = true, sp = p.info }
hl.DiagnosticUnderlineHint     = { undercurl = true, sp = p.hint }
hl.DiagnosticVirtualTextError  = { fg = p.error, bg = p.bg_alt }
hl.DiagnosticVirtualTextWarn   = { fg = p.warn, bg = p.bg_alt }
hl.DiagnosticVirtualTextInfo   = { fg = p.info, bg = p.bg_alt }
hl.DiagnosticVirtualTextHint   = { fg = p.hint, bg = p.bg_alt }
hl.LspReferenceText            = { bg = p.bg_alt }
hl.LspReferenceRead            = { bg = p.bg_alt }
hl.LspReferenceWrite           = { bg = p.bg_visual }
hl.LspSignatureActiveParameter = { fg = p.orange, bold = true }
hl.LspInlayHint                = { fg = p.fg_muted, bg = p.bg_alt, italic = true }

-- Git / diff -----------------------------------------------------------
hl.DiffAdd                     = { bg = p.bg_alt, fg = p.green }
hl.DiffChange                  = { bg = p.bg_alt, fg = p.yellow }
hl.DiffDelete                  = { bg = p.bg_alt, fg = p.red }
hl.DiffText                    = { bg = p.bg_visual, fg = p.blue }
hl.GitSignsAdd                 = { fg = p.green }
hl.GitSignsChange              = { fg = p.yellow }
hl.GitSignsDelete              = { fg = p.red }

-- Telescope --------------------------------------------------------------
hl.TelescopeNormal             = { fg = p.fg, bg = p.bg_float }
hl.TelescopeBorder             = { fg = p.border, bg = p.bg_float }
hl.TelescopePromptNormal       = { fg = p.fg, bg = p.bg_alt }
hl.TelescopePromptBorder       = { fg = p.border, bg = p.bg_alt }
hl.TelescopePromptPrefix       = { fg = p.blue, bg = p.bg_alt }
hl.TelescopeSelection          = { fg = p.fg, bg = p.bg_visual, bold = true }
hl.TelescopeSelectionCaret     = { fg = p.blue, bg = p.bg_visual }
hl.TelescopeMatching           = { fg = p.orange, bold = true }
hl.TelescopeTitle              = { fg = p.blue, bold = true }

-- nvim-cmp -----------------------------------------------------------------
hl.CmpItemAbbr                 = { fg = p.fg }
hl.CmpItemAbbrMatch            = { fg = p.blue, bold = true }
hl.CmpItemAbbrMatchFuzzy       = { fg = p.blue, bold = true }
hl.CmpItemKind                 = { fg = p.cyan }
hl.CmpItemMenu                 = { fg = p.fg_muted, italic = true }
hl.CmpDocumentation            = { fg = p.fg, bg = p.bg_float }
hl.CmpDocumentationBorder      = { fg = p.border, bg = p.bg_float }

-- Lazy.nvim ------------------------------------------------------------------
hl.LazyNormal                  = { fg = p.fg, bg = p.bg_float }
hl.LazyButton                  = { fg = p.fg, bg = p.bg_alt }
hl.LazyButtonActive            = { fg = p.bg, bg = p.blue, bold = true }
hl.LazyH1                      = { fg = p.bg, bg = p.blue, bold = true }
hl.LazyReasonPlugin            = { fg = p.purple }
hl.LazyReasonEvent             = { fg = p.green }
hl.LazyReasonCmd               = { fg = p.blue }

-- Mason ----------------------------------------------------------------------
hl.MasonHeader                 = { fg = p.bg, bg = p.blue, bold = true }
hl.MasonHighlight              = { fg = p.blue }
hl.MasonHighlightBlock         = { fg = p.bg, bg = p.blue }
hl.MasonMuted                  = { fg = p.fg_muted }
hl.MasonMutedBlock             = { fg = p.fg, bg = p.bg_alt }

-------------------------------------------------------------------
-- APPLY
-------------------------------------------------------------------

for group, opts in pairs(hl) do
	vim.api.nvim_set_hl(0, group, opts)
end
