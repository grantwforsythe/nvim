-- Fuzy finding
return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.6',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
      local builtin = require('telescope.builtin')
      local actions = require('telescope.actions')

      require('telescope').setup{
          defaults = {
              mappings = {
                  i = {
                      ["<esc>"] = actions.close
                  }
              }
          }
      }

      vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
      vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>pj', builtin.jumplist, {})
      vim.keymap.set('n', '<leader>pm', builtin.marks, {})
      vim.keymap.set('n', '<leader>pg', builtin.live_grep, {})
      vim.keymap.set('n', '<C-p>', function()
            builtin.git_files({ recurse_submodules = true})
      end, {})
  end
}
