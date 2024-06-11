return {
    'Exafunction/codeium.vim',
    enabled = true,
    version = '1.8.37',
    event = 'BufEnter',
    config = function()
        vim.keymap.set('i', '<C-g>', function()
            return vim.fn['codeium#Accept']()
        end, { expr = true, silent = true})
    end
}
