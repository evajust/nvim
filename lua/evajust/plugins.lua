
-- install lazy.nvim
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

-- List of plugins and options for Lazy to load.

local plugins = {
	{ 'rose-pine/neovim', name = 'rose-pine' },
	'nvim-treesitter/nvim-treesitter',
	'theprimeagen/harpoon',
	'mbbill/undotree',
    -- Git integration
	'tpope/vim-fugitive',
    {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	},
	-- completion
	--{
	--	"hrsh7th/nvim-cmp",
	--	"hrsh7th/cmp-nvim-lsp",
	--	"L3MON4D3/LuaSnip",
    --},
	-- snippets
    --{
	--	"saadparwaiz1/cmp_luasnip",
	--	"rafamadriz/friendly-snippets"
	--},
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.2',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
}

local opts = {}

require("lazy").setup(plugins, opts)


