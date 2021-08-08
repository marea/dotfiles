local map = vim.api.nvim_set_keymap

map('n', ',', '', {})
vim.g.mapleader = ','

map('i', 'jk', '<Esc>', {})
map('i', 'kj', '<Esc>', {})
map('i', 'jj', '<Esc>', {})
map('n', '<C-p>', ':FZF<CR>', {})
