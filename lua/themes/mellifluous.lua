return {
	{
		"ramojus/mellifluous.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("mellifluous").setup({}) -- optional, see configuration section.
			vim.cmd("colorscheme mellifluous")
		end

	}
}
