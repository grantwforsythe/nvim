return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup({
            options = {
                theme = 'gruvbox',
            },
            sections = {
                lualine_a = {
                    {
                        'buffers',
                        show_filename_only = true,
                        show_modified_status = true,
                        mode = 0,
                    }
                }
            }
        })
    end
}
