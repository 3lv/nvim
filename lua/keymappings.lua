local map = require('utils.map')
local cmd = vim.cmd

map('i', '<C-u>', '<C-g>u<C-u>', {noremap = true, silent = true})
map('i', '{<CR>', '{<CR>}<Esc>O', {noremap = true, silent = true})
