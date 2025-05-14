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
	},
	{
		"kdheepak/lazygit.nvim",
		lazy = true,
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		cond = function()
			return not vim.g.vscode
		end,
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		-- https://github.com/lewis6991/gitsigns.nvim/issues/1092#issuecomment-2403266376
		commit = "b8cf5e8efaa0036d493a2e2dfed768c3a03fac73",
		-- version = "v0.*",
		cond = function()
			return not vim.g.vscode
		end,
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "-" },
			},
			signs_staged = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "-" },
			},
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")

				vim.keymap.set("n", "]c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
					else
						gitsigns.nav_hunk("next")
					end
				end, { desc = "Move to next hunk" })

				vim.keymap.set("n", "[c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
					else
						gitsigns.nav_hunk("prev")
					end
				end, { desc = "Move to previous hunk" })

				vim.keymap.set("n", "<leader>gs", gitsigns.stage_hunk, { desc = "Stage hunk" })
				vim.keymap.set(
					"n",
					"<leader>gu",
					gitsigns.undo_stage_hunk,
					{ desc = "Unstage hunk" }
				)
				vim.keymap.set("n", "<leader>gr", gitsigns.reset_hunk, { desc = "Rest hunk" })
				vim.keymap.set("n", "<leader>gp", gitsigns.preview_hunk, { desc = "Preview hunk" })

				vim.keymap.set("v", "<leader>gs", function()
					gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "Stage hunk" })
				vim.keymap.set("v", "<leader>gr", function()
					gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "Reset hunk" })

				vim.keymap.set("n", "<leader>gS", gitsigns.stage_buffer, { desc = "Stage buffer" })
				vim.keymap.set("n", "<leader>gR", gitsigns.reset_buffer, { desc = "Reset buffer" })

				vim.keymap.set("n", "<leader>gB", function()
					gitsigns.toggle_current_line_blame()
				end, { desc = "Toggle current line blame" })

				vim.keymap.set("n", "<leader>gd", gitsigns.diffthis, { desc = "Diff this" })
			end,
		},
	},
}
