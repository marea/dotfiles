local execute = vim.api.nvim_command
local fn = vim.fn
local map = vim.api.nvim_set_keymap

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'tpope/vim-sensible'
  use 'preservim/nerdtree'
  use 'preservim/nerdcommenter'
  use 'ryanoasis/vim-devicons'
  use 'ap/vim-css-color'
  use 'mattn/emmet-vim'
  use 'Raimondi/delimitMate'
  use 'rust-lang/rust.vim'
  use 'Yggdroot/indentLine'
  use 'lukas-reineke/indent-blankline.nvim'
  use {'prettier/vim-prettier', run = 'npm install' }
  use 'neovim/nvim-lspconfig'
  use {'fatih/vim-go', run = ':GoUpdateBinaries' }
  use 'kyazdani42/nvim-web-devicons'
  use 'romgrk/barbar.nvim'
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
end)

-- Barbar.nvim
options = { noremap = true, silent = true }
map('n', '<C-s>', ':BufferPick<CR>', options)
map('n', '<A-c>', ':BufferClose<CR>', options)
map('n', '<A-,>', ':BufferPrevious<CR>', options)
map('n', '<A-.>', ':BufferNext<CR>', options)
map('n', '<A-<>', ':BufferMovePrevious<CR>', options)
map('n', '<A->>', ':BufferMoveNext<CR>', options)

-- NERDTree
map('n', '<C-n>', ':NERDTreeToggle<CR>', options)

-- Prettier
vim.g.indentLine_char = '|'
