vim.cmd[[let bufferline = get(g:, 'bufferline', {})]]
vim.cmd[[let bufferline.closable = v:false]]
local map = vim.api.nvim_set_keymap
local opts = { noremap=true, silent=true }
map('n', '<A-,>', [[:BufferPrevious<CR>]], opts)
map('n', '<A-.>', [[:BufferNext<CR>]], opts)
map('n', '<A-<>', [[:BufferMovePrevious<CR>]], opts)
map('n', '<A->>', [[:BufferMoveNext<CR>]], opts)
map('n', '<A-q>', [[:BufferClose<CR>]], opts)
