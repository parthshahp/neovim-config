local o = vim.o
local g = vim.g

-- Global
vim.keymap.set("n", "<Space>", "", opts)
g.mapleader = " "
g.maplocalleader = " "

-- Options
o.mouse = "a"

o.winborder = "rounded"

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
o.timeoutlen = 300
vim.schedule(function()
  o.clipboard = "unnamedplus"
end)

o.splitright = true
o.splitbelow = true