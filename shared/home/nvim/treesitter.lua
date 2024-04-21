build = ":TSUpdate"
local parser_install_dir = vim.fn.stdpath("cache") .. "/treesitters"
vim.fn.mkdir(parser_install_dir, "p")

vim.opt.runtimepath:append(parser_install_dir)

require("nvim-treesitter.configs").setup({
	parser_install_dir = parser_install_dir,
	ensure_installed = { "yuck", "lua", "bash", "css" },
	auto_install = { enable = true },
	highlight = { enable = true },
	indent = { enable = true },
})
