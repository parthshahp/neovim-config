-- LSP Setup
local M = {}
local map = vim.keymap.set

M.on_attach = function(client, bufnr)
	local function opts(desc)
		return { buffer = bufnr, desc = "LSP " .. desc }
	end

	map("n", "<leader>d", vim.diagnostic.open_float, opts("Open Diagnostic Float"))
	map("n", "K", vim.lsp.buf.hover, opts("Hover"))
	map("n", "gd", vim.lsp.buf.definition, opts("Definition"))
	map("n", "gD", vim.lsp.buf.declaration, opts("Declaration"))
	map("n", "gI", vim.lsp.buf.implementation, opts("Implementation"))
	map("n", "cd", vim.lsp.buf.rename, opts("Rename"))
	map("n", "go", vim.lsp.buf.type_definition, opts("Type Definition"))
	map("n", "g.", vim.lsp.buf.code_action, opts("Code Action"))
end

M.defaults = function()
	local lspconfig = require("lspconfig")
	local servers = {
		"lua_ls",
		"html",
		"cssls",
		"ts_ls",
		"tailwindcss",
		"eslint",
	}

	for _, lsp in ipairs(servers) do
		lspconfig[lsp].setup({
			on_attach = M.on_attach,
			capabilities = vim.lsp.protocol.make_client_capabilities(),
		})
	end
end

return M
