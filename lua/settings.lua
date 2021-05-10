--[[
--I ll live a better life without these
vim.o.clipboard = 'unnamedplus'
vim.wo.number = true
vim.wo.relativenumber = true
]]


-- Global options
local options = {
	-- Make vim look cleaner
	guicursor = '',
	showcmd = false,
	showmode = false,
	-- Basic options
	termguicolors = true,
	hidden = true,
	inccommand = 'split',
}
-- Window options
vim.cmd[[
set undofile
set signcolumn=no
]]

-- Apply global options
for opt, val in pairs(options) do
	vim.o[opt] = val
end

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
