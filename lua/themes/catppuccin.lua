return { {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require('catppuccin').setup {
			no_italic = true,
			transparent_background = true,
			float = {
				transparent = false, -- enable transparent floating windows
				solid = false,   -- use solid styling for floating windows, see |winborder|
			},
			color_overrides = {
				all = {
					-- rosewater = '#f66151',
					-- flamingo = '#c061cb',
					-- pink = '#c061cb',
					-- mauve = '#c061cb',
					-- red = '#e01b24',
					-- maroon = '#f66151',
					-- peach = '#ffa348',
					-- yellow = '#F5C211',
					-- green = '#33d17a',
					-- teal = '#54DBF6',
					-- sky = '#62a0ea',
					-- sapphire = '#62a0ea',
					-- blue = '#62a0ea',
					-- lavender = '#c061cb',
					-- text = '#ffffff',
					-- subtext1 = '#deddda',
					-- subtext0 = '#c0bfbc',
					-- overlay2 = '#858585',
					-- overlay1 = '#737373',
					-- overlay0 = '#616161',
					-- surface2 = '#4f4f4f',
					-- surface1 = '#3e3e3e',
					-- surface0 = '#2e2e2e',

					-- base = '#1E1E1E',
					-- mantle = '#1A1A1A',
					-- crust = '#000000'

					-- crust = '#101010',
					-- base = '#101010',
					-- mantle = '#101010',

					-- base = "#0b0b12",
					base = "#181818",
					mantle = "#11111a",
					crust = "#191926",
				}
			},
			integrations = {
				telescope = {
					enabled = false,
					style = "nvchad",
				},
				dropbar = {
					enabled = true,
					color_mode = true,
				},
				blink_cmp = {
					enabled = true,
					style = 'bordered',
				},
				bufferline = {
					enabled = true,
				},
				native_lsp = {
					enabled = true,
					underlines = {
						errors = { "undercurl" },
						hints = { "undercurl" },
						warnings = { "undercurl" },
						information = { "undercurl" },
					},
				},
				flash = true,
				mason = true,
				treesitter = true,
			},


			custom_highlights = function(colors)
				return {
					LineNr = { fg = colors.surface1 },
					CursorLineNr = { fg = colors.overlay2 },
					CursorLine = { bg = '#252525' },
					ColorColumn = { bg = '#252525' },
					Visual = { bg = colors.surface1 },
					MsgArea = { fg = colors.subtext0 },
					-- TabLine = { bg = colors.red },
					-- TabLineFill = { bg = 'NONE' },
					-- TabLineSel = { fg = colors.red, bg = colors.red },

					TelescopeBorder = { fg = colors.subtext0 },

					Constant = { fg = colors.blue },
					String = { fg = colors.subtext0 },
					Character = { fg = colors.subtext0 },
					Number = { fg = colors.blue },
					Boolean = { fg = colors.blue },
					Float = { fg = colors.blue },
					Identifier = { fg = colors.green },
					Function = { fg = colors.green },
					Statement = { fg = colors.green },
					Conditional = { fg = colors.green },
					Repeat = { fg = colors.green },
					Label = { fg = colors.green },
					Operator = { fg = colors.subtext0 },
					Keyword = { fg = colors.green },
					Exception = { fg = colors.green },
					PreProc = { fg = colors.yellow },
					Include = { fg = colors.yellow },
					Define = { fg = colors.yellow },
					Macro = { fg = colors.yellow },
					PreCondit = { fg = colors.yellow },
					Type = { fg = colors.blue },
					StorageClass = { fg = colors.overlay2 },
					Structure = { fg = colors.subtext0 },
					Special = { fg = colors.overlay2 },
					SpecialChar = { fg = colors.overlay2 },

					-- NormalFloat = { fg = "#000000", bg = "#C3E88D" },
					FloatBorder = { fg = colors.text, bg = colors.mantle },
					LazyNormal = { fg = colors.text, bg = colors.base },
					MasonNormal = { fg = colors.text, bg = colors.base },

					-- blink_cmp custom highlights

					-- BlinkCmpMenu = { fg = "#C5CDD9", bg = "#22252A" },
					BlinkCmpMenu = { fg = colors.text, bg = colors.base },
					BlinkCmpMenuBorder = { fg = "#C3E88D", bg = "#9FBD73" },
					BlinkCmpMenuSelection = { bg = "#858585", fg = "NONE" },
					BlinkCmpScrollBarThumb = { bg = "#858585", fg = "NONE" },
					BlinkCmpScrollBarGutter = { fg = "NONE", bg = "#2E2E2E" },

					BlinkCmpKindField = { fg = colors.text, bg = colors.red },
					BlinkCmpKindProperty = { fg = colors.text, bg = colors.red },
					BlinkCmpKindEvent = { fg = colors.text, bg = colors.red },

					BlinkCmpKindText = { fg = colors.text, bg = colors.green },
					BlinkCmpKindEnum = { fg = colors.text, bg = colors.green },
					BlinkCmpKindKeyword = { fg = colors.text, bg = colors.green },

					BlinkCmpKindConstant = { fg = colors.text, bg = colors.yellow },
					BlinkCmpKindConstructor = { fg = colors.text, bg = colors.yellow },
					BlinkCmpKindReference = { fg = colors.text, bg = colors.yellow },

					BlinkCmpKindFunction = { fg = colors.text, bg = colors.lavender },
					BlinkCmpKindStruct = { fg = colors.text, bg = colors.lavender },
					BlinkCmpKindClass = { fg = colors.text, bg = colors.lavender },
					BlinkCmpKindModule = { fg = colors.text, bg = colors.lavender },
					BlinkCmpKindOperator = { fg = colors.text, bg = colors.lavender },

					BlinkCmpKindVariable = { fg = colors.subtext0, bg = colors.overlay1 },
					BlinkCmpKindFile = { fg = colors.subtext0, bg = colors.overlay1 },

					BlinkCmpKindUnit = { fg = colors.text, bg = colors.peach },
					BlinkCmpKindSnippet = { fg = colors.text, bg = colors.peach },
					BlinkCmpKindFolder = { fg = colors.text, bg = colors.peach },

					BlinkCmpKindMethod = { fg = colors.text, bg = colors.sky },
					BlinkCmpKindValue = { fg = colors.text, bg = colors.sky },
					BlinkCmpKindEnumMember = { fg = colors.text, bg = colors.sky },

					BlinkCmpKindInterface = { fg = colors.text, bg = colors.teal },
					BlinkCmpKindColor = { fg = colors.text, bg = colors.teal },
					BlinkCmpKindTypeParameter = { fg = colors.text, bg = colors.teal },


					-- Diagnostic
					DiagnosticFloatingError     = { fg = "#ed8796", bg = "NONE" },
					DiagnosticError             = { fg = "#ed8796", bg = "NONE" },
					DiagnosticFloatingWarn      = { fg = "#eed49f", bg = "NONE" },
					DiagnosticWarn              = { fg = "#eed49f", bg = "NONE" },
					DiagnosticFloatingInfo      = { fg = "#91d7e3", bg = "NONE" },
					DiagnosticInfo              = { fg = "#91d7e3", bg = "NONE" },
					DiagnosticFloatingHint      = { fg = "#8bd5ca", bg = "NONE" },
					DiagnosticHint              = { fg = "#8bd5ca", bg = "NONE" },
					DiagnosticFloatingOk        = { fg = "#a6da95", bg = "NONE" },
					DiagnosticOk                = { fg = "#a6da95", bg = "NONE" },
					DiagnosticVirtualTextError  = { fg = "#ed8796", bg = "NONE" },
					DiagnosticVirtualTextWarn   = { fg = "#eed49f", bg = "NONE" },
					DiagnosticVirtualTextInfo   = { fg = "#91d7e3", bg = "NONE" },
					DiagnosticVirtualTextHint   = { fg = "#8bd5ca", bg = "NONE" },
					DiagnosticVirtualTextOk     = { fg = "#a6da95", bg = "NONE" },
					DiagnosticVirtualLinesError = { fg = "#ed8796", bg = "NONE" },
					DiagnosticVirtualLinesWarn  = { fg = "#eed49f", bg = "NONE" },
					DiagnosticVirtualLinesInfo  = { fg = "#91d7e3", bg = "NONE" },
					DiagnosticVirtualLinesHint  = { fg = "#8bd5ca", bg = "NONE" },
					DiagnosticVirtualLinesOk    = { fg = "#a6da95", bg = "NONE" },
					DiagnosticSignError         = { fg = "#ed8796", bg = "NONE" },
					DiagnosticSignWarn          = { fg = "#eed49f", bg = "NONE" },
					DiagnosticSignInfo          = { fg = "#91d7e3", bg = "NONE" },
					DiagnosticSignHint          = { fg = "#8bd5ca", bg = "NONE" },
					DiagnosticSignOk            = { fg = "#a6da95", bg = "NONE" },
					DiagnosticUnnecessary       = { fg = "", bg = "" },
				}
			end,
		}

		vim.cmd 'colorscheme catppuccin-macchiato'
	end,
} }
