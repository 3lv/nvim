local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

return require('packer').startup{ function()
	use { 'wbthomason/packer.nvim' }
	use { '3lv/femboyscheme', config = 'vim.cmd[[colorscheme femboyscheme]]' }
	use { '3lv/femboystatus', config = function() require('femboystatus').setup{ } end }
	use { '3lv/femboyalt',    config = function() require('femboyalt') end }
	use { '3lv/femboycpp', ft = {'cpp'}, config = function() require('femboycpp').setup { } end }
	use { '3lv/femboyf',      config = function() require('femboyf').setup{ style = 'line'} end }
	use { 'kyazdani42/nvim-tree.lua', config = function() require('config.nvim-tree') end }
	--use { 'nvim-telescope/telescope.nvim', cmd = 'F', requires = { { 'nvim-lua/popup.nvim', cmd = 'F' }, { 'nvim-lua/plenary.nvim', cmd = 'F' }}, config = function() require('config.telescope') end }
	use { 'nvim-telescope/telescope.nvim', cmd = { 'F', 'R', 'A' }, requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } }, config = function() require('config.telescope') end }
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSInstall cpp lua', config = function() require('config.nvim-treesitter') end }
	use { 'neovim/nvim-lspconfig', ft = {'cpp'}, config = function() require('config.nvim-lspconfig') end }
	use { 'glepnir/lspsaga.nvim', ft = {'cpp'}, config = function() require('config.lspsaga') end }
	use { 'norcalli/nvim-colorizer.lua', cmd = 'ColorizerToggle', config = function() require('config.colorizer') end }
	use { 'kyazdani42/nvim-web-devicons', config = function() require('config.nvim-web-devicons') end }
end }
