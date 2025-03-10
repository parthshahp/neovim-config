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
	map("n", "gi", vim.lsp.buf.implementation, opts("Implementation"))
	map("n", "go", vim.lsp.buf.type_definition, opts("Type Definition"))
	map("n", "gr", vim.lsp.buf.references, opts("References"))
	map("n", "gs", vim.lsp.buf.signature_help, opts("Signature Help"))
	map("n", "<leader>r", vim.lsp.buf.rename, opts("Rename"))
	map({ "n", "x" }, "<leader>fm", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts("Format"))
	map("n", "<leader>ca", vim.lsp.buf.code_action, opts("Code Action"))
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
		"gopls",
	}

	for _, lsp in ipairs(servers) do
		lspconfig[lsp].setup({
			on_attach = M.on_attach,
			capabilities = vim.lsp.protocol.make_client_capabilities(),
		})
	end
end

return M
