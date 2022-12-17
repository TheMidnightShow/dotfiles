
local fn = vim.fn
-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim" if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	-- plugins here:

  -- packer
  use { 'wbthomason/packer.nvim' }

  -- devicons
  use { 'kyazdani42/nvim-web-devicons' }

  -- alpha
  use { 'goolord/alpha-nvim' }

  -- colorscheme
  use { 'rose-pine/neovim' }

  -- impatient
  use { 'lewis6991/impatient.nvim' }

  -- lua line
  use { 'nvim-lualine/lualine.nvim' }

  -- plenary
  use { 'nvim-lua/plenary.nvim' }

  -- telescope
  use { 'nvim-telescope/telescope.nvim' }

  -- indent line
  use { 'lukas-reineke/indent-blankline.nvim' }

  -- auto pairs
  use { 'windwp/nvim-autopairs' }

  -- tree sitter
  use { 'nvim-treesitter/nvim-treesitter' }

  -- cmp
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-nvim-lua' }
  use { 'hrsh7th/cmp-path' }
  use { 'saadparwaiz1/cmp_luasnip' }

  -- snippets
  use { 'L3MON4D3/LuaSnip' }
  use { 'rafamadriz/friendly-snippets' }

  -- lsp
  use { 'neovim/nvim-lspconfig' }
  use { 'williamboman/nvim-lsp-installer' }
  use { 'jose-elias-alvarez/null-ls.nvim' }

  -- toggle term
  use { 'akinsho/toggleterm.nvim' }

  -- nvim tree
  use { 'kyazdani42/nvim-tree.lua' }

  -- bufferlien
  use { 'akinsho/bufferline.nvim' }

  -- colorizer
  use { 'norcalli/nvim-colorizer.lua' }

  -- yuck.vim
  use { 'elkowar/yuck.vim' }

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
