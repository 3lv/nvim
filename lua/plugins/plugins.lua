local c = require('plugins.config')

return {
	-- [[LSP]]:
	{ -- Lspconfig
		"neovim/nvim-lspconfig",
		config = require('plugins.lsp'),
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		}
	},--
	{
		"hrsh7th/nvim-cmp",
		config = c.cmp,
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
		},
	},
	-- [[HIGHLIGHTING]]:
	{ -- Adds better syntax highlighting
		'nvim-treesitter/nvim-treesitter',
		config = c.treesitter,
		-- :TSInstall all
	},
	{
		-- REQUIRES npm and yarn
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		-- THIS MIGHT NOT WORK
		build = function() vim.fn["mkdp#util#install"]() end,
		config = function()
			vim.cmd([[
				function OpenMarkdownPreview (url)
					execute "silent ! firefox --new-window " . a:url
				endfunction
				let g:mkdp_browserfunc = 'OpenMarkdownPreview'
			]])
		end,
	},

	{ -- COLORSCHEME
		'3lv/ttyscheme',
		--dir = '~/workspace/nvim/ttyscheme',
		lazy = false,
		priority = 1000,
		config = c.ttyscheme,
	},
	{ -- COLORSCHEME
		'3lv/femboyscheme',
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
	{ -- FIREFOX EXTENSTION
		'glacambre/firenvim',
		config = c.firenvim,
		build = function() vim.fn['firenvim#install'](0) end,
		enabled = true,
	},
	-- [[Not used]] {{{
	{ -- EASY movement with highlighting for unique characters
		'3lv/femboyf',
		config = c.femboyf,
		enabled = false,
	},
	{ -- STATUSLINE
		'3lv/femboystatus',
		config = c.femboystatus,
		dependencies = {
			"kyazdani42/nvim-web-devicons",
		},
		enabled = false,
	},
	{ -- ICONS for every filetype
		'kyazdani42/nvim-web-devicons',
		config = c.web_devicons,
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
	{ -- RAINBOW
		'3lv/femboyrainbow',
		config = c.femboyrainbow,
		enabled = true,
	},
	-- }}}
}

-- vi:fdm=marker
