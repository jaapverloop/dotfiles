return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  branch = 'main',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').setup()

    require('nvim-treesitter').install({
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
    })

    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('treesitter.setup', {}),
      callback = function(args)
        local buf = args.buf
        local filetype = args.match

        local language = vim.treesitter.language.get_lang(filetype) or filetype
        if not pcall(vim.treesitter.language.add, language) then
          return
        end

        if not pcall(vim.treesitter.start, buf, language) then
          return
        end

        vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end
}
