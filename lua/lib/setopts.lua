-- Apply the options
local setopts = function( options )
	for k, v in pairs(options.g) do
		vim.o[k] = v
	end
	for k, v in pairs(options.bw) do
		if type(v) == 'boolean' then
			vim.api.nvim_command('set '..k)
		else
			vim.api.nvim_command('set '..k..'='..v)
		end
	end
end
return setopts
