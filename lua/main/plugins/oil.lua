local git_ignored = setmetatable({}, {
	__index = function(self, key)
		local proc = vim.system(
			{ "git", "ls-files", "--ignored", "--exclude-standard", "--others", "--directory" },
			{
				cwd = key,
				text = true,
			}
		)
		local result = proc:wait()
		local ret = {}
		if result.code == 0 then
			for line in vim.gsplit(result.stdout, "\n", { plain = true, trimempty = true }) do
				-- Remove trailing slash
				line = line:gsub("/$", "")
				table.insert(ret, line)
			end
		end

		rawset(self, key, ret)
		return ret
	end,
})

return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
	enabled = false,
	opts = {
		default_file_explorer = true,
		skip_confirm_for_simple_edits = true,
		keymaps = {
			-- Disable because it conflicts with telescope
			["<C-p>"] = false,
			-- Disable because it conflicts with harpoon
			["<C-h>"] = false,
		},
		view_options = {
			is_hidden_file = function(name, _)
				-- Ignore the parent directory
				if name == ".." then
					return true
				end
				local dir = require("oil").get_current_dir()
				-- if no local directory (e.g. for ssh connections), always show
				if not dir then
					return false
				end
				-- Check if file is gitignored
				return vim.list_contains(git_ignored[dir], name)
			end,
		},
		is_always_hidden = function(name, _)
			return name == ".git" or name == ".."
		end,
	},
	keys = {
		{ "-", "<CMD>Oil<CR>", desc = "Open parent directory" },
	},
}
