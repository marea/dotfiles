require('plugins-keybindings')

-- Packer config
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', { command = 'source <afile> | PackerCompile', group = packer_group, pattern = 'init.lua' })

-- Plugins
require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'duggiefresh/vim-easydir'
	use 'kyazdani42/nvim-web-devicons'
	use 'kyazdani42/nvim-tree.lua'
	use 'norcalli/nvim-colorizer.lua'
	use 'romgrk/barbar.nvim'
	use 'mattn/emmet-vim'
	use 'windwp/nvim-autopairs'
	use 'prettier/vim-prettier'
  use 'lukas-reineke/indent-blankline.nvim'
	use "folke/twilight.nvim"
	use 'rmagatti/auto-session'
  use 'tpope/vim-fugitive'
  use 'numToStr/Comment.nvim'

	-- Telescope
	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

	-- Treesitter
	use 'nvim-treesitter/nvim-treesitter'
	use 'windwp/nvim-ts-autotag'
  use 'nvim-treesitter/nvim-treesitter-textobjects'
	use "p00f/nvim-ts-rainbow"
	use "romgrk/nvim-treesitter-context"

	-- LSP
	use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
end)

require('nvim-tree').setup{}
require('colorizer').setup{}
require('nvim-autopairs').setup{}
require('nvim-ts-autotag').setup{}
require('Comment').setup{}
require('indent_blankline').setup {
  char = '┊',
  show_trailing_blankline_indent = false,
}
require('auto-session').setup {
	auto_save_enabled = true
}
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}
require('telescope').load_extension 'fzf'
require'treesitter-context'.setup{
	enable = true,
	throttle = true,
	max_lines = 2,
	patterns = {
		default = {
			'class',
			'function',
			'method',
		},
	},
}

vim.cmd("let g:prettier#autoformat = 1")
vim.cmd("let g:prettier#autoformat_require_pragma = 0")
