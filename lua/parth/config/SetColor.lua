function GruvboxMaterial(color)
	vim.o.background = "dark"
	vim.g.gruvbox_material_foreground = "original"
	vim.g.gruvbox_material_background = "hard"

	color = "gruvbox-material"
	vim.cmd.colorscheme(color)
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

function Catppuccin(flavour)
	flavour = flavour or "mocha"
	if flavour ~= "latte" then
		vim.o.background = "dark"
	else
		vim.o.background = "light"
	end
	require("catppuccin").setup({
		flavour = flavour,
	})
	vim.cmd.colorscheme("catppuccin")
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

function Neofusion()
	vim.o.background = "dark"
	require("neofusion").setup({
		transparent_mode = false,
	})
	vim.cmd.colorscheme("neofusion")
end

if vim.g.neovide then
	Neofusion()
else
	-- GruvboxMaterial()
	Catppuccin()
end
