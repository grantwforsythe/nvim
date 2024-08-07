return {
	"Exafunction/codeium.vim",
	enabled = false,
	version = "1.8.37",
	event = "BufEnter",
	config = function()
		vim.g.codeium_disable_no_map_tab = 1
		vim.keymap.set("i", "<C-g>", function()
			return vim.fn["codeium#Accept"]()
		end, { expr = true, silent = true })
	end,
}
