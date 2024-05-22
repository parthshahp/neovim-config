local o = vim.o

vim.g.mapleader = " "
o.mouse = "a"

o.nu = true
o.numberwidth = 2
o.ruler = true
o.relativenumber = true

o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.smartindent = true

o.wrap = false

o.hlsearch = true
o.incsearch = true
o.inccommand = "split"

o.scrolloff = 14
o.signcolumn = "yes"
o.cursorline = true
o.cursorlineopt = "both"

o.ignorecase = true
o.smartcase = true

o.updatetime = 250

-- Add mason.nvim binaries to path
local is_windows = vim.fn.has("win32") ~= 0
vim.env.PATH = vim.fn.stdpath "data" .. "/mason/bin" .. (is_windows and ";" or ":") .. vim.env.PATH
