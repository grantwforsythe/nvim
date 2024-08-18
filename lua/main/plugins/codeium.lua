return {
	"Exafunction/codeium.vim",
	version = "1.8.37",
	enabled = false,
	cmd = "Codeium",
	build = ":Codeium Auth",
	event = "BufEnter",
	config = function()
		vim.g.codeium_disable_no_map_tab = 1
		vim.keymap.set("i", "<C-g>", function()
			return vim.fn["codeium#Accept"]()
		end, { expr = true, silent = true, desc = "Accept Coedium's suggestion" })
	end,
}
