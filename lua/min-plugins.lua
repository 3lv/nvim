local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

local install_path = '/home/fem/.local/share/nvim/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

return require('packer').startup{function()


	use {'wbthomason/packer.nvim'}
	-- Adds devicons 
	use {'kyazdani42/nvim-web-devicons', config = function() require'config.nvim-web-devicons' end}

--WorkFlow helpers(not colors/)

	---[[ Tree explorer
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {'kyazdani42/nvim-web-devicons', opt = true},
		config = function() require'config.nvim-tree' end
	}

	-- Fzf with file preview and more
	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			{'nvim-lua/popup.nvim'},
			{'nvim-lua/plenary.nvim'},
		},
		config = function() require'config.telescope' end
	}

	-- Betters highlighting, new text objects
	use {
		'nvim-treesitter/nvim-treesitter',
		requires = {
			--{'p00f/nvim-ts-rainbow'},
			--{'nvim-treesitter/playground'},
			--{'nvim-treesitter/nvim-treesitter-textobjects'},
		},
		config = function() require'config.nvim-treesitter' end
	}
	
	-- LSP
	use {'neovim/nvim-lspconfig'}
	--use {'hrsh7th/nvim-compe', config = function() require'config.compe' end}
	use {'glepnir/lspsaga.nvim', config = function() require'config.lspsaga' end}


-- Visual changes


	-- Colors
	use {"3lv/femboyscheme", requires = {"rktjmp/lush.nvim"}}
	--use {"npxbr/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}

	--Status line
	--[[
	use {
	  'glepnir/galaxyline.nvim',
		branch = 'main',
		-- your statusline
		config = function() require'config.galaxyline' end,
		-- some optional icons
		requires = {'kyazdani42/nvim-web-devicons', opt = true}
	}
	--]]

	-- 'Tab' line
	use {
		'romgrk/barbar.nvim',
		requires = 'kyazdani42/nvim-web-devicons',
		config = function() require'config.barbar' end
	}
	--use {'norcalli/nvim-colorizer.lua', config = function() require'config.colorizer' end}

end}
