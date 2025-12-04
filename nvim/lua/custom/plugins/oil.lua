return {
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false,
    config = function()
      require('oil').setup {
        view_options = {
          show_hidden = true,
        },
      }

      -- Open parent directory in current window
      vim.keymap.set('n', '-', '<CMD>Oil<CR>')

      -- Open parent directory in horizontal split
      vim.keymap.set('n', '<leader>os', function()
        vim.cmd('split')
        vim.cmd('Oil')
      end)

      -- Open parent directory in vertical split
      vim.keymap.set('n', '<leader>ov', function()
        vim.cmd('vsplit')
        vim.cmd('Oil')
      end)
    end,
  },
}
