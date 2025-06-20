return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<leader>t", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file tree" },
	},
	opts = {
		sort = {
			sorter = "case_sensitive",
		},
		view = {
			width = 30,
			side = "right",
		},
		renderer = {
			group_empty = true,
		},
		filters = {
			dotfiles = true,
		},
	},
}
