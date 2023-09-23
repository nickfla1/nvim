local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	-- git
	'tpope/vim-fugitive',
	'tpope/vim-rhubarb',

	'tpope/vim-sleuth',

	-- LSP
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			{'williamboman/mason.nvim', config = true},
			'williamboman/mason-lspconfig.nvim',

			{'j-hui/fidget.nvim', tag = 'legacy', opts = {}},

			'folke/neodev.nvim',
		},
	},

	-- autocompletion
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			-- snippets
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',

			-- LSP autocompletion
			'hrsh7th/cmp-nvim-lsp',

			'rafamadriz/friendly-snippets',
		},
	},

	{'folke/which-key.nvim', opts = {}},
	'lewis6991/gitsigns.nvim',
	'nvim-lualine/lualine.nvim',
	'lukas-reineke/indent-blankline.nvim',
	{'numToStr/Comment.nvim', opts = {}},

	{
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{
				'nvim-telescope/telescope-fzf-native.nvim',
				build = 'make',
				cond = function()
					return vim.fn.executable 'make' == 1
				end,
			},
		},
	},

	{
		'nvim-treesitter/nvim-treesitter',
		dependencies = {
			'nvim-treesitter/nvim-treesitter-textobjects',	
		},
		build = ':TSUpdate',
	},

	'ellisonleao/gruvbox.nvim',
	'nvim-tree/nvim-tree.lua',

	-- rust
	'simrat39/rust-tools.nvim',
}

local opts = {}

require("lazy").setup(plugins, opts)

