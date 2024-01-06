local dap = require("dap")

dap.adapters.codelldb = {
	type = "server",
	port = "${port}",
	-- host = "127.0.0.1",
	-- port = 13000,
	executable = {
		command = "codelldb",
		args = { "--port", "${port}" },
	},
}

dap.adapters.gdb = {
	type = "executable",
	command = "gdb",
	args = { "-i", "dap" },
}

-- CodeLLDB --
-- dap.configurations.cpp = {
-- 	{
-- 		name = "Launch file",
-- 		type = "codelldb",
-- 		request = "launch",
-- 		program = function()
-- 			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
-- 		end,
-- 		cwd = "${workspaceFolder}",
-- 		stopOnEntry = false,
-- 	},
-- }

dap.configurations.cpp = {
	{
		name = "Launch",
		type = "gdb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
	},
}
