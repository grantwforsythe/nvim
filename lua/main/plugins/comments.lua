-- NOTE: This plugin might not be necessary with neovim's commentstrings
return {
	"numToStr/Comment.nvim",
	enabled = false,
	dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
	events = { "BufReadPre", "BufNewFile" },
	config = function()
		local ts_context_commentstring =
			require("ts_context_commentstring.integrations.comment_nvim")

		require("Comment").setup({
			-- for commenting tsx, jsx, html files
			pre_hook = ts_context_commentstring.create_pre_hook(),
		})
	end,
}
