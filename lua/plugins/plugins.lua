local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			{
				"williamboman/mason.nvim",
				cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
				config = function()
					require("mason").setup()
				end,
			},
			{ "neovim/nvim-lspconfig" },
		},
		config = function()
			require("plugins.lspconfig")
		end,
	},

	{
		"windwp/nvim-autopairs",
		config = function(_, opts)
			require("nvim-autopairs").setup(opts)
		end,
	},

	-- VimTex
	{
		"micangl/cmp-vimtex",
		dependencies = {
			{
				"lervag/vimtex",
				config = function()
					require("plugins.vimtex")
				end,
			},
		},
	},

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
			"neovim/nvim-lspconfig",

			-- Snippets
			{
				"quangnguyen30192/cmp-nvim-ultisnips",
				config = function()
					require("cmp_nvim_ultisnips").setup({})
				end,
				dependencies = {
					"honza/vim-snippets",
					"SirVer/ultisnips",
				},
			},
		},
		config = function()
			require("plugins.cmp")
		end,
	},

	{
		"mhartington/formatter.nvim",
		config = function()
			require("plugins.formatter")
		end,
	},

	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
		build = ":TSUpdate",
		config = function()
			require("plugins.tree-sitter")
		end,
	},

	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			exclude = {
				buftypes = {
					"nofile",
					"terminal",
				},
				filetypes = {
					"help",
					"startify",
					"aerial",
					"alpha",
					"dashboard",
					"lazy",
					"neogitstatus",
					"NvimTree",
					"neo-tree",
					"Trouble",
				},
			},
		},
	},

	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			"3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		config = function()
			require("plugins.neo-tree")
		end,
	},

	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup({
				theme = "hyper",
			})
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},

	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("plugins.bufferline")
		end,
	},

	{
		"simrat39/symbols-outline.nvim",
		cmd = "SymbolsOutline",
		config = function()
			require("symbols-outline").setup()
		end,
	},

	-- {
	-- 	"feline-nvim/feline.nvim",
	-- 	config = function()
	-- 		require("feline").setup()
	-- 	end,
	-- },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
		config = function()
			require("lualine").setup()
		end,
	},

	{
		"xiyaowong/transparent.nvim",
		config = function()
			require("transparent").clear_prefix("NeoTree")
			require("transparent").clear_prefix("feline")
		end,
	},

	{
		"https://github.com/phaazon/hop.nvim",
		config = function()
			require("hop").setup()
		end,
	},

	{
		"kaarmu/typst.vim",
		ft = "typst",
		lazy = false,
		-- dependencies = { "MrPicklePinosaur/typst-conceal.vim" },
		config = function()
			require("plugins.typst")
		end,
	},
	{
		"chomosuke/typst-preview.nvim",
		-- lazy = false, -- or ft = 'typst'
		ft = "typst",
		version = "0.1.*",
		build = function()
			require("typst-preview").update()
		end,
	},

	{
		"salkin-mada/openscad.nvim",
		config = function()
			require("plugins.openscad")
		end,
	},

	{ "hura/vim-asymptote" },

	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration

			-- Only one of these is needed, not both.
			"nvim-telescope/telescope.nvim", -- optional
			"ibhagwan/fzf-lua", -- optional
		},
		config = true,
	},

	{
		"folke/neodev.nvim",
		opts = {},
		config = function()
			require("neodev").setup({
				library = { plugins = { "nvim-dap-ui" }, types = true },
			})
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			{
				"mfussenegger/nvim-dap",
				config = function()
					require("plugins.dap")
				end,
			},
		},
		config = function()
			require("plugins.dap-ui")
		end,
	},
})
