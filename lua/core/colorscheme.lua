local default = "kanagawa-wave"
local file = vim.fn.stdpath("data") .. "/colorscheme"

local transparent = false
local original_bg = {}

local groups = {
	"Normal",
	"NormalFloat",
	"SignColumn",
	"FoldColumn",
	"EndOfBuffer",
}

local function load()
	local f = io.open(file, "r")
	if f then
		local scheme = f:read("*l")
		f:close()
		if scheme and scheme ~= "" then
			return scheme
		end
	end
	return default
end

vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		local f = io.open(file, "w")
		if f then
			f:write(vim.g.colors_name)
			f:close()
		end
	end,
})

vim.cmd.colorscheme(load())

vim.keymap.set("n", "<leader>tt", function()
	transparent = not transparent

	for _, group in ipairs(groups) do
		if transparent then
			original_bg[group] = vim.api.nvim_get_hl(0, { name = group }).bg
			vim.api.nvim_set_hl(0, group, { bg = "NONE" })
		else
			vim.api.nvim_set_hl(0, group, {
				bg = original_bg[group],
			})
		end
	end
end)
