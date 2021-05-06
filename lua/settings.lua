--[[
--I ll live a better life without these
vim.o.clipboard = "unnamedplus"
vim.wo.number = true
vim.wo.relativenumber = true
]]

vim.o.guicursor = ''
-- Options

-- Cleaner
vim.o.showcmd = false
vim.o.showmode = false
vim.o.shortmess = [[filnxtToOFI]]
vim.o.statusline = [[%<]]
vim.o.fillchars = [[stl: ,stlnc: ]]

-- Basics
vim.o.termguicolors = true
vim.o.mouse = [[a]]
vim.o.hidden = true
vim.o.path = vim.o.path .. '**'
vim.o.switchbuf = "useopen"
vim.cmd[[set undofile]]

-- Visual
--vim.cmd[[set ts=4 sw=0]]
vim.o.inccommand = "split"
--vim.o.completeopt = "menuone"

-- For lua (find file under cursor)
--vim.bo.suffixesadd = ".lua"
--vim.cmd[[set includeexpr=substitute(v:fname,'\\.','/','g')]]

vim.wo.signcolumn = 'no'

--Autocmd
local augroups = require('utils.augroups')

augroups( {
	_general_settings =
	{
		{'TextYankPost', '*', [[lua require('vim.highlight').on_yank({higroup = 'IncSearch', timeout = 200})]]},
	},
	_cpp_mappings =
	{
		{'FileType', 'cpp', [[nnoremap <silent> <A-4> <cmd>lua require('femboycpp').toggle_inout()<CR>]]},
		{'FileType', 'cpp', [[nnoremap <silent> <A-9> <cmd>lua require('femboycpp').build_and_run()<CR>]]},
	},
} )
