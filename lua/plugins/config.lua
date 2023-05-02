local config = { }

function config.lspconfig()
	require('lspconfig').ccls.setup {
		filetypes = { 'c', 'cpp' },
	}
	require'lspconfig'.lua_ls.setup {
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT',
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = {'vim'},
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
}
end

function config.nvim_tree()
	require('nvim-tree').setup {}
	vim.cmd[[command! L NvimTreeToggle]]
end

function config.treesitter()
	require('nvim-treesitter.configs').setup {
		highlight = {
			enable = true,
		},
	}
end

function config.colorizer()
	require('colorizer').setup { }
end

function config.lspsaga()
	require('lspsaga').init_lsp_saga {
		use_saga_diagnostic_sign = true,
		error_sign = ' ',
		warn_sign = ' ',
	}
end

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

function config.femboyalt()
	require('femboyalt')
end

function config.femboycpp()
	require('femboycpp').setup { }
end

function config.femboyf()
	require('femboyf').setup {
		style = 'line',
	}
end

return config
