return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	events = { "BufReadPre", "BufNewFile" },
	opts = { exclude = {
		filetypes = { "go", "lua" },
	} },
	config = function(_, opts)
		require("ibl").setup(opts)
	end,
}
