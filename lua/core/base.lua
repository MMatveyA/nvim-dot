vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.mouse = "av"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.clipboard = "unnamedplus"
vim.opt.termguicolors = true
vim.opt.scrolloff = 5
vim.opt.showmode = false
vim.opt.conceallevel = 2

-- Indenting
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

vim.g.mapleader = " "
vim.g.localmapleader = ","

-------------------------------------- autocmds ------------------------------------------
local autocmd = vim.api.nvim_create_autocmd

autocmd("FileType", {
	pattern = "tex",
	callback = function()
		vim.opt.spell = true
		vim.opt.spelllang = "en,ru"
	end,
})

autocmd("FileType", {
	pattern = "typst",
	callback = function()
		vim.opt.spell = true
		vim.opt.spelllang = "en,ru"
	end,
})

autocmd("BufEnter", {
	pattern = "*.asy",
	callback = function()
		vim.opt.filetype = "asy"
	end,
})
