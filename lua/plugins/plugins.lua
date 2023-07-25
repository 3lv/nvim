local config = require('plugins.config')
local plugins = { }

-- LSP:
--
-- Lspconfig:
plugins['neovim/nvim-lspconfig'] = {
	config = config.lspconfig,
}


-- HIGHLIGHTING:
--
-- Adds better SYNTAX:
plugins['nvim-treesitter/nvim-treesitter'] = {
	config = config.treesitter,
	run = ':TSUpdate',
	-- :TSInstall all
}
plugins['~/workspace/tty/ttyscheme'] = {
	config = config.ttyscheme,
}
-- EASY: movement with highlighting for unique characters
plugins['3lv/femboyf'] = {
	config = config.femboyf,
	disable = true,
}
-- HEX: visualization
plugins['norcalli/nvim-colorizer.lua'] = {
	config = config.colorizer,
	cmd = { 'ColorizerToggle' },
}
-- ICONS: for every filetype
plugins['kyazdani42/nvim-web-devicons'] = {
	config = config.web_devicons,
	disable = true,
}
-- COLORSCHEME:
plugins['3lv/femboyscheme'] = {
	config = config.femboyscheme,
	disable = true,
}
-- STATUSLINE:
plugins['3lv/femboystatus'] = {
	config = config.femboystatus,
	disable = true,
}


-- EXPLORER:
--
-- TREE: explorer
plugins['nvim-tree/nvim-tree.lua'] = {
	config = config.nvim_tree,
	disable = true,
}
-- FZF: and livegrep
plugins['nvim-telescope/telescope.nvim'] = {
	config = config.telescope,
	requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } },
	cmd = { 'F', 'R', 'A' },
	disable = true,
}


-- OTHERS:
--
-- KEYMAP: adds an alternative kblayout, using the alt key
-- CPP: small extension (build and run, input/output toggle)
plugins['3lv/femboycpp'] = {
	config = config.femboycpp,
	ft = { 'cpp' },
}
-- FIREFOX EXTENSTION
plugins['glacambre/firenvim'] = {
	config = config.firenvim,
	run = function() vim.fn['firenvim#install'](0) end
}
-- RAINBOW
plugins['3lv/femboyrainbow'] = {
	config = config.femboyrainbow,
	disable = true,
}
return plugins
