local util = require("formatter.util")
local ft = require("formatter.filetypes")

require("formatter").setup({
	filetype = {
		bash = { ft.zsh.beautysh },
		cpp = { ft.cpp.clangformat },
		lua = { ft.lua.stylua },
		openscad = {
			function()
				return {
					exe = "openscad-format",
					args = { "-dry" },
					stdin = true,
				}
			end,
		},
		tex = { ft.latex.latexindent },
		typst = {
			function()
				return {
					exe = "typstfmt",
					args = {
						"--stdout",
						util.escape_path(util.get_current_buffer_file_path()),
						"--",
					},
					stdin = true,
				}
			end,
		},
	},
})

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWrite",
})
