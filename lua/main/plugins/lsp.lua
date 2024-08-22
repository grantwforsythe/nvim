-- PERF: Refactor so that we can improve the load time
return {
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		lazy = true,
		config = false,
		init = function()
			-- Disable automatic setup
			vim.g.lsp_zero_extend_cmp = 0
			vim.g.lsp_zero_extend_lspconfig = 0
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		lazy = false,
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
			local lsp_zero = require("lsp-zero")
			lsp_zero.extend_cmp()

			-- auto completion
			local cmp = require("cmp")
			local cmp_action = lsp_zero.cmp_action()
			local cmp_select = {
				behavior = cmp.SelectBehavior.Select,
			}

			-- Load vscode's default snippets
			require("luasnip.loaders.from_vscode").lazy_load()

			local lspkind = require("lspkind")

			cmp.setup({
				-- Preselect first option
				preselect = "item",
				completion = {
					completeopt = "menu,menuone,noinsert",
				},
				formatting = {
					format = lspkind.cmp_format({
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
					["<CR>"] = cmp.mapping.confirm({
						select = true,
						behavior = cmp.ConfirmBehavior.Replace,
					}),
					["<C-u>"] = cmp.mapping.scroll_docs(-4),
					["<C-d>"] = cmp.mapping.scroll_docs(4),
					-- ["<C-f>"] = cmp_action.luasnip_jump_forward(),
					["<C-b>"] = cmp_action.luasnip_jump_backward(),
					["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
					["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
					["<C-y>"] = cmp.mapping.confirm({ select = false }),
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
	{
		"neovim/nvim-lspconfig",
		cmd = "LspInfo",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"b0o/schemastore.nvim",
		},
		config = function()
			local lsp_zero = require("lsp-zero")
			lsp_zero.extend_lspconfig()

			lsp_zero.on_attach(function(client, bufnr)
				-- see :help lsp-zero-keybindings
				-- to learn the available actions
				lsp_zero.default_keymaps({
					buffer = bufnr,
				})

				vim.keymap.set("n", "gd", function()
					vim.lsp.buf.definition()
				end, { remap = false, buffer = bufnr, desc = "Go to definition" })

				vim.keymap.set("n", "K", function()
					vim.lsp.buf.hover()
				end, {
					remap = false,
					buffer = bufnr,
					desc = "Display hover information about the symbol under the cursor",
				})

				vim.keymap.set("n", "<leader>vws", function()
					vim.lsp.buf.workspace_symbol()
				end, {
					remap = false,
					buffer = bufnr,
					desc = "Display all of the workspace symbols in a quickfix lists",
				})

				vim.keymap.set("n", "<leader>vd", function()
					vim.diagnostic.open_float()
				end, {
					remap = false,
					buffer = bufnr,
					desc = "Display diagnostic for the buffer in a floating window",
				})

				vim.keymap.set("n", "[d", function()
					vim.diagnostic.goto_next()
				end, {
					remap = false,
					buffer = bufnr,
					desc = "Move to the next diagnostic in the buffer",
				})

				vim.keymap.set("n", "]d", function()
					vim.diagnostic.goto_prev()
				end, {
					remap = false,
					buffer = bufnr,
					desc = "Move to the previous diagnostic in the buffer",
				})

				vim.keymap.set("n", "<leader>vca", function()
					vim.lsp.buf.code_action()
				end, {
					remap = false,
					buffer = bufnr,
					desc = "Select a code action available at the current cursor position",
				})

				vim.keymap.set("n", "<leader>vrr", function()
					vim.lsp.buf.references()
				end, {
					remap = false,
					buffer = bufnr,
					desc = "List all of the references to a symbol under the cursor in a quickfx window",
				})

				vim.keymap.set("n", "<leader>vrn", function()
					vim.lsp.buf.rename()
				end, {
					remap = false,
					buffer = bufnr,
					desc = "Rename all references to a symbol under the cursor",
				})

				vim.keymap.set("i", "<C-h>", function()
					vim.lsp.buf.signature_help()
				end, {
					remap = false,
					buffer = bufnr,
					desc = "Dsplay signature information for the symbol under the cursor in a floating window",
				})
			end)

			require("mason").setup({ log_level = vim.log.levels.DEBUG })
			require("mason-lspconfig").setup({
				ensure_installed = {
					"tsserver",
					"eslint",
					"angularls",
					"emmet_ls",
					"gopls",
					"jsonls",
				},
				handlers = {
					-- this first function is the "default handler"
					-- it applies to every language server without a "custom handler"
					function(server_name)
						require("lspconfig")[server_name].setup({})
					end,
					-- this is the "custom handler" for 'lua_ls'
					lua_ls = function()
						local lua_opts = lsp_zero.nvim_lua_ls()
						require("lspconfig").lua_ls.setup(lua_opts)
					end,
					jsonls = function()
						require("lspconfig").jsonls.setup({
							settings = {
								json = {
									schemas = require("schemastore").json.schemas(),
									validate = { enable = true },
								},
							},
						})
					end,
					emmet_ls = function()
						local capabilities = vim.lsp.protocol.make_client_capabilities()
						capabilities.textDocument.completion.completionItem.snippetSupport = true

						require("lspconfig").emmet_ls.setup({
							capabilities = capabilities,
							filetypes = {
								"css",
								"html",
								"javascriptreact",
								"less",
								"sass",
								"scss",
								"typescriptreact",
							},
							init_options = {
								html = {
									options = {
										-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
										["bem.enabled"] = true,
									},
								},
							},
						})
					end,
				},
			})
		end,
	},
}
