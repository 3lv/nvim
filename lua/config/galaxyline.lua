local gl = require('galaxyline')
local gls = gl.section
local extension = require('galaxyline.provider_extensions')

local noicon = {}
noicon['NvimTree'] = true
noicon['packer'] = true

local special_name = {}
special_name['NvimTree'] = 'NvimTree פּ'
special_name['packer'] = 'Packer '

gl.short_line_list = {
	'NvimTree',
	'packer'
}

local colors = {
	--bg = '#282c34',
	--line_bg = '#353644',
	bg = 'none',
	line_bg = 'none',
	fg = '#8FBCBB',
	fg_green = '#65a380',

	yellow = '#fabd2f',
	cyan = '#008080',
	darkblue = '#081633',
	green = '#afd700',
	orange = '#FF8800',
	purple = '#5d4d7a',
	magenta = '#c678dd',
	blue = '#51afef';
	red = '#ec5f67'
}

local function get_current_file_name()
	local file = vim.fn.expand('%:t')
	if vim.fn.empty(file) == 1 then return  '[No Name][buffer ' .. vim.fn.bufnr('%') .. ']'end
	if string.sub(file, 1, 4) == 'tmp.' then return '[Temp file]' end
	if special_name[vim.bo.filetype] ~= nil then return special_name[vim.bo.filetype] end
	if vim.bo.filetype == 'help' then return file .. ' ' end
	if vim.bo.modifiable and vim.bo.modified and vim.bo.readonly then
		file = file .. ' ' .. ''
	elseif vim.bo.modifiable and vim.bo.modified then
		file = file .. ' ' .. ''
	elseif vim.bo.readonly == true or vim.bo.modifiable == false then
		file = file .. ' ' .. ''
	else
		file = file .. '  '
	end
	return file
end


local function current_line_percent()
  local current_line = vim.fn.line('.')
  local total_line = vim.fn.line('$')
  if current_line == 1 then
	return '  上 '
  elseif current_line == vim.fn.line('$') then
	return '  下 '
  end
  local result,_ = math.modf((current_line/total_line)*100)
  if result <= 9 then
	return ' ' .. ' ' .. result .. '% '
  end
  return ' '.. result .. '% '
end

local function lsp_status(status)
	shorter_stat = ''
	for match in string.gmatch(status, "[^%s]+")  do
		err_warn = string.find(match, "^[WE]%d+", 0)
		if not err_warn then
			shorter_stat = shorter_stat .. ' ' .. match
		end
	end
	return shorter_stat
end

local function trailing_whitespace()
	local trail = vim.fn.search("\\s$", "nw")
	if trail ~= 0 then
		return trail
	else
		return nil
	end
end

LinePercent = current_line_percent
NameSpacing1 = name_spacing1
NameSpacing2 = name_spacing2
TrailingWhiteSpace = trailing_whitespace

local function has_file_type()
	local f_type = vim.bo.filetype
	if not f_type or f_type == '' then
		return false
	end
	return true
end

local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
	return true
  end
  return false
end

local needs_icon = function()
	if not buffer_not_empty then
		return false
	end
	if noicon[vim.bo.filetype] ~= nil or noicon[vim.fn.expand('%:e')] ~= nil then
		return false
	end
	return true
end


gls.left[1] = {
  FirstElement = {
	provider = function() return ' ' end,
	--highlight = {colors.orange,colors.line_bg},
  }
}
gls.left[2] ={
  FileIcon = {
	--provider = {'NameSpacing1','FileIcon'},
	provider = {'FileIcon'},
	condition = needs_icon,
	highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.line_bg},
  },
}
gls.left[3] = {
  FileName = {
	--provider = {'FileName','NameSpacing2'},
	provider = {get_current_file_name},
	--condition = buffer_not_empty,
	highlight = {colors.fg,colors.line_bg,'bold'}
  }
}


local checkwidth = function()
  local squeeze_width  = vim.fn.winwidth(0) / 2
  if squeeze_width > 40 then
	return true
  end
  return false
end

