return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lazy_status = require("lazy.status")

		require("lualine").setup({
			options = {
				theme = "gruvbox",
				disabled_filetypes = { "oil", "NvimTree" },
				component_separators = "",
			},
			sections = {
				lualine_b = { "branch" },
				lualine_c = { "filename", "diagnostics" },
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#FF9E64" },
					},
					"encoding",
					"fileformat",
					{ "filetype", icon_only = true },
				},
			},
		})
	end,
}
