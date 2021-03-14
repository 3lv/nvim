local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('i', '<C-u>', '<C-g>u<C-u>', {noremap = true, silent = true})
map('i', '{<CR>', '{<CR>}<Esc>O', {noremap = true, silent = true})
