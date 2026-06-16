local augroup = vim.api.nvim_create_augroup('custom', { clear = true })

-- only show the cursorline in current window
vim.api.nvim_create_autocmd({ 'InsertLeave', 'WinEnter' }, {
  group = augroup,
  callback = function() vim.opt.cursorline = true end,
})

vim.api.nvim_create_autocmd({ 'InsertEnter', 'WinLeave' }, {
  group = augroup,
  callback = function() vim.opt.cursorline = false end,
})

-- show diagnostic popup when cursor stops on line
vim.api.nvim_create_autocmd('CursorHold', {
  group = augroup,
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end,
})

-- highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
  group = augroup,
  callback = function()
    vim.hl.on_yank()
  end,
})
