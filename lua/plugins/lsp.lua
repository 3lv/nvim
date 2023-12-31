-- TODO: configure all servers just if Global Variable is set
-- does not include manually setup servers
local servers = {
	-- bear -- make -B  to generate compile_commands.json in root dir
	"clangd",
	"cssls",
	"html",
	"pyright",
	"rust_analyzer",
	"tsserver",
}

local function setup_function()
	-- mason setup
	require("mason").setup {}
	require("mason-lspconfig").setup {
		--automatic_installation = true
	}
	-- lspconfig setup
	local lspconfig = require('lspconfig')
	for _, server in pairs(servers) do
		lspconfig[server].setup {}
	end
	lspconfig.lua_ls.setup {
	settings = { Lua = {
		runtime = {
			version = 'LuaJIT',
		},
		diagnostics = {
			globals = { 'vim' },
		},
		workspace = {
			library = vim.api.nvim_get_runtime_file("", true),
			checkThirdParty = false,
		},
	},},
	}
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
