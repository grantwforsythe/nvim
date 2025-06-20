return {
	"numToStr/Comment.nvim",
	dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
	events = { "BufReadPre", "BufNewFile" },
	config = function()
		-- Include treesitter context commentstring
		local ts_context_commentstring =
			require("ts_context_commentstring.integrations.comment_nvim")

		require("Comment").setup({
			pre_hook = ts_context_commentstring.create_pre_hook(),
		})
	end,
}
