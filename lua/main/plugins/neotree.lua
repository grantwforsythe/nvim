return {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    branch = "v3.x",
    keys = {
        { '<C-t>', '<cmd>Neotree toggle<cr>', desc = 'Toggle Neotree' },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "ryanoasis/vim-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = {
        filesystem = {
            follow_current_file = true,
            hijack_netrw_behavior = 'open_current'
        }
    }

}
