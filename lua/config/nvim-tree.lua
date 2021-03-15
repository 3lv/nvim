local cmd = vim.cmd

vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_icons = {
      default = '',
      symlink = '',
      git = {
        unstaged = "✗",
        staged = "✓",
        unmerged = "",
        renamed = "➜",
        untracked = "★"
        },
      folder = {
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = "",
        }
      }
cmd [[command! E  NvimTreeToggle]]
