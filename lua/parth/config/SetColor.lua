function GruvboxMaterial(theme)
	if theme == "light" then
		vim.o.background = "light"
		-- vim.g.gruvbox_material_background = ""
		-- vim.g.gruvbox_material_foreground = "original"
	else
		vim.o.background = "dark"
		vim.g.gruvbox_material_foreground = "original"
		vim.g.gruvbox_material_background = "hard"
	end

	vim.cmd.colorscheme("gruvbox-material")
	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
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
	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

function Neofusion()
	vim.o.background = "dark"
	require("neofusion").setup({
		transparent_mode = false,
	})
	vim.cmd.colorscheme("neofusion")
end

-- Neofusion(false)
GruvboxMaterial("dark")
-- Catppuccin("latte")

vim.cmd("command Light silent lua GruvboxMaterial('light')")
vim.cmd("command Dark silent lua GruvboxMaterial('dark')")
