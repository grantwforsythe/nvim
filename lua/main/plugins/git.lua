return {
	{
		"tpope/vim-fugitive",
		version = "v3.*",
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
		version = "v0.*",
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

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map("n", "]c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "]c", bang = true })
					else
						gitsigns.nav_hunk("next")
					end
				end)

				map("n", "[c", function()
					if vim.wo.diff then
						vim.cmd.normal({ "[c", bang = true })
					else
						gitsigns.nav_hunk("prev")
					end
				end)

				-- Actions
				map("n", "<leader>gs", gitsigns.stage_hunk)
				map("n", "<leader>gr", gitsigns.reset_hunk)
				map("v", "<leader>gs", function()
					gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end)
				map("v", "<leader>gr", function()
					gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end)
				map("n", "<leader>gS", gitsigns.stage_buffer)
				map("n", "<leader>gu", gitsigns.undo_stage_hunk)
				map("n", "<leader>gR", gitsigns.reset_buffer)
				map("n", "<leader>gp", gitsigns.preview_hunk)
				map("n", "<leader>gb", function()
					gitsigns.blame_line({ full = true })
				end)
				map("n", "<leader>tb", gitsigns.toggle_current_line_blame)
				map("n", "<leader>gd", gitsigns.diffthis)
				map("n", "<leader>gD", function()
					gitsigns.diffthis("~")
				end)
				map("n", "<leader>td", gitsigns.toggle_deleted)

				-- Text object
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
			end,
		},
	},
}
