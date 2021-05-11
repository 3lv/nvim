--[[
--I ll live a better life without these
vim.o.clipboard = 'unnamedplus'
vim.wo.number = true
vim.wo.relativenumber = true
]]

local global_options = {
	guicursor = '',
	showcmd = false,
	showmode = false,
	termguicolors = true,
	hidden = true,
	inccommand = 'split',
	cpoptions = 'aABceFs',
}
local bw_options = {
	undofile = true,
	signcolumn = 'no',
}

local function load_options (global, bw)
	for k, v in pairs(global) do
		vim.o[k] = v
	end
	for k, v in pairs(bw) do
		if v == true or v == false then
			vim.cmd('set '..k)
		else
			vim.cmd('set '..k..'='..v)
		end
	end
end

load_options(global_options, bw_options)

--Autocmd
local augroups = require('utils.augroups')
augroups {
	_general_settings = {
		{ 'TextYankPost', '*', [[lua require('vim.highlight').on_yank({ higroup = 'IncSearch', timeout = 200 })]] },
	},
	_cpp_mappings = {
		{ 'FileType', 'cpp', [[nnoremap <silent> <A-4> <cmd>lua require('femboycpp').toggle_inout()<CR>]] },
		{ 'FileType', 'cpp', [[nnoremap <silent> <A-9> <cmd>lua require('femboycpp').build_and_run()<CR>]] },
	},
}
