return {
	--Mason
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"stylua",
				"prettierd",
				"isort",
				"lua-language-server",
				"gopls",
				"pyright",
				"html-lsp",
				"css-lsp",
				"tailwindcss-language-server",
				"svelte-language-server",
			},
		},
		config = function(_, opts)
			require("mason").setup(opts)

			vim.api.nvim_create_user_command("MasonInstallAll", function()
				if opts.ensure_installed and #opts.ensure_installed > 0 then
					vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
				end
			end, {})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
	},
	--LSP
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("parth.config.nvim_lsp").defaults()
		end,
	},
	--Completion
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = function(_, opts)
			local cmp = require("cmp")
			opts.sources = {
				{ name = "nvim_lsp" },
			}
			opts.mapping = cmp.mapping.preset.insert({
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
			})
			cmp.setup(opts)
		end,
		dependencies = {
			{
				"windwp/nvim-autopairs",
				opts = {
					fast_wrap = {},
					disable_filetype = { "TelescopePrompt", "vim" },
				},
				config = function(_, opts)
					require("nvim-autopairs").setup(opts)

					-- setup cmp for autopairs
					local cmp_autopairs = require("nvim-autopairs.completion.cmp")
					require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
				end,
			},
		},
	},
	{
		"L3MON4D3/LuaSnip",
	},
}
