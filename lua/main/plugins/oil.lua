return {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    opts = {
        default_file_explorer = true,
        skip_confirm_for_simple_edits = true,
        keymaps = {
            -- Disable because it conflicts with telescope
            ["<C-p>"] = false,
        },
        view_options = {
            show_hidden = true,
            is_always_hidden = function(name, _)
                return name == ".git" or name == ".."
            end
        },
    },
    keys = {
        { "-", "<CMD>Oil<CR>", desc = "Open parent directory" },
    },
}
