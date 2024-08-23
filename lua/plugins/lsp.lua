local auto_setup_servers = {
	-- bear -- make -B  to generate compile_commands.json in root dir
	"bashls",
	"clangd",
	["cssls"] = { settings = {
		css = { validate = true,
			lint = {
				unknownAtRules = "ignore"
			}
		},
		scss = { validate = true,
			lint = {
				unknownAtRules = "ignore"
			}
		},
		less = { validate = true,
			lint = {
				unknownAtRules = "ignore"
			}
		},
	},},
	"html",
	"pyright",
	"rust_analyzer",
	["svelte"] = {
		css = { enable = false },
	},
	["tailwindcss"] = {
		lint = {
			cssConflict = "error",
		},
	},
	"tsserver",
	["lua_ls"] = { settings = { Lua = {
		runtime = {
			version = 'LuaJIT',
		},
		diagnostics = {
			globals = { 'vim' },
		},
		workspace = {
			library = vim.env.VIMRUNTIME,
			--library = vim.api.nvim_get_runtime_file("", true),
			checkThirdParty = false,
		},
	},},},
}

local lsp_semaphore = vim.fn.expand("~/.local/state/nvim/user-discard-lsp-errors.semaphore")

local function get_char_input() return vim.fn.nr2char(vim.fn.getchar()) end

local function create_file(value)
	local uv = vim.loop
	local fd = uv.fs_open(value, "w", 420)
	uv.fs_close(fd)
	return value
end

local function is_installed(lspconfig, server)
	local function lsp_binary(server_)
		local server_config = lspconfig[server_]
		return server_config.document_config.default_config.cmd[1]
	end

	local function is_executable(server_)
		local server_config = lspconfig[server_]
		local valid_config = server_config.document_config and
		server_config.document_config.default_config and
		type(server_config.document_config.default_config.cmd) == "table" and
		#server_config.document_config.default_config.cmd >= 1

		if not valid_config then
			return false
		end

		local binary = server_config.document_config.default_config.cmd[1]

		return vim.fn.executable(binary) == 1
	end

	if is_executable(server) then
		lspconfig[server].setup {}
		return true, {}
	else
		local error = string.format("%s(%s) is not installed", server, lsp_binary(server))
		return false, error
	end
end

-- Rewrite this function
local function lspconfig_setup(lspconfig, servers)
	local errors = {}
	for key, server in pairs(servers) do
		local config = {}
		if type(server) == "table" then
			config = server
			server = key
		end
		local ok, error = is_installed(lspconfig, server)
		if ok == true then
			lspconfig[server].setup(config)
		else
			table.insert(errors, error)
		end
	end
	if #errors == 0 then
		return
	end
	for _, error in ipairs(errors) do
		print("Lsp Error: "..error)
	end
	print("Always discard LSP errors?[y/N] ")
	local input = get_char_input()
	-- input:match("\r")
	if input:match("y") or input:match("Y") then
		create_file(lsp_semaphore)
	end
end


local function setup_function()
	if vim.fn.filereadable(lsp_semaphore) ~= 0 then
		return
	end
	-- mason setup
	require("mason").setup {}
	require("mason-lspconfig").setup {
		--automatic_installation = true
	}
	-- lspconfig setup
	local lspconfig = require('lspconfig')
	lspconfig_setup(lspconfig, auto_setup_servers)
	-- TODO: add keybinding here
	--vim.keymap.set('n', '', vim.diagnostic.open_float)
	vim.api.nvim_create_autocmd('LspAttach', {
		group = vim.api.nvim_create_augroup('UserLspConfig', { }),
		callback = function(ev)
			vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
			local opts = { buffer = ev.buf }
			vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
			vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
			vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		end
	})
end

return setup_function
