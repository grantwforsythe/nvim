return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local builtin = require("telescope.builtin")
		local actions = require("telescope.actions")

		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						["<esc>"] = actions.close,
					},
				},
			},
		})

		vim.keymap.set(
			"n",
			"<leader>pf",
			builtin.find_files,
			{ desc = "Open telescope with a list of non-hidden git files" }
		)

		vim.keymap.set(
			"n",
			"<leader>pb",
			builtin.buffers,
			{ desc = "Open telescope with a list of open buffers" }
		)

		vim.keymap.set(
			"n",
			"<leader>pj",
			builtin.jumplist,
			{ desc = "Open telescope with a list of jumplist" }
		)

		vim.keymap.set(
			"n",
			"<leader>pm",
			builtin.marks,
			{ desc = "Open telescope with a list of marks" }
		)

		vim.keymap.set(
			"n",
			"<leader>pg",
			builtin.live_grep,
			{ desc = "Query for text within all non-hidden git files using telescope" }
		)

		vim.keymap.set("n", "<C-p>", function()
			builtin.git_files({ recurse_submodules = true })
		end, { desc = "Open telescope with a list of all git files" })
	end,
}
