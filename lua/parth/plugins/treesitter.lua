return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPost", "BufNewFile" },
		version = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				highlight = { enable = true, use_languagetree = true },
				indent = { enable = true },
				ensure_installed = {
					"bash",
					"c",
					"lua",
					"vim",
					"vimdoc",
					"query",
					"python",
					"go",
					"javascript",
					"typescript",
					"html",
					"css",
					"templ",
					"svelte",
					"zig",
				},
			})
		end,
	},
}
