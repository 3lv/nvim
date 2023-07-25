local map = vim.api.nvim_set_keymap
local unmap = vim.api.nvim_del_keymap
local opts = { noremap = true, silent = true }

unmap('n', 'Y')
