local map = vim.keymap.set
local unmap = vim.api.nvim_del_keymap
local opts = { noremap = true, silent = true }

unmap('n', 'Y')
map('n', 'g<c-q>', function()
	for _, ui in pairs(vim.api.nvim_list_uis()) do
		if ui.chan and not ui.stdout_tty then
			vim.fn.chanclose(ui.chan)
		end
	end
end, opts)
