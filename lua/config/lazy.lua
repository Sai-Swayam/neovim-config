-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out,                            "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end

vim.opt.rtp:prepend(lazypath)
vim.opt.termguicolors = true


-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- custom highlights
vim.cmd [[
  highlight PmenuSel   guibg=#282C34 guifg=NONE
  highlight Pmenu      guifg=#C5CDD9 guibg=#22252A

  highlight CmpItemAbbrDeprecated  guifg=#7E8294 guibg=NONE gui=strikethrough
  highlight CmpItemAbbrMatch       guifg=#82AAFF guibg=NONE gui=bold
  highlight CmpItemAbbrMatchFuzzy  guifg=#82AAFF guibg=NONE gui=bold
  highlight CmpItemMenu            guifg=#C792EA guibg=NONE gui=italic

  highlight CmpItemKindField      guifg=#EED8DA guibg=#B5585F
  highlight CmpItemKindProperty   guifg=#EED8DA guibg=#B5585F
  highlight CmpItemKindEvent      guifg=#EED8DA guibg=#B5585F

  highlight CmpItemKindText       guifg=#C3E88D guibg=#9FBD73
  highlight CmpItemKindEnum       guifg=#C3E88D guibg=#9FBD73
  highlight CmpItemKindKeyword    guifg=#C3E88D guibg=#9FBD73

  highlight CmpItemKindConstant   guifg=#FFE082 guibg=#D4BB6C
  highlight CmpItemKindConstructor guifg=#FFE082 guibg=#D4BB6C
  highlight CmpItemKindReference  guifg=#FFE082 guibg=#D4BB6C

  highlight CmpItemKindFunction   guifg=#EADFF0 guibg=#A377BF
  highlight CmpItemKindStruct     guifg=#EADFF0 guibg=#A377BF
  highlight CmpItemKindClass      guifg=#EADFF0 guibg=#A377BF
  highlight CmpItemKindModule     guifg=#EADFF0 guibg=#A377BF
  highlight CmpItemKindOperator   guifg=#EADFF0 guibg=#A377BF

  highlight CmpItemKindVariable   guifg=#C5CDD9 guibg=#7E8294
  highlight CmpItemKindFile       guifg=#C5CDD9 guibg=#7E8294

  highlight CmpItemKindUnit       guifg=#F5EBD9 guibg=#D4A959
  highlight CmpItemKindSnippet    guifg=#F5EBD9 guibg=#D4A959
  highlight CmpItemKindFolder     guifg=#F5EBD9 guibg=#D4A959

  highlight CmpItemKindMethod     guifg=#DDE5F5 guibg=#6C8ED4
  highlight CmpItemKindValue      guifg=#DDE5F5 guibg=#6C8ED4
  highlight CmpItemKindEnumMember guifg=#DDE5F5 guibg=#6C8ED4

  highlight CmpItemKindInterface  guifg=#D8EEEB guibg=#58B5A8
  highlight CmpItemKindColor      guifg=#D8EEEB guibg=#58B5A8
  highlight CmpItemKindTypeParameter guifg=#D8EEEB guibg=#58B5A8
]]


-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{ import = "config.plugins" },
		-- colorscheme
		{ import = "themes.catppuccin" },
	},
})
