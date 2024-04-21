local null_ls = require ("null-ls")
local lspconfig = require("lspconfig")

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "bashls", "cssls", "pylsp", "nil_ls", "rust_analyzer" }
})

lspconfig.lua_ls.setup({
	settings = {
		Lua = {
			runtime = {
				'LuaJIT',
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				}, 
					--vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
})

lspconfig.rust_analyzer.setup{}
lspconfig.bashls.setup{}
lspconfig.cssls.setup{}
lspconfig.pylsp.setup{}
lspconfig.nil_ls.setup{}
lspconfig.lua_ls.setup{}

require("lspkind").init({
	mode = 'symbol_text',
	preset = 'default',
})

local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = false })
local event = "BufWritePre"
local async = event == "BufWritePost"

--null_ls.setup({
--	on_attach = function(client, bufnr)
--		if client.supports_method("textDocument/formatting") then
--			vim.keymap.set("n", "<Leader>f", function()
--				vim.lsp.buf.format({ bufner = vim.api.nvim_get_current_buf() })
--			end, { buffer = bufnr, desc = "[lsp] format" })
--
--			vim.api.nvim_clear_autocmds({ buffer = bufner, group = group })
--			vim.api.nvim_create_autocmd( event, {
--				buffer = bufnr,
--				callback = function()
--					vim.lsp.buf.format({ bufnr = bufnr, async = async })
--				end,
--				desc = "[lsp] format on save",
--			})
--		end
--
--		if client.supports_method("textDocument/rangeFormatting") then
--			vim.keymap.set("x", "<Leader>f", function()
---				vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
--			end, { buffer = bufnr, desc = "[lsp] format" })
--		end
--	end,
--})
--
--local prettier = require("prettier")
--prettier.setup({
--	bin = 'prettier',
--	filetypes = {
--	"css",
--	"html",
--	"scss",
--	},
--})
