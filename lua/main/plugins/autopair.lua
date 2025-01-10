-- -- PERF: Improve the performance of this plugin. Perhaps it can be replaced with a luasnip
return {
	{
		"windwp/nvim-autopairs",
		event = { "InsertEnter" },
		dependencies = {
			"hrsh7th/nvim-cmp",
		},
		opts = {
			fast_warp = {},
			disable_filetype = { "TelescopePrompt", "vim" },
			check_ts = true, -- enable treesitter
			ts_config = {
				lua = { "string" }, -- don't add pairs in lua string treesitter nodes
				javascript = { "template_string" }, -- don't add pairs in javscript template_string treesitter nodes
				typescript = { "template_string" }, -- don't add pairs in typescript template_string treesitter nodes
				java = false, -- don't check treesitter on java
			},
		},
		config = function(_, opts)
			require("nvim-autopairs").setup(opts)

			-- make autopairs and completion work together
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
	{
		"kylechui/nvim-surround",
		version = "2.*",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	},
}
