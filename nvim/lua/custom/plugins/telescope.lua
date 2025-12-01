return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local telescope = require('telescope')
    local themes = require('telescope.themes')
    local actions = require("telescope.actions")
    local builtin = require('telescope.builtin')

    telescope.setup {
      defaults = themes.get_ivy(),
      pickers = {
        buffers = {
          mappings = {
            i = { ['<c-d>'] = actions.delete_buffer },
            n = { ['<c-d>'] = actions.delete_buffer },
          }
        }
      }
    }

    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    vim.keymap.set('n', '<leader>fl', builtin.loclist, {})
    vim.keymap.set('n', '<leader>fq', builtin.quickfix, {})
  end,
}
