local map = require'utils.map'
local neogit = require'neogit'

vim.cmd([[command! Git lua require'neogit'.status.create("tab")]])
