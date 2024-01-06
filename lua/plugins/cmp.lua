local cmp = require("cmp")
local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
-- local luasnip = require("luasnip")
-- local function has_words_before()
-- 	local line, col = (table.unpack)(vim.api.nvim_win_get_cursor(0))
-- 	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
-- end

cmp.setup({
	snippet = {
		expand = function(args)
			-- luasnip.lsp_expand(args.body)
			vim.fn["UltiSnips#Anon"](args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
	},
	mapping = {
		["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
		["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
		["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-y>"] = cmp.config.disable,
		["<C-e>"] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close() }),
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<Tab>"] = cmp.mapping(function(fallback)
			cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
		end, {
			"i",
			"s", --[[ "c" (to enable the mapping in command mode) ]]
		}),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			cmp_ultisnips_mappings.jump_backwards(fallback)
		end, {
			"i",
			"s", --[[ "c" (to enable the mapping in command mode) ]]
		}),
		-- ["<Tab>"] = cmp.mapping(function(fallback)
		-- 	if cmp.visible() then
		-- 		cmp.select_next_item()
		-- 	elseif luasnip.expand_or_jumpable() then
		-- 		luasnip.expand_or_jump()
		-- 	elseif has_words_before() then
		-- 		cmp.complete()
		-- 	else
		-- 		fallback()
		-- 	end
		-- end, { "i", "s" }),
		-- ["<S-Tab>"] = cmp.mapping(function(fallback)
		-- 	if cmp.visible() then
		-- 		cmp.select_prev_item()
		-- 	elseif luasnip.jumpable(-1) then
		-- 		luasnip.jump(-1)
		-- 	else
		-- 		fallback()
		-- 	end
		-- end, { "i", "s" }),
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp", priority = 1000 },
		{ name = "vimtex", priority = 1000 },
		{ name = "ultisnips", priority = 750 },
		{ name = "path", priority = 250 },
	}),
})
