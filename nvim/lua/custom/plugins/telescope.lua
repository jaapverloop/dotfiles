return {
  'nvim-telescope/telescope.nvim',
  tag = 'v0.2.0',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local telescope = require('telescope')
    local themes = require('telescope.themes')
    local actions = require('telescope.actions')
    local builtin = require('telescope.builtin')

    telescope.setup {
      defaults = vim.tbl_deep_extend('force', themes.get_ivy(), {
        mappings = {
          i = {
            ['<C-l>'] = actions.send_to_loclist,
          },
          n = {
            ['<C-l>'] = actions.send_to_loclist,
          },
        },
      }),

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
    vim.keymap.set('n', '<leader>fc', builtin.current_buffer_fuzzy_find)
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
    vim.keymap.set('n', '<leader>fl', builtin.loclist, {})
    vim.keymap.set('n', '<leader>fq', builtin.quickfix, {})
  end,
}
