local o = vim.o
local wo = vim.wo
local bo = vim.bo

o.termguicolors = true
o.shortmess = 'atI'
o.updatetime = 100

wo.number = true
wo.colorcolumn = '80'
wo.cursorline = true

bo.tabstop = 2
o.tabstop = 2
bo.shiftwidth = 2
o.shiftwidth = 2
bo.textwidth = 80
o.textwidth = 80

vim.cmd(':colorscheme base16')

o.undodir = vim.fn.stdpath('config') .. '/undo'
o.undofile = true
bo.undofile = true
o.backupdir = vim.fn.stdpath('config') .. '/backup'
o.directory = vim.fn.stdpath('config') .. '/swap'

o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"

o.completeopt = 'menuone,noselect'

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
