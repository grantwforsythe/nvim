-- PERF: Disabled because it was slowing down startup time
return {
	"akinsho/bufferline.nvim",
	enabled = false,
	version = "v4.*",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		options = {
			diagnostics = "nvim_lsp",
			diagnostics_indicator = function(count, level, diagnostics_dict, context)
				local icon = level:match("error") and " " or " "

				return " " .. icon .. count
			end,
			separator_style = "slope",
		},
	},
}
