-- change leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- quit
vim.keymap.set('n', '<leader>qq', '<cmd>qa!<CR>')

-- save buffer
vim.keymap.set('n', '<leader>w', '<cmd>update<CR>')

-- save buffer and close
vim.keymap.set('n', '<leader>q', '<cmd>x<CR>')

-- clear search
vim.keymap.set('n', '<Esc>', '<cmd>noh<CR><Esc>')

-- navigate windows
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- move windows
vim.keymap.set('n', '<Up>', '<C-w>K')
vim.keymap.set('n', '<Down>', '<C-w>J')
vim.keymap.set('n', '<Left>', '<C-w>H')
vim.keymap.set('n', '<Right>', '<C-w>L')

-- resize windows
vim.keymap.set('n', '==', '<C-w>=')
vim.keymap.set('n', '<S-Up>', '<cmd>resize +1<CR>')
vim.keymap.set('n', '<S-Down>', '<cmd>resize -1<CR>')
vim.keymap.set('n', '<S-Left>', '<cmd>vertical resize -1<CR>')
vim.keymap.set('n', '<S-Right>', '<cmd>vertical resize +1<CR>')

-- navigate buffers
vim.keymap.set('n', '[b', '<cmd>bprevious<CR>')
vim.keymap.set('n', ']b', '<cmd>bnext<CR>')
vim.keymap.set('n', '[B', '<cmd>bfirst<CR>')
vim.keymap.set('n', ']B', '<cmd>blast<CR>')

-- navigate argument list
vim.keymap.set('n', '[a', '<cmd>previous<CR>')
vim.keymap.set('n', ']a', '<cmd>next<CR>')
vim.keymap.set('n', '[A', '<cmd>first<CR>')
vim.keymap.set('n', ']A', '<cmd>last<CR>')

-- navigate quickfix list
vim.keymap.set('n', '[q', '<cmd>cprevious<CR>')
vim.keymap.set('n', ']q', '<cmd>cnext<CR>')
vim.keymap.set('n', '[Q', '<cmd>cfirst<CR>')
vim.keymap.set('n', ']Q', '<cmd>clast<CR>')

-- navigate location list
vim.keymap.set('n', '[l', '<cmd>lprevious<CR>')
vim.keymap.set('n', ']l', '<cmd>lnext<CR>')
vim.keymap.set('n', '[L', '<cmd>lfirst<CR>')
vim.keymap.set('n', ']L', '<cmd>llast<CR>')

-- move line(s) up/down
vim.keymap.set('n', '[e', '<cmd>m .-2<CR>==')
vim.keymap.set('n', ']e', '<cmd>m .+1<CR>==')
vim.keymap.set('v', '[e', ':m \'<-2<CR>gv=gv')
vim.keymap.set('v', ']e', ':m \'>+1<CR>gv=gv')

-- insert blank line above/below current line
vim.keymap.set('n', '[<space>', 'printf(\'m`%sO<Esc>``\', v:count1)', { expr = true })
vim.keymap.set('n', ']<space>', 'printf(\'m`%so<Esc>``\', v:count1)', { expr = true })
