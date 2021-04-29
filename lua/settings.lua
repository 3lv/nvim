--Options

vim.o.mouse = [[a]]
vim.o.shortmess = [[filnxtToOFI]]
vim.o.stl = [[%<]]
vim.o.showcmd = false
vim.o.showmode = false
vim.o.fillchars = [[stl: ,stlnc: ,eob: ]]

vim.o.hidden = true
vim.o.clipboard = "unnamedplus"
vim.o.path = vim.o.path .. "**"

--vim.cmd[[set undofile]] -- bug?
vim.bo.undofile = true
vim.o.switchbuf = "useopen"

vim.o.termguicolors = true
vim.o.guicursor = ""
vim.o.inccommand = "split"

vim.o.completeopt = "menuone"

vim.bo.suffixesadd = ".lua"
vim.cmd[[set includeexpr=substitute(v:fname,'\\.','/','g')]]
--vim.cmd[[set fillchars=stl:-,stlnc:-,eob:\ ]]


-- Indent options
vim.bo.tabstop=4
vim.bo.shiftwidth=0



--Window options
vim.wo.number = true
vim.wo.relativenumber = true


--Autocmd

local augroups = require('utils.augroups')

augroups(
	{
		_general_settings =
		{
			{'TextYankPost', '*', [[lua require('vim.highlight').on_yank({higroup = 'IncSearch', timeout = 200})]]},
		},
		_cpp_mappings =
		{
			{'FileType', 'cpp', [[nnoremap <silent> <F4> <cmd>lua require('femboycpp').toggle_inout()<CR>]]},
			--{'FileType', 'cpp', [[nnoremap <silent> <C-c> <cmd>s@^\(\s*\)@\1//@e <bar> s@^\(\s*\)////@\1@e<CR>]]},
			{'FileType', 'cpp', [[nnoremap <silent> <F9> <cmd>lua require('femboycpp').build_and_run()<CR>]]},
			{'FileType', 'cpp', [[nnoremap <silent> <F21> <cmd>wa <bar> make %:r <bar> !./%:r<CR><CR>]]},
		},
		_NvimTree =
		{
			{'BufEnter', 'NvimTree', [[setlocal winhighlight=CursorLine:CursorLineNvimTree]]}
		},
	}
)
