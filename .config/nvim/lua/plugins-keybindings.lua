local map = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

-- nvim-tree
map('n', '<C-n>', ':NvimTreeToggle<CR>', options)

-- barbar.nvim
map('n', '<C-s>', ':BufferPick<CR>', options)
map('n', '<A-c>', ':BufferClose<CR>', options)
map('n', '<A-,>', ':BufferPrevious<CR>', options)
map('n', '<A-.>', ':BufferNext<CR>', options)
map('n', '<A-<>', ':BufferMovePrevious<CR>', options)
map('n', '<A->>', ':BufferMoveNext<CR>', options)

-- rest.nvim
--map('n', '<C-r>', '<Plug>RestNvim', {})
