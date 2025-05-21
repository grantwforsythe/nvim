return { {
	"grantwforsythe/ng-switch.nvim",
	opts = {},
	keys = {
		{ "<leader>nh", "<cmd>NgSwitchHTML<CR>", desc = "Switch to HTML file", noremap = true, silent = true },
		{ "<leader>nt", "<cmd>NgSwitchTS<CR>", desc = "Switch to TypeScript file", noremap = true, silent = true },
		{ "<leader>ns", "<cmd>NgSwitchSpec<CR>", desc = "Switch to Spec file", noremap = true, silent = true },
		{ "<leader>nc", "<cmd>NgSwitchCSS<CR>", desc = "Switch to Style file", noremap = true, silent = true },
	}
} }
