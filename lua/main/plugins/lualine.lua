-- PERF: Disabled because it was slowing down start up time
return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lazy_status = require("lazy.status")

		require("lualine").setup({
			options = {
				theme = "gruvbox",
				disabled_filetypes = { "oil", "NvimTree" },
				component_separators = "|",
			},
			sections = {
				lualine_a = {
					{
						"mode",
						fmt = function(str)
							return str:sub(1, 1)
						end,
					},
				},
				lualine_b = {
					{
						"branch",
						fmt = function(str)
							if vim.api.nvim_strwidth(str) > 40 then
								return ("%s..."):format(str:sub(1, 39))
							else
								return str
							end
						end,
					},
				},
				lualine_c = { "filename", "diff", "diagnostics" },
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
