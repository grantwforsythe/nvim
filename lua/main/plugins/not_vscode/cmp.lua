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
		"hrsh7th/nvim-cmp",
		lazy = true,
		event = "InsertEnter",
		priority = 100,
		dependencies = {
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"onsails/lspkind.nvim",
		},
		config = function()
			-- auto completion
			local cmp = require("cmp")
			local cmp_select = {
				behavior = cmp.SelectBehavior.Select,
			}

			-- Load vscode's default snippets
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				-- Preselect first option
				preselect = "item",
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				formatting = {
					format = require("lspkind").cmp_format({
						mode = "symbol_text",
						-- menu = {
						-- 	buffer = "[Buffer]",
						-- 	nvim_lsp = "[LSP]",
						-- 	luasnip = "[LuaSnip]",
						-- 	nvim_lua = "[Lua]",
						-- },
					}),
				},
				sources = {
					{ name = "nvim_lua" },
					{ name = "nvim_lsp" },
					{ name = "nvim_lsp_signature_help" },
					{ name = "path" },
					{ name = "luasnip" },
					{ name = "buffer", keyword_length = 5 },
				},
				mapping = cmp.mapping.preset.insert({
					-- ["<C-Space>"] = cmp.mapping.complete(),
					-- ["<CR>"] = cmp.mapping.confirm({
					-- 	select = true,
					-- 	behavior = cmp.ConfirmBehavior.Insert,
					-- }),
					["<C-u>"] = cmp.mapping.scroll_docs(-4),
					["<C-d>"] = cmp.mapping.scroll_docs(4),
					-- ["<C-f>"] = cmp_action.luasnip_jump_forward(),
					-- ["<C-b>"] = cmp_action.luasnip_jump_backward(),
					["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
					["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
					["<C-y>"] = cmp.mapping.complete(), -- show completion suggestions
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					-- ["<Tab>"] = cmp_action.luasnip_supertab(),
					-- ["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
				}),
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
			})

			-- `/` cmdline setup.
			cmp.setup.cmdline("/", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			-- `:` cmdline setup.
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{
						name = "cmdline",
						option = {
							ignore_cmds = { "Man", "!" },
						},
					},
				}),
			})
		end,
	},
}
