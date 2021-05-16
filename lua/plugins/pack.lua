local Packer = { }
local packer = nil

function Packer:install_packer()
	local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
		vim.api.nvim_command('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
	end
end

function Packer:load_plugins()
	self.repos = { }
	local path = 'plugins.plugins'
	local list = require(path)
	for repo, config in pairs(list) do
		self.repos[#self.repos+1] = vim.tbl_extend('force', { repo }, config)
	end
end

function Packer:load_packer()
	self:install_packer()
	if not packer then
		vim.api.nvim_command('packadd packer.nvim')
		packer = require('packer')
	end
	packer.init{ }
	packer.reset()
	local use = packer.use
	self:load_plugins()
	use { 'wbthomason/packer.nvim' }
	for _, repo in ipairs(self.repos) do
		use(repo)
	end
end

Packer:load_packer()
