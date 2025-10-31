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
				sync_install = false,
				ensure_installed = {
					"bash",
					"c",
					"lua",
					"vim",
					"vimdoc",
					"query",
					"go",
					"javascript",
					"typescript",
					"tsx",
					"html",
					"css",
					"rust",
					"php",
					"ruby",
					"scala",
				},
			})
		end,
	},
}
