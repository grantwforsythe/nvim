return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup()

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end, { desc = "Add current buffer to harpoon list" })

		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Toggle harpoon menu" })

		vim.keymap.set("n", "<leader>1", function()
			harpoon:list():select(1)
		end, { desc = "Select the first buffer in the harpoon menu" })

		vim.keymap.set("n", "<leader>2", function()
			harpoon:list():select(2)
		end, { desc = "Select the second buffer in the harpoon menu" })

		vim.keymap.set("n", "<leader>3", function()
			harpoon:list():select(3)
		end, { desc = "Select the third buffer in the harpoon menu" })

		vim.keymap.set("n", "<leader>4", function()
			harpoon:list():select(4)
		end, { desc = "Select the fourth buffer in the harpoon menu" })

		vim.keymap.set("n", "<Tab>", function()
			harpoon:list():prev()
		end, { desc = "Switch to the previous buffer in the harpoon menu" })

		vim.keymap.set("n", "<S-Tab>", function()
			harpoon:list():next()
		end, { desc = "Switch the next buffer in the harpoon menu" })
	end,
}
