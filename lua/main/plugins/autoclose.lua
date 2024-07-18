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
	{
		"windwp/nvim-ts-autotag",
		config = true,
	},
}
