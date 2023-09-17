local lazy = { }

-- Bootstrap lazy.nvim, the plugin manager
function lazy:install_lazy()
	local install_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
	if not vim.loop.fs_stat(install_path) then
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/folke/lazy.nvim.git",
			"--branch=stable",
			install_path,
		})
	end
	vim.opt.rtp:prepend(install_path)
end

function lazy:load_lazy()
	self:install_lazy()
	local plugins = require("plugins.plugins")
	vim.api.nvim_create_user_command("Setup", "Lazy! sync | qa", {})
	require("lazy").setup(plugins)
end

lazy:load_lazy()
