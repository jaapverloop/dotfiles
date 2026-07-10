return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'saghen/blink.cmp',
    },
    config = function()
      -- Apply blink completion capabilities to every server.
      vim.lsp.config('*', {
        capabilities = require('blink.cmp').get_lsp_capabilities(),
      })

      -- Servers are installed via Nix (see nix/home.nix), so we just enable
      -- them here. vim.lsp.enable loads lsp/<name>.lua from nvim-lspconfig.
      vim.lsp.enable({
        'clangd',
        'cssls',
        'eslint',
        'html',
        'phpantom_lsp',
        'tailwindcss',
        'pyright',
      })

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(event)
          local opts = { buffer = event.buf }

          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        end,
      })

      -- Diagnostics
      vim.diagnostic.config({
        -- virtual_text = true,
        severity_sort = true,
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
