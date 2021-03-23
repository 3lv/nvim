local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

return require('packer').startup{function()


	-- Adds devicons 
	use {'kyazdani42/nvim-web-devicons', config = function() require'config.nvim-web-devicons' end}
	use {'rktjmp/lush.nvim'}


--WorkFlow helpers(not colors/)

    -- Starting screen
	use {
		'mhinz/vim-startify',
		config = function() require'config.vim-startify' end
	}

	-- Tree explorer
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
			{'p00f/nvim-ts-rainbow'},
			{'nvim-treesitter/playground'},
			{'nvim-treesitter/nvim-treesitter-textobjects'},
		},
		config = function() require'config.nvim-treesitter' end
	}
	
	-- Git integration
	use {'TimUntersberger/neogit', config = function() require'config.neogit' end}

	-- LSP
	use {'neovim/nvim-lspconfig'}
	use {'hrsh7th/nvim-compe', config = function() require'config.compe' end}
	use {'glepnir/lspsaga.nvim', config = function() require'config.lspsaga' end}






-- Visual changes


	-- Colors
	use {"3lv/femboyscheme", require = {"rktjmp/lush.nvim"}}
	--use {"npxbr/gruvbox.nvim", require = {"rktjmp/lush.nvim"}}

	-- Status line
	use {
	  'glepnir/galaxyline.nvim',
		branch = 'main',
		-- your statusline
		config = function() require'config.galaxyline' end,
		-- some optional icons
		requires = {'kyazdani42/nvim-web-devicons', opt = true}
	}

	-- 'Tab' line
	use {
		'romgrk/barbar.nvim',
		requires = 'kyazdani42/nvim-web-devicons',
		config = function() require'config.barbar' end
	}
	use {'norcalli/nvim-colorizer.lua', config = function() require'config.colorizer' end}



	

-- WorkFlow changers(break compatibility with vanilla nvim, adds keymapppinds...)

	use {
		'phaazon/hop.nvim',
		config = function() require'config.hop' end
	}




	
-- Unused
	--use {'andweeb/presence.nvim', config = function() require'config.presence' end}
	--use {'mfussenegger/nvim-dap'}
	-- use {'akinsho/nvim-toggleterm.lua', config = function() require'config.nvim-toggleterm' end}
	--[[
	use {
		'preservim/nerdtree',
		requires = {
			{"kyazdani42/nvim-web-devicons"},
		},
		config = function() require'config.nerdtree' end
	}
    --]]
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
