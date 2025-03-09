return {
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
						name = "Dayfox",
						colorscheme = "dayfox",
					},
					{
						name = "Nordfox",
						colorscheme = "nordfox",
					},
					{
						name = "Rose Pine",
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
		end,
	},
}
