require("mason").setup()
require("mason-lspconfig").setup()

local cwd = vim.loop.cwd

require("mason-lspconfig").setup_handlers({
	function(server_name)
		require("lspconfig")[server_name].setup({})
	end,

	["typst_lsp"] = function()
		require("lspconfig").typst_lsp.setup({
			settings = {
				exportPdf = "onType",
			},
			filetypes = { "typst" },
			root_dir = cwd,
		})
	end,

	["lua_ls"] = function()
		require("lspconfig").lua_ls.setup({
			settings = {
				Lua = {
					diagnostics = {
						globals = {
							"vim",
						},
					},
				},
			},
		})
	end,
})

-- Asymptote LSP
-- local lspconfig = require("lspconfig")
-- local configs = require("lspconfig.configs")
-- local util = require("lspconfig.util")
--
-- if not configs.asy_ls then
-- 	configs.asy_ls = {
-- 		default_config = {
-- 			cmd = { "asy", "-lsp" },
-- 			filetypes = { "asy" },
-- 			root_dir = cwd,
-- 			single_file_support = true,
-- 			settings = {},
-- 		},
-- 	}
-- end
-- lspconfig.asy_ls.setup({})
