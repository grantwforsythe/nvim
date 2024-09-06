local custom_buffer = vim.api.nvim_create_augroup("custom_buffer", { clear = true })

-- Stop continuous comments
vim.api.nvim_create_autocmd("FileType", {
	group = custom_buffer,
	pattern = "*",
	command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
})

-- Highlight yanks
vim.api.nvim_create_autocmd("TextYankPost", {
	group = custom_buffer,
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ timeout = 200 })
	end,
})

-- Enter insert mode when starting a new terminal buffer
vim.api.nvim_create_autocmd("TermOpen", {
	group = custom_buffer,
	pattern = "*",
	command = "startinsert",
})
