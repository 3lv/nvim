
-- Colorscheme
require('colorscheme')
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

local augroup = require('utils.augroup')

augroup(
    {_general_settings = {
            {'TextYankPost', '*', 'lua require(\'vim.highlight\').on_yank({higroup = \'IncSearch\', timeout = 1000})'},
        },
    }
)
