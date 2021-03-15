
--Options

vim.o.clipboard = "unnamedplus"
vim.o.path = vim.o.path.."**"

vim.bo.undofile = true
vim.o.switchbuf = "useopen"


vim.o.termguicolors = true
vim.o.guicursor = ""
vim.o.inccommand = "split"

vim.o.completeopt = "menuone,noselect"
vim.bo.suffixesadd = ".cpp,.lua"

-- Indent options
vim.o.tabstop=4
vim.o.shiftwidth=4



--Window options
vim.wo.number = true
vim.wo.relativenumber = true


--Autocmd

local augroups = require('utils.augroups')

augroups(
    {
		_general_settings =
		{
			{'TextYankPost', '*', 'lua require(\'vim.highlight\').on_yank({higroup = \'IncSearch\', timeout = 200})'},
        },
		_cpp_settings =
		{
			{'FileType', 'cpp', 'nnoremap <silent> <F2> :bo 40vs %:r.in <bar> setlocal nu nornu <bar> set wfw wfh<CR>'},
			{'FileType', 'cpp', 'nnoremap <silent> <F3> :bel sp %:r.out <bar> setlocal nu nornu <bar> set wfw wfh<CR>'},
			{'FileType', 'cpp', [[nnoremap <cilent> <C-c> <Cmd>s@^\(\s*\)@\1//@e<CR> <Cmd>s@^\(\s*\)////@\1@e]]},

		},
    }
)
