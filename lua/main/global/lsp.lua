vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})

vim.keymap.set("n", "<leader>vd", function()
	vim.diagnostic.open_float()
end, {
	remap = false,
	desc = "Display diagnostic for the buffer in a floating window",
})

vim.keymap.set("n", "[d", function()
	vim.diagnostic.goto_next()
end, {
	remap = false,
	desc = "Move to the next diagnostic in the buffer",
})

vim.keymap.set("n", "]d", function()
	vim.diagnostic.goto_prev()
end, {
	remap = false,
	desc = "Move to the previous diagnostic in the buffer",
})

vim.keymap.set("n", "<leader>vca", function()
	vim.lsp.buf.code_action()
end, {
	remap = false,
	desc = "Select a code action available at the current cursor position",
})

vim.keymap.set("n", "<leader>vrr", function()
	vim.lsp.buf.references()
end, {
	remap = false,
	desc = "List all of the references to a symbol under the cursor in a quickfx window",
})

vim.keymap.set("n", "<leader>vrn", function()
	vim.lsp.buf.rename()
end, {
	remap = false,
	desc = "Rename all references to a symbol under the cursor",
})

vim.lsp.enable({ "lua_ls", "gopls" })

vim.diagnostic.config({
	-- virtual_lines = true,
	virtual_text = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = true,
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = "ErrorMsg",
			[vim.diagnostic.severity.WARN] = "WarningMsg",
		},
	},
})
