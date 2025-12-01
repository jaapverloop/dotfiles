local xdg_data_home = os.getenv('XDG_DATA_HOME')

if not xdg_data_hone then
    xdg_data_home = vim.fn.expand('~/.local/share')
end

vim.opt.colorcolumn = '80'
vim.opt.cursorline = true
vim.opt.errorbells = false
vim.opt.expandtab = true
vim.opt.list = true
vim.opt.listchars = 'tab:▸ ,trail:.'
vim.opt.number = true
vim.opt.numberwidth = 5
vim.opt.relativenumber = true
vim.opt.scrolloff = 5
vim.opt.shiftround = true
vim.opt.shiftwidth = 4
vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })
vim.opt.sidescrolloff = 5
vim.opt.signcolumn = 'yes'
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.splitbelow = true
vim.opt.splitkeep = 'screen'
vim.opt.splitright = true
vim.opt.tabstop = 4
vim.opt.virtualedit = 'onemore'
vim.opt.visualbell = true
vim.opt.wrap = false

-- Directory settings
vim.opt.backupdir = xdg_data_home .. "/nvim/backup//"
vim.opt.directory = xdg_data_home .. "/nvim/swap//"
vim.opt.undodir = xdg_data_home .. "/nvim/undo//"
