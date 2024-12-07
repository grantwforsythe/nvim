-- PERF: Figure out why it is so slow
return {
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme gruvbox]])
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = true,
		priority = 1000,
		-- opts = { variant = "moon", dark_variant = "moon" },
		config = function(_, opts)
			require("rose-pine").setup(opts)

			vim.cmd([[colorscheme rose-pine]])
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = true,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme tokyonight]])
		end,
		opts = {},
	},
}
