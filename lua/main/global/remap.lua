vim.keymap.set('n', "<leader>pv", vim.cmd.Ex, { desc = 'Switch to directory view' })

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move highlighted line(s) down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move highlighted line(s) up' })

vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Append the previous line to the current line w/o repositioning your cursor' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Half page down and keep cursor in the middle' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Half page up and keep cursor in the middle' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Keep cursor in the middle when searching forwards from cursor' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Keep cursor in the middle when searching backwards from cursor' })

-- TODO: Figure out why this remap is slow
-- I think it is because I have something else bound to <leader>p so nvim is listening a few seconds for the next keystroke
vim.keymap.set('x', '<leader>p', '\'_dP', { desc = 'Do not replace copied text with deleted text' })

vim.keymap.set('n', '<leader>y', '\'+y', { desc = 'Copy into system clipboard' })
vim.keymap.set('v', '<leader>y', '\'+y', { desc = 'Copy into system clipboard' })
vim.keymap.set('n', '<leader>y', '\'+Y', { desc = 'Copy into system clipboard' })

vim.keymap.set('n', '<leader>d', '\'_d', { desc = 'Delete to void registry' })
vim.keymap.set('v', '<leader>d', '\'_d', { desc = 'Delete to void registry' })

vim.keymap.set('n', 'Q', '<nop>', { desc = 'Disabled' })
vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')

-- Quickfix list
vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz', { desc = 'Go to next quickfix item' })
vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz', { desc = 'Go to previous quickfix item' })

-- Location list
vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz', { desc = 'Go to next location list item' })
vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz', { desc = 'Go to previous location list item' })

-- vim.keymap.set('n', '<C-t>', '<cmd>20Lexplore<CR>', { desc = 'Open file explorer vertically to the left' })

vim.keymap.set(
    'n',
    '<leader>s',
    [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = 'Find and replace all of the words your cursors is on' }
)

vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { desc = 'Make current file executable', silent = true })
