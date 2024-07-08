return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup({
            options = {
                theme = 'gruvbox',
            },
            sections = {
                -- TODO: Only want to show 3 buffers at a time
                -- TODO: Add a TODO tree plugin
                -- TODO: See if there is a keymap to cycle buffers
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
