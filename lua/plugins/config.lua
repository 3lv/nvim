local config = { }

function config.netrw()
	vim.g.netrw_banner = 0; -- no banner
	vim.g.netrw_liststyle = 3; -- tree listing
	vim.g.netrw_winsize = 20; -- win size 20%
	vim.g.netrw_cursor = 0; -- no cursorline (cul)
end
config.netrw()

function config.lspconfig()
	require('lspconfig').ccls.setup { }
	--npm install -g typescript typescript-language-server
	require('lspconfig').tsserver.setup { }
	-- npm i -g vscode-langservers-extracted
	require('lspconfig').html.setup { }
	require('lspconfig').cssls.setup { }
	--[[
	require('lspconfig').lua_ls.setup {
	settings = { Lua = {
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
	--		checkThirdParty = false,
		},
		-- Do not send telemetry data containing a randomized but unique identifier
		telemetry = {
			enable = false,
		},
	},},
	}
	--]]
	vim.api.nvim_create_autocmd('LspAttach', {
		group = vim.api.nvim_create_augroup('UserLspConfig', { }),
		callback = function(ev)
			vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
		end

	})
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
	-- TODO add an automatic :TSUpdate
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

function config.ttyscheme()
	vim.api.nvim_command('colorscheme ttyscheme')
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

function config.firenvim()
	-- for firenvim firefox extensino
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

return config
