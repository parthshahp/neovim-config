local o = vim.o
local g = vim.g

-- Global
g.mapleader = " "
-- g.netrw_liststyle = 3
-- g.netrw_winsize = 20
g.netrw_banner = 0

-- Options
o.mouse = "a"

o.nu = true
o.numberwidth = 2
o.ruler = false
o.showmode = false
o.relativenumber = true

o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.smartindent = true

o.wrap = false

o.hlsearch = true
o.incsearch = true
-- o.inccommand = "split"

o.scrolloff = 14
o.signcolumn = "yes"
o.cursorline = true
o.cursorlineopt = "number"

o.ignorecase = true
o.smartcase = true

o.updatetime = 250

-- Add mason.nvim binaries to path
local is_windows = vim.fn.has("win32") ~= 0
vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin" .. (is_windows and ";" or ":") .. vim.env.PATH

-- Neovide
if g.neovide then
	o.guifont = "JetBrainsMono Nerd Font:h18"
	g.neovide_padding_top = 8
	g.neovide_padding_bottom = 8
	g.neovide_padding_right = 8
	g.neovide_padding_left = 8
	g.neovide_cursor_animation_length = 0.10
end
