return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		options = {
			theme = "gruvbox",
			disabled_filetypes = { "oil", "NvimTree" },
			component_separators = "",
		},
		sections = {
			lualine_b = { "branch" },
			lualine_c = { "filename", "diagnostics" },
		},
	},
}
