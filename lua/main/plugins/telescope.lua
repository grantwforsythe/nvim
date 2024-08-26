return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.7",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- Improve the sorting performance for Telescope
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	keys = {
		{
			"<leader>pf",
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "Open telescope with a list of non-hidden git files",
		},
		{
			"<leader>pb",
			function()
				require("telescope.builtin").buffers()
			end,
			desc = "Open telescope with a list of open buffers",
		},
		{
			"<leader>pj",
			function()
				require("telescope.builtin").jumplist()
			end,
			desc = "Open telescope with a list of jumplist",
		},
		{
			"<leader>pm",
			function()
				require("telescope.builtin").marks()
			end,
			desc = "Open telescope with a list of marks",
		},
		{
			"<leader>pg",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "Query for text within all non-hidden git files using telescope",
		},
		{
			"<leader>pt",
			"<cmd>TodoTelescope<CR>",
			desc = "Query for text within all non-hidden git files using telescope",
		},
		{
			"<C-p>",
			function()
				require("telescope.builtin").git_files({ recurse_submodules = true })
			end,
			desc = "Open telescope with a list of all git files",
		},
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<esc>"] = actions.close,
					},
				},
			},
		})

		telescope.load_extension("fzf")
	end,
}
