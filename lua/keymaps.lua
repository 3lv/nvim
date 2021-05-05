local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('i', '<C-u>', '<C-g>u<C-u>', opts)
map('n', '<C-c>', '<Nop>', opts)
map('n', 'cw', 'dwi', opts)
map('t', '<Esc>', [[<C-\><C-n>]], opts)
