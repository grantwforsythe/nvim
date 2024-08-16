return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			{
				"theHamsta/nvim-dap-virtual-text",
				opts = {},
			},
		},
		keys = {
			{
				"<F5>",
				function()
					require("dap").continue()
				end,
				desc = "Continue",
			},
			{
				"<F10>",
				function()
					require("dap").step_over()
				end,
				desc = "Step over",
			},
			{
				"<F11>",
				function()
					require("dap").step_into()
				end,
				desc = "Step into",
			},
			{
				"<F12>",
				function()
					require("dap").step_out()
				end,
				desc = "Step out",
			},
			{
				"<leader>b",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "Place a breakpoint",
			},
			{
				"<leader>B>",
				function()
					require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
				end,
				desc = "Place a conditional breakpoint",
			},
		},
		config = function()
			local vscode = require("dap.ext.vscode")

			-- Extend dap configurations from .vscode/launch.json
			if vim.fn.filereadable(".vscode/launch.json") then
				vscode.load_launchjs()
			end

			vim.fn.sign_define(
				"DapBreakpoint",
				{ text = "🔴", texthl = "", linehl = "", numhl = "" }
			)
			vim.fn.sign_define(
				"DapStopped",
				{ text = "▶️", texthl = "", linehl = "", numhl = "" }
			)
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"nvim-neotest/nvim-nio",
		},
		keys = {
			{
				"<leader>?",
				function()
					require("dapui").eval(nil, { enter = true })
				end,
				desc = "Evaluate a statement in the debugger",
				mode = { "n", "v" },
			},
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end
		end,
	},
	{
		"leoluz/nvim-dap-go",
		dependencies = { "mfussenegger/nvim-dap" },
		config = function()
			require("dap-go").setup()
		end,
		ft = "go",
		keys = {
			{
				"<leader>dgt",
				"<cmd>lua require('dap-go').debug_test()<CR>",
				desc = "Debug the closet method above the cursor you can run",
			},
			{
				"<leader>dgl",
				"<cmd>lua require('dap-go').debug_last_test()<CR>",
				desc = "Debug the last test that ran",
			},
		},
	},
}
