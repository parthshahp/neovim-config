function ColorNvim(color)
	color = color or "gruvbox-material"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

vim.o.background = "dark"
vim.g.gruvbox_material_foreground = "original"
vim.g.gruvbox_material_background = "hard"

ColorNvim()
