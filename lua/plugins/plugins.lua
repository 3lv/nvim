local c = require('plugins.config')

return {
	-- [[Bootstrap system]]
	{
		"3lv/bootstrap.nvim",
		--dir = "~/workspace/nvim/bootstrap.nvim/",
		config = c.bootstrap,
	},
	-- [[LSP]]:
	{ -- Lspconfig
		"neovim/nvim-lspconfig",
		config = require('plugins.lsp'),
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		}
	},--
	-- [[HIGHLIGHTING]]:
	{ -- Adds better syntax highlighting
		'nvim-treesitter/nvim-treesitter',
		config = c.treesitter,
		-- :TSInstall all
	},
	{ -- COLORSCHEME
		'3lv/ttyscheme',
		--dir = '~/workspace/nvim/ttyscheme',
		lazy = false,
		priority = 1000,
		config = c.ttyscheme,
	},
	{ -- HEX visualization
		'norcalli/nvim-colorizer.lua',
		config = c.colorizer,
		cmd = 'ColorizerToggle',
	},
	-- [[SCREEN KEYS]]:
	{
		'3lv/screenkeys.nvim',
		--dir = '~/workspace/nvim/screenkeys.nvim',
		config = c.screenkeys,
	},
	-- [[Not used]] {{{
	{ -- EASY movement with highlighting for unique characters
		'3lv/femboyf',
		config = c.femboyf,
		enabled = false,
	},
	{ -- ICONS for every filetype
		'kyazdani42/nvim-web-devicons',
		config = c.web_devicons,
		enabled = false,
	},
	{ -- STATUSLINE
		'3lv/femboystatus',
		config = c.femboystatus,
		enabled = false,
	},
	-- EXPLORER:
	{ -- TREE explorer
		'nvim-tree/nvim-tree.lua',
		config = c.nvim_tree,
		enabled = false,
	},
	{ -- FZF and livegrep
		'nvim-telescope/telescope.nvim',
		config = c.telescope,
		dependencies = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim' },
		cmd = { 'F', 'R', 'A' },
		enabled = false,
	},
	-- MISC:
	{ -- FIREFOX EXTENSTION
		'glacambre/firenvim',
		config = c.firenvim,
		build = function() vim.fn['firenvim#install'](0) end,
		enabled = false,
	},
	{ -- RAINBOW
		'3lv/femboyrainbow',
		config = c.femboyrainbow,
		enabled = false,
	},
	-- }}}
}

-- vi:fdm=marker
