local config = { }

function config.netrw()
	vim.g.netrw_banner = 0; -- no banner
	vim.g.netrw_liststyle = 3; -- tree listing
	vim.g.netrw_winsize = 20; -- win size 20%
	vim.g.netrw_cursor = 0; -- no cursorline (cul)
end
config.netrw()

function config.bootstrap()
	require('bootstrap').setup {
	}
end

function config.treesitter()
	require('nvim-treesitter.configs').setup {
		modules = {},
		ensure_installed = "all",
		ignore_install = {},
		sync_install = false,
		auto_install = false,
		highlight = {
			enable = true,
		},
	}
end

function config.ttyscheme()
	vim.api.nvim_command('colorscheme ttyscheme')
end

function config.colorizer()
	require('colorizer').setup { }
end

function config.screenkeys()
	require('screenkeys').setup {
		special_keys = false,
	}
end

-- [[Not used]] {{{
function config.web_devicons()
	require('nvim-web-devicons').setup {
		override = {
			zsh = {
				icon = "",
				color = "#428850",
				name = "Zsh",
			}
		},
		default = true,
	}
end

function config.telescope()
	require('telescope').setup { }
	vim.cmd[[
	command! F lua require('telescope.builtin').find_files()
	command! R lua require('telescope.builtin').live_grep()
	command! A lua require('telescope.builtin').builtin()
	]]
end

function config.femboyrainbow()
	require('femboyrainbow').start()
end

function config.femboyscheme()
	vim.api.nvim_command('colorscheme femboyscheme')
end

function config.femboystatus()
	require('femboystatus').setup { }
end

function config.femboycpp()
	require('femboycpp').setup { }
end

function config.femboyf()
	require('femboyf').setup {
		style = 'line',
	}
end

function config.firenvim()
	vim.g.firenvim_config = {
		globalSettings = { alt = "all" },
		localSettings = {
			[".*"] = {
				cmdline  = "neovim",
				content  = "text",
				priority = 0,
				selector = "textarea",
				takeover = "always"
			}
		}
	}
end
-- }}}

return config

-- vi:fdm=marker
