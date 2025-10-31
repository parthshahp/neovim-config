return {
	--Mason
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		opts = {
			handlers = {
				-- Default handler for other servers
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,
				-- Custom handler for Ruby LSP to use bundle exec
				ruby_lsp = function()
					local config = require("lsp.ruby_lsp")
					require("lspconfig").ruby_lsp.setup(config)
				end,
			},
		},
	},
	{
		"mason-org/mason.nvim",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},
	--LSP
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"mason-org/mason.nvim",
			"saghen/blink.cmp",
		},

		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(event)
					local options = { buffer = event.buf }
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = event.buf,
						callback = function()
							vim.lsp.buf.format({ async = false, id = event.data.client_id })
						end,
					})

					local map = vim.keymap.set
					vim.diagnostic.config({ virtual_lines = false, virtual_text = true })
					map("n", "<leader>d", vim.diagnostic.open_float, options)
					map("n", "K", '<cmd>lua vim.lsp.buf.hover({ border = "rounded" })<cr>', options)
					-- map("n", "gd", vim.lsp.buf.definition, options)
					-- map("n", "gD", vim.lsp.buf.declaration, options)
					map("n", "grn", vim.lsp.buf.rename, options)
					-- map("n", "gI", vim.lsp.buf.implementation, options)
					-- map("n", "gt", vim.lsp.buf.type_definition, options)
					map("n", "g.", vim.lsp.buf.code_action, options)
				end,
			})
		end,
	},
	--Completion
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets", "fang2hou/blink-copilot" },
		version = "1.*",
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = { preset = "enter" },
			appearance = {
				nerd_font_variant = "mono",
			},
			completion = {
				menu = { border = "rounded" },
				documentation = { auto_show = true, window = { border = "rounded" } },
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer", "lazydev", "copilot" },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100, -- make lazydev completions top priority (see `:h blink.cmp`)
					},
					copilot = {
						name = "Copilot",
						module = "blink-copilot",
						score_offset = 50,
						async = true,
					},
				},
				-- path = {
				--   opts = {
				--     get_cwd = function(_)
				--       return vim.fn.getcwd()
				--     end,
				--   },
				-- }
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
			signature = {
				window = { border = "single" },
				enabled = true,
			},
		},
		opts_extend = { "sources.default" },
	},
}
