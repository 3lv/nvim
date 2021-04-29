local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

return require('packer').startup{function()
	use { 'wbthomason/packer.nvim' }
	use { '3lv/femboyscheme', requires = {'rktjmp/lush.nvim'} }
	use { '3lv/nvim-cpp' }
	use { 'kyazdani42/nvim-web-devicons', config = function() require'config.nvim-web-devicons' end }
	use { 'kyazdani42/nvim-tree.lua', config = function() require'config.nvim-tree' end }
	use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'} }, config = function() require'config.telescope' end }
	use { 'nvim-treesitter/nvim-treesitter', config = function() require'config.nvim-treesitter' end }
	use { 'neovim/nvim-lspconfig' }
	use { 'glepnir/lspsaga.nvim', config = function() require'config.lspsaga' end }
	use { 'glepnir/galaxyline.nvim', branch = 'main', config = function() require'config.galaxyline' end }
	use { 'romgrk/barbar.nvim', config = function() require'config.barbar' end }
	--use {'hrsh7th/nvim-compe', config = function() require'config.compe' end}
	--use {'norcalli/nvim-colorizer.lua', config = function() require'config.colorizer' end}
end}
