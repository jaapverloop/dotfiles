return {
  {
    'mason-org/mason.nvim',
    build = ':MasonUpdate',
  },
  {
    'mason-org/mason-lspconfig.nvim',
    dependencies = {
      'mason-org/mason.nvim',
      'neovim/nvim-lspconfig',
      'saghen/blink.cmp',
    },
    opts = {
      ensure_installed = {
        'clangd',
        'cssls',
        'eslint',
        'html',
        'phpactor',
        'tailwindcss',
        'pyright',
      },
      automatic_enable = true,
    },
    config = function(_, opts)
      require('mason').setup()
      require('mason-lspconfig').setup(opts)

      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local lspconfig = require('lspconfig')

      lspconfig.util.default_config = vim.tbl_extend(
        'force',
        lspconfig.util.default_config,
        { capabilities = capabilities }
      )

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(event)
          local buf = event.buf
          local opts = { buffer = buf }

          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        end,
      })
    end,
  },
  {
    'saghen/blink.cmp',
    version = '*',
    opts = {
      keymap = { preset = 'default' },
      appearance = {
        nerd_font_variant = 'mono',
      },
      completion = {
        documentation = { auto_show = true },
      },
      sources = {
        default = { 'lsp', 'path', 'buffer' },
      },
    },
  },
}
