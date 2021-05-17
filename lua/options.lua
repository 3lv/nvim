-- I ll live a better life without these options set
-- clipboard, number, relativenumber

-- OPTIONS:
local global_options = {
	guicursor = '',
	showcmd = false,
	showmode = false,
	pumblend = 20,
	pumheight = 10,
	hidden = true,
	inccommand = 'split',
	cpoptions = 'aABceFs',
	shortmess = 'filnxtToOFI',
}
local bw_options = {
	undofile = true,
	signcolumn = 'no',
}

-- AUGROUPS:
local augroups = require('lib.augroups')
augroups {
	_general_settings = {
		{ 'TextYankPost', '*', [[lua require('vim.highlight').on_yank({ higroup = 'IncSearch', timeout = 200 })]] },
	},
}

-- Apply the options
for k, v in pairs(global_options) do
	vim.o[k] = v
end
for k, v in pairs(bw_options) do
	if type(v) == 'boolean' then
		vim.api.nvim_command('set '..k)
	else
		vim.api.nvim_command('set '..k..'='..v)
	end
end
