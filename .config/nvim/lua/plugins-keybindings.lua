local options = { noremap = true, silent = true }

-- nvim-tree
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', options)

-- barbar.nvim
vim.keymap.set('n', '<A-c>', ':BufferClose<CR>', options)
vim.keymap.set('n', '<A-,>', ':BufferPrevious<CR>', options)
vim.keymap.set('n', '<A-.>', ':BufferNext<CR>', options)

-- telescope.nvim
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers)
vim.keymap.set('n', '<leader>sf', function()
  require('telescope.builtin').find_files { previewer = false }
end)
vim.keymap.set('n', '<leader>sb', require('telescope.builtin').current_buffer_fuzzy_find)
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags)
vim.keymap.set('n', '<leader>st', require('telescope.builtin').tags)
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').grep_string)
vim.keymap.set('n', '<leader>sp', require('telescope.builtin').live_grep)
vim.keymap.set('n', '<leader>so', function()
  require('telescope.builtin').tags { only_current_buffer = true }
end)
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles)
