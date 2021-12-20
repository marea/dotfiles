require('plugins-keybindings')
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
	execute 'packadd packer.nvim'
end

vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
	use 'wbthomason/packer.nvim'
	use 'duggiefresh/vim-easydir'
	use 'kyazdani42/nvim-web-devicons'
	use {
		'kyazdani42/nvim-tree.lua',
		config = function()
			require('nvim-tree').setup { }
		end
	}
	use {
		'norcalli/nvim-colorizer.lua',
		config = function()
			require('colorizer').setup()
		end
	}
	use 'romgrk/barbar.nvim'
	use 'mattn/emmet-vim'
	use {
		'windwp/nvim-autopairs',
		config = function()
			require('nvim-autopairs').setup()
		end
	}
	use 'rust-lang/rust.vim'
	use {
		'prettier/vim-prettier',
		config = function()
			vim.cmd("let g:prettier#autoformat = 1")
			vim.cmd("let g:prettier#autoformat_require_pragma = 0")
		end
	}
	use 'neovim/nvim-lspconfig'
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	use 'fatih/vim-go'
	--use {
	--	'ray-x/go.nvim',
	--	config = function()
	--		require('go').setup()
	--	end
	--}
	use {
		'NTBBloodbath/rest.nvim',
		requires = { 'nvim-lua/plenary.nvim' }
	}
	use {
		'windwp/nvim-ts-autotag',
		config = function()
			require('nvim-ts-autotag').setup()
		end
	}
	use {
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			vim.g.indent_blankline_char = "┊"
			vim.g.indent_blankline_filetype_exclude = {
				"log","gitcommit", "packer", "markdown", "json", "txt", "help",
				"NvimTree", "git", ""
			}
			vim.g.indent_blankline_buftype_exclude = {"terminal", "nofile"}
			-- because lazy load indent-blankline so need readd this autocmd
			vim.cmd('autocmd CursorMoved * IndentBlanklineRefresh')
		end
	}
	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use "p00f/nvim-ts-rainbow"
	use "folke/twilight.nvim"
	use {"romgrk/nvim-treesitter-context",
		config= function()
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
		end}
	use {
		'rmagatti/auto-session',
		config = function()
			require('auto-session').setup {
				auto_save_enabled = true
			}
		end
	}
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
end)
