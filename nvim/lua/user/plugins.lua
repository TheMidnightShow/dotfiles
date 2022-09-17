local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
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
  use { 'ellisonleao/gruvbox.nvim' }

  -- impatient
  use { 'lewis6991/impatient.nvim' }
	
  -- lua line
  use { 'nvim-lualine/lualine.nvim' }

  -- plenary
  use { 'nvim-lua/plenary.nvim' }

  -- telescope
  use { 'nvim-telescope/telescope.nvim' }

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
