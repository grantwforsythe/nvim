return {
	"nvim-tree/nvim-tree.lua",
	keys = {
		{
			"<leader>t",
			"<cmd>NvimTreeToggle<cr>",
			desc = "Toggle filetree",
		},
	},
	opts = {
		view = {
			side = "right",
			width = 30,
		},
	},
}
