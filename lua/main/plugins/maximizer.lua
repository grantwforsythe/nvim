return {
	"szw/vim-maximizer",
	keys = {
		{ "<leader>m", "<cmd>MaximizerToggle<CR>", desc = "Maximize/minimize split" },
	},
	cond = function()
		return not vim.g.vscode
	end,
}
