require("main.global.autocmds")
require("main.global.set")
require("main.global.remap")
require("main.global.lsp")

-- Install lazy if it is not already installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath) -- This file can be loaded by calling `lua require('plugins')` from your init.vim

require("lazy").setup({
	spec = {
		{ import = "main.plugins.not_vscode", cond = not vim.g.vscode },
		{ import = "main.plugins.always" },
		-- { import = "main.plugins.vscode", cond = vim.g.vscode },
	},
	pkg = {
		sources = {
			"lazy",
		},
	},
	ui = {
		border = "rounded",
	},
	checker = {
		-- Automatically check for plugin updates
		enabled = false,
		notify = false,
	},
	change_detection = {
		-- Automatically check for UI change
		enabled = true,
		notify = false,
	},
	-- Display Luarocks...I might need this at some point
	rocks = {
		enabled = false,
	},
	git = {
		throttle = {
			enabled = false,
		},
	},
})
