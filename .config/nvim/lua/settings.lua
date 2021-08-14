local o = vim.o
local wo = vim.wo
local bo = vim.bo

o.termguicolors = true
o.shortmess = 'atI'
o.updatetime = 100

wo.number = true
wo.colorcolumn = '80'
--wo.list = true
--wo.listchars = 'tab:  ,trail:.,extends:>'
wo.cursorline = true

bo.tabstop = 2
o.tabstop = 2
bo.shiftwidth = 2
o.shiftwidth = 2
bo.textwidth = 80
o.textwidth = 80

vim.cmd(':colorscheme base16')
