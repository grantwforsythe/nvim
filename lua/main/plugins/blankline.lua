return {
	-- TODO: Add event
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	events = { "BufReadPre", "BufNewFile" },
	opts = {},
	config = function(_, opts)
		require("ibl").setup(opts)
	end,
}