gls.left[4] = {
  DiffAdd = {
	provider = 'DiffAdd',
	condition = checkwidth,
	icon = ' ',
	highlight = {colors.green,colors.line_bg},
  }
}
gls.left[5] = {
  DiffModified = {
	provider = 'DiffModified',
	condition = checkwidth,
	icon = ' ',
	highlight = {colors.orange,colors.line_bg},
  }
}
gls.left[6] = {
  DiffRemove = {
	provider = 'DiffRemove',
	condition = checkwidth,
	icon = ' ',
	highlight = {colors.red,colors.line_bg},
  }
}
gls.left[7] = {
  LeftEnd = {
	provider = function() return ' ' end,
	--separator = '',
	--separator_highlight = {colors.bg,colors.line_bg},
	highlight = {colors.line_bg,colors.line_bg}
  }
}
gls.left[8] = {
	TrailingWhiteSpace = {
	 provider = TrailingWhiteSpace,
	 icon = '  ',
	 highlight = {colors.yellow,colors.bg},
	}
}
gls.left[9] = {
  DiagnosticError = {
	provider = 'DiagnosticError',
	icon = '  ',
	highlight = {colors.red,colors.bg}
}
}
gls.left[10] = {
  Space = {
	provider = function () return ' ' end
  }
}
gls.left[11] = {
  DiagnosticWarn = {
	provider = 'DiagnosticWarn',
	icon = '  ',
	highlight = {colors.yellow,colors.bg},
  }
}
gls.mid[1] = {
  ViMode = {
	separator = '▎',
	provider = function()
	  -- auto change color according the vim mode
	  local alias = {
		  n = 'ノーマル  ', --normal
		  i = 'インサート', --insert
		  V= 'ビジュアル', --visual line
		  [''] = 'ビジュアル', --visual block
		  v ='ビジュアル', --visual
		  c  = 'コマンド  ', --command line
		  ['r?'] = ':CONFIRM', -- :CONFIRM
		  rm = '--MORE', -- --MORE
		  R  = '代わる .  ', --replace
		  Rv  = '代わる .  ', --replace
		  s  = 'セレクト  ', --select
		  S  = 'セレクト  ', --select line
		  ['r']  = 'HIT-ENTER', -- HIT-ENTER
		  [''] = 'SELECT', --select block
		  t  = 'ターミナル', -- terminal
		  ['!']  = 'SHELL', -- shell
	  }
	  local mode_color = {
		  n = colors.green,
		  i = colors.blue,v=colors.magenta,[''] = colors.blue,V=colors.blue,
		  c = colors.red,no = colors.magenta,s = colors.orange,S=colors.orange,
		  [''] = colors.orange,ic = colors.yellow,R = colors.purple,Rv = colors.purple,
		  cv = colors.red,ce=colors.red, r = colors.cyan,rm = colors.cyan, ['r?'] = colors.cyan,
		  ['!']  = colors.green,t = colors.green,
		  c  = colors.purple,
		  ['r?'] = colors.red,
		  ['r']  = colors.red,
		  rm = colors.red,
		  R  = colors.yellow,
		  Rv = colors.magenta,
	  }
	  local vim_mode = vim.fn.mode()
	  vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim_mode])
	  --return alias[vim_mode] .. '   '
	  return alias[vim_mode]
	end,
	highlight = {colors.red,colors.line_bg,'bold'},
  },
}
gls.right[1] = {
  PerCent = {
	provider = LinePercent,
	separator = ' ',
	separator_highlight = {colors.line_bg,colors.line_bg},
	--highlight = {colors.cyan,colors.darkblue,'bold'},
  }
}
gls.short_line_left[1] = {
  FirstElementNonActive = {
	provider = function() return ' ' end,
	--highlight = {colors.orange,colors.line_bg},
  }
}
gls.short_line_left[2] = {
  FileIconNonActive = {
	provider = {'FileIcon'},
	condition = needs_icon,
	--highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.line_bg},
	highlight = {colors.bg,colors.line_bg},
  },
}
gls.short_line_left[3] = {
  FileNameNonActive = {
	provider = {get_current_file_name},
	condition = buffer_not_empty,
	highlight = {colors.fg,colors.line_bg}
  }
}
