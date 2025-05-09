return {
	{
		"navarasu/onedark.nvim",
		lazy = true,
	},
	{
		"EdenEast/nightfox.nvim",
		lazy = true,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		lazy = true,
	},
	{
		"sainnhe/everforest",
		lazy = true,
	},
	{
		"sainnhe/gruvbox-material",
		lazy = true,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = true,
	},
	{
		"zaldih/themery.nvim",
		lazy = false,
		config = function()
			require("themery").setup({
				themes = {
					{
						name = "OneDark",
						colorscheme = "onedark",
						before = [[
              vim.o.background="dark"
            ]],
						after = [[ 
              require("onedark").setup({ style = "warmer"})
              require("onedark").load()
            ]],
					},
					{
						name = "Dayfox",
						colorscheme = "dayfox",
					},
					{
						name = "Nordfox",
						colorscheme = "nordfox",
					},
					{
						name = "Rose Pine Light",
						colorscheme = "rose-pine",
						after = [[
              require("rose-pine").setup({ variant = "dawn" })
            ]],
					},
					{
						name = "Everforest",
						colorscheme = "everforest",
					},
					{
						name = "Rose Pine Dark",
						colorscheme = "rose-pine",
						before = [[
              vim.o.background="dark"
            ]],
						after = [[
              vim.o.background="dark"
              require("rose-pine").setup({ variant = "main" })
            ]],
					},
					{
						name = "Gruvbox Material",
						colorscheme = "gruvbox-material",
					},
					{
						name = "Gruvbox Material Dark",
						colorscheme = "gruvbox-material",
						before = [[
              vim.o.background="dark"
              vim.g.gruvbox_material_foreground = "original"
              vim.g.gruvbox_material_background = "hard"
            ]],
					},
					{
						name = "Catppuccin",
						colorscheme = "catppuccin",
					},
				},
				globalBefore = [[ vim.o.background = "light" ]],
			})
			vim.keymap.set("n", "<leader>th", "<cmd>Themery<CR>", { desc = "Themery" })
		end,
	},
}
