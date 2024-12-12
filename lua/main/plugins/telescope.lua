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
				local finders = require("telescope.finders")
				local pickers = require("telescope.pickers")

				local opts = {}
				opts.cwd = vim.uv.cwd()

				local finder = finders.new_async_job({
					command_generator = function(prompt)
						if not prompt or prompt == "" then
							return nil
						end

						local pieces = vim.split(prompt, "  ")
						-- ripgrep is being used
						local args = { "rg" }

						if pieces[1] then
							table.insert(args, "-e")
							table.insert(args, pieces[1])
						end

						-- File ext
						if pieces[2] then
							table.insert(args, "-g")
							table.insert(args, pieces[2])
						end

						---@diagnostic disable-next-line: deprecated
						return vim.tbl_flatten({
							args,
							{
								"--color=never",
								"--no-heading",
								"--with-filename",
								"--line-number",
								"--column",
								"--smart-case",
							},
						})
					end,
					entry_maker = require("telescope.make_entry").gen_from_vimgrep(opts),
					cwd = opts.cwd,
				})

				local conf = require("telescope.config").values

				pickers
					.new(opts, {
						debounce = 100,
						prompt_title = "Live Grep",
						finder = finder,
						previewer = conf.grep_previewer(opts),
						sorter = require("telescope.sorters").empty(),
					})
					:find()
			end,
			desc = "Query for text within all non-hidden git files using telescope. Add two spaces to global by the file extension",
		},
		{
			"<leader>pt",
			"<cmd>TodoTelescope<CR>",
			desc = "Query for text within all non-hidden git files using telescope",
		},
		{
			"<leader>ph",
			function()
				require("telescope.builtin").help_tags()
			end,
			desc = "Query all help tags",
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
			extensions = {
				fzf = {},
			},
		})

		telescope.load_extension("fzf")
	end,
}
