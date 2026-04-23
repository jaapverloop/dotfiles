return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')
    local builtin = require('telescope.builtin')

    local function send_to_loclist_and_open(prompt_bufnr)
      actions.send_to_loclist(prompt_bufnr)
      vim.cmd('lopen')
    end

    telescope.setup {
      defaults = {
        mappings = {
          n = {
            ['<C-l>'] = send_to_loclist_and_open,
          },
        },
      },
      pickers = {
        buffers = {
          mappings = {
            n = { ['<c-d>'] = actions.delete_buffer },
          },
        },
        find_files = {
          hidden = true,
        }
      },
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
