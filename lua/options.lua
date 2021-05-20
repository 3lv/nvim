-- I ll live a better life without these options set
-- clipboard, number, relativenumber

-- OPTIONS:
local options = {
	g = {
		guicursor = '',
		showcmd = false,
		showmode = false,
		pumblend = 20,
		pumheight = 10,
		hidden = true,
		inccommand = 'split',
		cpoptions = 'aABceFs',
	},
	bw = {
		undofile = true,
		signcolumn = 'no',
	}
}
require('lib.setopts')(options)


-- AUGROUPS:
require('lib.augroups') {
	_general_settings = {
		{ 'TextYankPost', '*', [[lua require('vim.highlight').on_yank({ higroup = 'IncSearch', timeout = 200 })]] },
	}
}
