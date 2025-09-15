require("config.lazy")

vim.opt.shiftwidth = 2
vim.opt.clipboard = "unnamedplus"
vim.opt.cmdheight = 0

vim.o.shell = "pwsh"
vim.o.tabstop = 4
vim.wo.fillchars = 'eob: '
-- vim.o.undofile = true

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")
vim.keymap.set("n", "-", "<cmd>Oil<CR>")
vim.api.nvim_set_keymap('t', '<C-space>', '<C-\\><C-n>', { noremap = true })


local job_id = 0
vim.keymap.set("n", "<space>tm", function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")
	vim.api.nvim_win_set_height(0, 5)

	job_id = vim.bo.channel
end)

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
