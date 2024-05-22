function GruvboxMaterial(color)
	vim.o.background = "dark"
	vim.g.gruvbox_material_foreground = "original"
	vim.g.gruvbox_material_background = "hard"

	color = "gruvbox-material"
	vim.cmd.colorscheme(color)
end

function Catppuccin(flavour)
	flavour = flavour or "mocha"
	require("catppuccin").setup({
		flavour = flavour,
	})
	vim.cmd.colorscheme("catppuccin")
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

-- GruvboxMaterial()
Catppuccin()
