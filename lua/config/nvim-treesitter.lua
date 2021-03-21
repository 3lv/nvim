require'nvim-treesitter.configs'.setup {
	highlight = {
		enable = true,
	},
	rainbow = {
		enable = true
	},
	playground = {
		enable = true,
		disable = {},
		updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
		persist_queries = false -- Whether the query persists across vim sessions
	},
	textobjects = {
		select = {
			enable = true,
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["if"] = "@function.inner",
				["af"] = "@function.outer",
				["ic"] = "@class.inner",
				["ac"] = "@class.outer",
				["il"] = "@loop.inner",
				["al"] = "@loop.outer",
				["i/"] = "@comment.outer",
				["a/"] = "@comment.outer",
				["is"] = "@statement.outer",
				["as"] = "@statement.outer",
				["ii"] = "@condition.inner",
				["ai"] = "@condition.outer",

				-- Or you can define your own textobjects like this
				--["iF"] = {
					--  python = "(function_definition) @function",
					--  cpp = "(function_definition) @function",
					--  c = "(function_definition) @function",
					--  java = "(method_declaration) @function",
					--},
			},
		},
		move = {
			enable = true,
			goto_next_start = {
				["]l"] = "@loop.outer",
				["]f"] = "@function.outer",
				["]c"] = "@class.outer",
				["]l"] = "@loop.outer",
				["]/"] = "@comment.outer",
				["]s"] = "@statement.outer",
				["]i"] = "@condition.outer",
				--["]]"] = "@class.outer",
			},
			goto_next_end = {
				["]L"] = "@loop.outer",
				--["]["] = "@class.outer",
			},
			goto_previous_start = {
				["[l"] = "@loop.outer",
				--["[["] = "@class.outer",
			},
			goto_previous_end = {
				["[L"] = "@loop.outer",
				--["[]"] = "@class.outer",
			},
		},
	},
		--	ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
		--	highlight = {
			--	  enable = true,			  -- false will disable the whole extension
			--	  --disable = { "c", "rust" },	-- list of language that will be disabled
			--	},
}
