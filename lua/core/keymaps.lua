vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local set = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Basic
set("n", "<space><space>x", "<cmd>source %<CR>")
set("n", "<space>x", ":.lua<CR>")
set("v", "<space>x", ":lua<CR>")
set("i", "<C-o>", "<Esc>o")
set("n", "gg", "gg0")
set("i", "<C-/>", "<Esc>gcc", { remap = true })

-- Toggle copilot autocompletion
set("n", "<leader>cp", function()
	vim.g.copilot_enabled = not vim.g.copilot_enabled
	_G.show_copilot_autocomplete_status()
end)

-- Oil
set("n", "-", "<cmd>Oil<CR>")

-- Delete single character without copying into register
set('n', 'x', '"_x', opts)

-- Buffers
set('n', '<Tab>', ':bnext<CR>', opts)
set('n', '<S-Tab>', ':bprev<CR>', opts)
set('n', '<leader>bx', ':bdelete!<CR>', opts)
set('n', '<leader>bs', ':b#<CR>', opts)

-- Vertical scroll and center
set('n', '<C-d>', '<C-d>zz', opts)
set('n', '<C-u>', '<C-u>zz', opts)

-- Resize with arrows
set('n', '<C-Left>', '<c-w>5<')
set('n', '<C-Right>', '<c-w>5>')
set('n', '<C-Up>', '<C-W>+')
set('n', '<C-Down>', '<C-W>-')

-- Keep last yanked when pasting
set('v', 'p', '"_dP', opts)

-- Stay in indent mode
set('v', '<', '<gv', opts)
set('v', '>', '>gv', opts)

-- Diagnostic keymaps
set('n', '[d', function()
	vim.diagnostic.jump { count = -1, float = true }
end, { desc = 'Go to previous diagnostic message' })
set('n', ']d', function()
	vim.diagnostic.jump { count = 1, float = true }
end, { desc = 'Go to next diagnostic message' })
set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Terminal
-- vim.api.nvim_set_keymap('t', '<C-space>', '<C-\\><C-n>', { noremap = true })
vim.api.nvim_set_keymap("t", "<Esc>", [[<C-\><C-n>]], { noremap = true })
local job_id = 0
set("n", "<space>tm", function()
	-- vim.cmd.vnew()
	vim.cmd.enew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	-- vim.api.nvim_win_set_height(0, 19)
	vim.cmd.startinsert()
	job_id = vim.bo.channel
end)

-- Run Programs
