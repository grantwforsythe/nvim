return {
	{
	"tpope/vim-fugitive",
	version = "v3.*",
	keys = {
		{ "<leader>gg", "<cmd>G<cr>", desc = "Open Git buffer" },
		{ "<leader>gb", "<cmd>G blame<cr>", desc = "Open Git blame buffer" },
		{ "<leader>gA", "<cmd>G add<cr>", desc = "Add all tracked files to staging area" },
		{ "<leader>gc", "<cmd>G commit<cr>", desc = "Commit" },
		{ "<leader>gl", "<cmd>G log<cr>", desc = "Open Git log buffer" },
	},
	}
}
