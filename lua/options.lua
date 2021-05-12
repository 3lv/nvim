-- I ll live a better life without these options set
-- clipboard, number, relativenumber

local global_options = {
	guicursor = '',
	showcmd = false,
	showmode = false,
	termguicolors = true,
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

for k, v in pairs(global_options) do
	vim.o[k] = v
end
for k, v in pairs(bw_options) do
	if v == true or v == false then
		vim.cmd('set '..k)
	else
		vim.cmd('set '..k..'='..v)
	end
end

--Autocmd
local augroups = require('utils.augroups')
augroups {
	_general_settings = {
		{ 'TextYankPost', '*', [[lua require('vim.highlight').on_yank({ higroup = 'IncSearch', timeout = 200 })]] },
	},
}
