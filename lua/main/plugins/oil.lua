return {
  'stevearc/oil.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      default_file_explorer = true,
      keymaps = {
        -- Disable because it conflicts with telescope
        ["<C-p>"] = false,
      },
      view_options = {
        show_hidden = true
      }
    })
  end
}
