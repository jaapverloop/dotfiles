return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  opts = {
    ensure_installed = {
      'bash',
      'css',
      'dockerfile',
      'gitignore',
      'html',
      'javascript',
      'json',
      'markdown',
      'php',
      'python',
      'typescript',
      'yaml',
      'xml',
    },
    highlight = { enable = true },
    indent = { enable = true },
  },
}
