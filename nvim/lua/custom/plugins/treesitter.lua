return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    local treesitter = require('nvim-treesitter.configs')

    treesitter.setup({
      ensure_installed = {
        'bash',
        'c',
        'css',
        'dockerfile',
        'gitignore',
        'html',
        'javascript',
        'json',
        'lua',
        'markdown',
        'php',
        'python',
        'query',
        'typescript',
        'vim',
        'vimdoc',
        'yaml',
        'xml',
      },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
