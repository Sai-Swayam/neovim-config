vim.cmd('noh')
vim.o.background = "light"
vim.opt.hlsearch = false

local green = "#68f324"

-- Core
-- vim.api.nvim_set_hl(0, "Normal", { fg = "#fb9b10", bg = "#170900" })
vim.api.nvim_set_hl(0, "Normal", { fg = green, bg = "#ffffff" })
vim.api.nvim_set_hl(0, "NormalFloat", { fg = green, bg = "#ffffff" })

-- Syntax
vim.api.nvim_set_hl(0, "@variable", { fg = green })
vim.api.nvim_set_hl(0, "Comment", { fg = green })
vim.api.nvim_set_hl(0, "String", { fg = green, })
vim.api.nvim_set_hl(0, "Keyword", { fg = green, })
vim.api.nvim_set_hl(0, "Function", { fg = green, })
vim.api.nvim_set_hl(0, "Identifier", { fg = green, })
vim.api.nvim_set_hl(0, "Type", { fg = green, })
vim.api.nvim_set_hl(0, "Constant", { fg = green, })
vim.api.nvim_set_hl(0, "Number", { fg = green, })
vim.api.nvim_set_hl(0, "Float", { fg = green, })
vim.api.nvim_set_hl(0, "Boolean", { fg = green, })
vim.api.nvim_set_hl(0, "Operator", { fg = green, })
vim.api.nvim_set_hl(0, "Include", { fg = green, })
vim.api.nvim_set_hl(0, "cDefine", { fg = green, })

vim.api.nvim_set_hl(0, "Conditional", { fg = green, })
vim.api.nvim_set_hl(0, "Statement", { fg = "#5eff6c", })
vim.api.nvim_set_hl(0, "Label", { fg = "#5eff6c", })
vim.api.nvim_set_hl(0, "Special", { fg = "#5eff6c", })
vim.api.nvim_set_hl(0, "SpecialChar", { fg = "#5eff6c", })

-- UI
vim.api.nvim_set_hl(0, "LineNr", { fg = "#ffffff", bg = green, })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#d75103", })
vim.api.nvim_set_hl(0, "Visual", { bg = "#3a3a3a", })
vim.api.nvim_set_hl(0, "Search", { fg = "#1e1e1e", bg = "#d75103", })
vim.api.nvim_set_hl(0, "IncSearch", { fg = "#1e1e1e", bg = "#ffb86c", })

-- Status / tabs
-- vim.api.nvim_set_hl(0, "StatusLine", { fg = "#ec9603", bg = "#100904", })
vim.api.nvim_set_hl(0, "StatusLine", { fg = "#1a471e", bg = green, })
vim.api.nvim_set_hl(0, "TabLine", { fg = "#888888", bg = "#100904", })
vim.api.nvim_set_hl(0, "TabLineSel", { fg = "#853400", bg = "#1e1e1e", })
vim.api.nvim_set_hl(0, "CmdLine", { fg = "#1e1e1e", bg = "#ffffff", })

-- Diagnostics
vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#f7766a", })
vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#e0af68", })
vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#7aa2f7", })
vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#73daca", })

vim.g.colors_name = "retro-green-light"
