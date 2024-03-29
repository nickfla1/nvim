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
	'ellisonleao/gruvbox.nvim',
	'nvim-tree/nvim-tree.lua',
	'nvim-tree/nvim-web-devicons',
	'nvim-lualine/lualine.nvim',
	'nvim-treesitter/nvim-treesitter',
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.0',
		dependencies = { {'nvim-lua/plenary.nvim'} },
	},

	-- binary management
	{
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'neovim/nvim-lspconfig',
		'saadparwaiz1/cmp_luasnip',
		'rafamadriz/friendly-snippets'
	},

	-- code completion
	{
		'hrsh7th/nvim-cmp',
		'hrsh7th/cmp-nvim-lsp',
		'L3MON4D3/LuaSnip',
	},

	-- rust
	'simrat39/rust-tools.nvim',
}

local opts = {}

require("lazy").setup(plugins, opts)

