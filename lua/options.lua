-- OPTIONS:
-- :set gcr=a:block nosc nosmd stal=0 scl=no lcs=tab:\|\ ph=10 icm=split mouse= cpo-=_ udf 
local options = {
	guicursor = 'a:block',
	showcmd = false,
	showmode = false,
	showtabline = 0,
	signcolumn = 'no',
	pumheight = 10,
	inccommand = 'split',
	mouse = '',
	cpoptions = 'aABceFs',
	undofile = true,
	--laststatus = 0,
	--listchars = 'tab:| ',
	--pumblend = 20,
	--vvv bad options vvv--
	--clipboard = "unnamedplus"
	--number = true,
	--relativenumber = true,
}
for k, v in pairs(options) do
	vim.o[k] = v
end

-- Curstom clipboard that uses ~/.clipboard file whenever xclip/xsel are not available
if vim.fn.expand("$TERM") == "linux" or true then
	vim.g.clipboard = {
		name = "myClipboard",
		copy = {
			["+"] = { "tee", vim.fn.expand("$HOME/.clipboard") },
		},
		paste = {
			["+"] = { "cat", vim.fn.expand("$HOME/.clipboard") },
		},
		cache_enabled = 1,
	}
end

-- AUGROUPS:
local group = vim.api.nvim_create_augroup('GeneralSettings', {
	clear = true,
})
vim.api.nvim_create_autocmd({'TextYankPost'}, {
	group = 'GeneralSettings',
	pattern = {'*'},
	callback = function(ev)
		require('vim.highlight').on_yank({ higroup = 'IncSearch', timeout = 200 });
	end
})
