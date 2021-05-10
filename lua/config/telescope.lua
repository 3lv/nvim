require('telescope').setup { }

vim.cmd[[
command! F lua require('telescope.builtin').find_files()
command! R lua require('telescope.builtin').live_grep()
command! A lua require('telescope.builtin').builtin()
]]
