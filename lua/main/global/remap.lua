vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move highlighted line(s) up" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move highlighted line(s) down" })

vim.keymap.set(
	"n",
	"J",
	"mzJ`z",
	{ desc = "Append the previous line to the current line w/o repositioning your cursor" }
)
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down and keep cursor in the middle" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up and keep cursor in the middle" })
vim.keymap.set(
	"n",
	"n",
	"nzzzv",
	{ desc = "Keep cursor in the middle when searching forwards from cursor" }
)
vim.keymap.set(
	"n",
	"N",
	"Nzzzv",
	{ desc = "Keep cursor in the middle when searching backwards from cursor" }
)

vim.keymap.set(
	"x",
	"<leader>p",
	[["_dP]],
	{ desc = "Do not replace copied text with deleted text" }
)

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy into system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy into system clipboard" })

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete to void registry" })

vim.keymap.set("n", "Q", "<nop>", { desc = "Disabled" })
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Quickfix list
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz", { desc = "Go to next quickfix item" })
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz", { desc = "Go to previous quickfix item" })

-- Location list
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Go to next location list item" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Go to previous location list item" })

vim.keymap.set(
	"n",
	"<leader>s",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Find and replace all of the words your cursors is on" }
)

vim.keymap.set(
	"n",
	"<leader>xx",
	"<cmd>!chmod +x %<CR>",
	{ desc = "Make current file executable", silent = true }
)

-- Window navigation
vim.keymap.set({ "t", "i" }, "<A-h>", [[<C-\><C-N><C-w>h]])
vim.keymap.set({ "t", "i" }, "<A-j>", [[<C-\><C-N><C-w>j]])
vim.keymap.set({ "t", "i" }, "<A-k>", [[<C-\><C-N><C-w>k]])
vim.keymap.set({ "t", "i" }, "<A-l>", [[<C-\><C-N><C-w>l]])

vim.keymap.set("n", "<A-h>", "<C-w>h")
vim.keymap.set("n", "<A-j>", "<C-w>j")
vim.keymap.set("n", "<A-k>", "<C-w>k")
vim.keymap.set("n", "<A-l>", "<C-w>l")

vim.keymap.set("t", "<ESC>", [[<C-\><C-n>]], { desc = "Enter command mode" })
