return {
	{
		"m4xshen/autoclose.nvim",
		opts = {
			keys = {
				['"'] = { escape = true, close = false, pair = '""' },
				["'"] = { escape = true, close = false, pair = "''" },
			},
			options = {
				disabled_filetypes = { "text", "markdown" },
				disable_command_mode = true,
			},
		},
	},
	-- PERF: Improve the performance of this plugin. Perhaps it can be replaced with a luasnip
	{
		"windwp/nvim-ts-autotag",
		events = { "BufReadPre", "BufNewFile" },
		opts = {},
		ft = { "html", "jsx", "tsx" },
	},
}
