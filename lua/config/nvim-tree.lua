vim.g.nvim_tree_ignore = {'.git','.ccls','.ccls-cache'}
vim.g.nvim_tree_disable_netrw = 0
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_show_icons = {
	git = 1,
	folders = 1,
	files = 1,
}
vim.g.nvim_tree_icons = {
      default = "",
      symlink = "",
      git = {
        unstaged = "✗",
        staged = "✓",
        unmerged = "",
        renamed = "➜",
        untracked = "★",
        },
      folder = {
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = "",
        }
      }
vim.cmd[[command! E NvimTreeToggle]]
