local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.asm = {
	install_info = {
		url = "https://github.com/SethBarberee/tree-sitter-asm",
		files = { "src/parser.c" },
		-- optional entries:
		generate_requires_npm = false, -- if stand-alone parser without npm dependencies
		requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
	},
	filetype = "asm", -- if filetype does not match the parser name
}

parser_config.openscad = {
	install_info = {
		url = "https://github.com/bollian/tree-sitter-openscad",
		branch = "master",
		files = { "src/parser.c" },
	},
	filetype = "openscad",
}

parser_config.typ = {
	install_info = {
		url = "https://github.com/SeniorMars/tree-sitter-typst",
		branch = "main",
		files = { "src/parser.c" },
		generate_requires_npm = false, -- if stand-alone parser without npm dependencies
		requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
	},
	filetype = "typ",
}
