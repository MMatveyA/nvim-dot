-- local hop = require("hop")
-- local directions = require("hop.hint").HintDirection

local mappings = {}

mappings.general = {
	n = {
		["<Esc>"] = { "<cmd> noh <CR>", "Clear highlights" },
		["<C-h>"] = { "<C-w>h", "Go to left window" },
		["<C-j>"] = { "<C-w>j", "Go to bottom window" },
		["<C-k>"] = { "<C-w>k", "Go to top window" },
		["<C-l>"] = { "<C-w>l", "Go to right window" },

		-- save
		["<C-s>"] = { "<cmd> w <CR>", "Save file" },

		-- Copy all
		["<C-c>"] = { "<cmd> %y+ <CR>", "Copy whole file" },

		["j"] = { "gj", "Move down" },
		["k"] = { "gk", "Move up" },
		["<Up>"] = { "gk", "Move up" },
		["<Down>"] = { "gj", "Move down" },

		-- ["<TAB>"] = { "<cmd> bnext <cr>", "Go to next buffer" },
		-- ["<S-TAB>"] = { "<cmd> bprevious <cr>", "Go to previous buffer" },
	},
	i = {
		["jj"] = { "<ESC>", "Return to normal mode" },

		-- save
		["<C-s>"] = { "<esc> <cmd> w <CR> hi", "Save file" },
	},
	v = {},
	t = {},
}

mappings.plugins = {
	n = {
		["<leader>x"] = { "<cmd> BufferLinePickClose <CR>", "Close current buffer" },
		["<TAB>"] = { "<cmd> BufferLineCycleNext <CR>", "Go to next buffer" },
		["<S-TAB>"] = { "<cmd> BufferLineCyclePrev <CR>", "Go to previous buffer" },

		["<leader>e"] = { "<CMD> Neotree toggle <CR>", "Toggle Neo-tree window" },

		["<leader>/"] = {
			function()
				require("Comment.api").toggle.linewise.current()
			end,
			"Toggle comment",
		},

		["<leader>so"] = { "<cmd> SymbolsOutline <cr>", "Toggle SymbolsOutline" },

		-- HOP --
		-- ["f"] = {
		-- 	function()
		-- 		hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
		-- 	end,
		-- 	"Find first char",
		-- },
		-- ["F"] = {
		-- 	function()
		-- 		hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
		-- 	end,
		-- 	"Find first char to back",
		-- },
		-- ["t"] = {
		-- 	function()
		-- 		hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
		-- 	end,
		-- 	"Find first char",
		-- },
		-- ["T"] = {
		-- 	function()
		-- 		hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
		-- 	end,
		-- 	"Find first char to back",
		-- },
	},

	v = {
		["<leader>/"] = {
			"<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
			"Toggle comment",
		},
	},
}

mappings.telescope = {
	n = {
		-- find
		["<leader>ff"] = { "<cmd> Telescope find_files <CR>", "Find files" },
		["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
		["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
		["<leader>fb"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
		["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "Help page" },
		["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "Find oldfiles" },
		["<leader>fz"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },

		-- git
		["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
		["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "Git status" },

		-- pick a hidden term
		["<leader>pt"] = { "<cmd> Telescope terms <CR>", "Pick hidden term" },

		-- theme switcher
		["<leader>th"] = { "<cmd> Telescope themes <CR>", "Nvchad themes" },

		["<leader>ma"] = { "<cmd> Telescope marks <CR>", "telescope bookmarks" },
	},
}

mappings.lspconfig = {
	n = {
		["gD"] = {
			function()
				vim.lsp.buf.declaration()
			end,
			"LSP declaration",
		},

		["gd"] = {
			function()
				vim.lsp.buf.definition()
			end,
			"LSP definition",
		},

		["K"] = {
			function()
				vim.lsp.buf.hover()
			end,
			"LSP hover",
		},

		["gi"] = {
			function()
				vim.lsp.buf.implementation()
			end,
			"LSP implementation",
		},

		["<leader>ls"] = {
			function()
				vim.lsp.buf.signature_help()
			end,
			"LSP signature help",
		},

		["<leader>D"] = {
			function()
				vim.lsp.buf.type_definition()
			end,
			"LSP definition type",
		},

		["<leader>ra"] = {
			function()
				require("nvchad.renamer").open()
			end,
			"LSP rename",
		},

		["<leader>ca"] = {
			function()
				vim.lsp.buf.code_action()
			end,
			"LSP code action",
		},

		["gr"] = {
			function()
				vim.lsp.buf.references()
			end,
			"LSP references",
		},

		["<leader>lf"] = {
			function()
				vim.diagnostic.open_float({ border = "rounded" })
			end,
			"Floating diagnostic",
		},

		["[d"] = {
			function()
				vim.diagnostic.goto_prev({ float = { border = "rounded" } })
			end,
			"Goto prev",
		},

		["]d"] = {
			function()
				vim.diagnostic.goto_next({ float = { border = "rounded" } })
			end,
			"Goto next",
		},

		["<leader>q"] = {
			function()
				vim.diagnostic.setloclist()
			end,
			"Diagnostic setloclist",
		},

		["<leader>wa"] = {
			function()
				vim.lsp.buf.add_workspace_folder()
			end,
			"Add workspace folder",
		},

		["<leader>wr"] = {
			function()
				vim.lsp.buf.remove_workspace_folder()
			end,
			"Remove workspace folder",
		},

		["<leader>wl"] = {
			function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end,
			"List workspace folders",
		},
	},

	v = {
		["<leader>ca"] = {
			function()
				vim.lsp.buf.code_action()
			end,
			"LSP code action",
		},
	},
}

mappings.dap = {
	n = {
		["<leader>db"] = {
			function()
				require("dap").toggle_breakpoint()
			end,
			"Toggle breakpoint",
		},
		["<leader>du"] = {
			function()
				require("dapui").toggle()
			end,
			"Toggle dap-ui",
		},
		["<leader>dc"] = {
			function()
				require("dap").continue()
			end,
		},
		["<leader>dsi"] = {
			function()
				require("dap").step_into()
			end,
		},
		["<leader>dso"] = {
			function()
				require("dap").step_over()
			end,
		},
	},
}

local autocmd = vim.api.nvim_create_autocmd

autocmd("FileType", {
	pattern = "typst",
	callback = function()
		mappings.typst = {
			n = {
				["<F5>"] = "<cmd> TypstPreview <cr>",
			},
		}
	end,
})

for _, section in pairs(mappings) do
	for mode, mode_values in pairs(section) do
		for keybind, mapping_info in pairs(mode_values) do
			vim.keymap.set(mode, keybind, mapping_info[1], { noremap = true })
		end
	end
end
