local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

return require('packer').startup{function()

	-- Packer manages itself VV
	use {'wbthomason/packer.nvim'}

	--REALLY NEED A NVIM LUA QUICK-SCOPE
	--use {'unblevable/quick-scope', config = function() require'config.quick-scope' end}


	use {'TimUntersberger/neogit', config = function() require'config.neogit' end}


	use {'kyazdani42/nvim-web-devicons', config = function() require'config.nvim-web-devicons' end}

	-- Tree explorer
	-- for nvim-tree you can't change directory..
	--use {'kyazdani42/nvim-tree.lua', config = function() require'config.nvim-tree' end, requires = {'kyazdani42/nvim-web-devicons', opt = true}}
	use {'preservim/nerdtree', requires = {"kyazdani42/nvim-web-devicons"}, config = function() require'config.nerdtree' end}
	-- Terminal toggle
	use {'akinsho/nvim-toggleterm.lua', config = function() require'config.nvim-toggleterm' end}
	
	-- LSP
	use {'neovim/nvim-lspconfig'}
	use {'hrsh7th/nvim-compe', config = function() require'config.compe' end}
	use {'glepnir/lspsaga.nvim', config = function() require'config.lspsaga' end}

	-- Colors
	use {'nvim-treesitter/nvim-treesitter', config = function() require'config.nvim-treesitter' end}
	use {"npxbr/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}

	-- Status line
	use {
	  'glepnir/galaxyline.nvim',
		branch = 'main',
		-- your statusline
		config = function() require'config.galaxyline' end,
		-- some optional icons
		requires = {'kyazdani42/nvim-web-devicons', opt = true}
	}

	use {'mhinz/vim-startify', config = function() require'config.vim-startify' end}

	--[[
	use {
	  'lewis6991/gitsigns.nvim',
	  requires = {
		'nvim-lua/plenary.nvim'
	  },
	  config = function()
		require('config.gitsigns').setup()
	  end
	}
	--]]

end}
