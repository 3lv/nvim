local config = require('plugins.config')
local plugins = { }

-- LSP:
--
-- LspInstall:
plugins['kabouzeid/nvim-lspinstall'] = {
	config = config.lspinstall,
}
-- Lspconfig:
plugins['neovim/nvim-lspconfig'] = {
	config = config.lspconfig,
}

-- HIGHLIGHTING:
--
-- Adds better SYNTAX:
plugins['nvim-treesitter/nvim-treesitter'] = {
	config = config.treesitter,
	run = ':TSInstall all',
}
-- ICONS: for every filetype
plugins['kyazdani42/nvim-web-devicons'] = {
	config = config.web_devicons,
}
-- COLORSCHEME:
plugins['3lv/femboyscheme'] = {
	config = config.femboyscheme,
}
-- STATUSLINE:
plugins['3lv/femboystatus'] = {
	config = config.femboystatus,
}
-- EASY: movement with highlighting for unique characters
plugins['3lv/femboyf'] = {
	config = config.femboyf,
}
-- HEX: visualization
plugins['norcalli/nvim-colorizer.lua'] = {
	config = config.colorizer,
	cmd = 'ColorizerToggle',
}


-- EXPLORER:
--
-- TREE: explorer
plugins['kyazdani42/nvim-tree.lua'] = {
	config = config.nvim_tree,
}
-- FZF: and livegrep
plugins['nvim-telescope/telescope.nvim'] = {
	config = config.telescope,
	requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } },
	cmd = { 'F', 'R', 'A' },
}


-- OTHERS:
--
-- KEYMAP: adds an alternative kblayout, using the alt key
plugins['3lv/femboyalt'] = {
	config = config.femboyalt,
}
-- CPP: small extension (build and run, input/output toggle)
plugins['3lv/femboycpp'] = {
	config = config.femboycpp,
	ft = { 'cpp' },
}

return plugins
