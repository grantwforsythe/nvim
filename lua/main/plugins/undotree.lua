return {
	"mbbill/undotree",
	keys = {
		{ "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Undotree" },
	},
	config = function()
		if vim.loop.os_uname().sysname == "Windows_NT" then
			vim.g.undotree_DiffCommand = "FC"
		end
	end,
}
