return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		-- TODO: Fix UI bug
		menu = {
			width = vim.api.nvim_win_get_width(0) - 4,
		},
		settings = {
			save_on_toggle = true,
		},
	},
	keys = function()
		local keys = {
			{
				"<leader>h",
				function()
					require("harpoon"):list():add()
				end,
				desc = "Harpoon File",
			},
			{
				"<C-h>",
				function()
					local harpoon = require("harpoon")
					harpoon.ui:toggle_quick_menu(harpoon:list())
				end,
				desc = "Harpoon Quick Menu",
			},
			{
				"<Tab>",
				function()
					require("harpoon"):list():prev()
				end,
				desc = "Switch to the previous buffer in the harpoon menu",
			},
			{
				"<S-Tab>",
				function()
					require("harpoon"):list():next()
				end,
				desc = "Switch to the next buffer in the harpoon menu",
			},
		}

		for i = 1, 5 do
			table.insert(keys, {
				"<leader>" .. i,
				function()
					require("harpoon"):list():select(i)
				end,
				desc = "Harpoon to File " .. i,
			})
		end
		return keys
	end,
}
