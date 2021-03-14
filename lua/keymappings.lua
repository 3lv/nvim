local utils = require('utils')
local cmd = vim.cmd

utils.map('i', '<C-u>', '<C-g>u<C-u>', {noremap = true, silent = true})
utils.map('i', '{<CR>', '{<CR>}<Esc>O', {noremap = true, silent = true})
