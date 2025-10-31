local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("i", "<C-c>", "<ESC>", opts)
map("n", "<ESC>", "<cmd>noh<CR>", opts)
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "file copy whole" }, opts)

-- Save file
map("n", "<leader>w", ":w<CR>", { desc = "Save file" }, opts)

-- Move highlighted lines around
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Move windows
-- map("n", "<leader>h", "<C-w><C-h>", { desc = "Move focus to the left window" }, opts)
-- map("n", "<leader>l", "<C-w><C-l>", { desc = "Move focus to the right window" }, opts)
-- map("n", "<leader>j", "<C-w><C-j>", { desc = "Move focus to the lower window" }, opts)
-- map("n", "<leader>k", "<C-w><C-k>", { desc = "Move focus to the upper window" }, opts)

-- Don't move cursors to end of line when pressing J
map("n", "J", "mzJ`z", opts)

-- Keep cursor in middle when movingremap
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)

-- Delete to void buffer
map("x", "<leader>p", '"_dP', { desc = "Overwrite to void buffer" }, opts)
map("n", "<leader>d", '"_d', { desc = "Delete to void buffer" }, opts)
map("v", "<leader>d", '"_d', { desc = "Delete to void buffer" }, opts)

-- System clipboard
map("n", "<leader>y", '"+y', opts)
map("v", "<leader>y", '"+y', opts)
map("n", "<leader>Y", '"+Y', opts)

-- better indent handling
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

map("n", "<leader><space>", "<C-^>", { desc = "Swap to last file" }, opts)

-- Highlight on Yank
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- LSP
-- VSCODE

map({"n", "v"}, "<leader>ff", "<cmd>lua require('vscode').action('find-it-faster.findFiles')<CR>")
map({"n", "v"}, "<leader>e", "<cmd>lua require('vscode').action('workbench.view.explorer')<CR>")
map({"n", "v"}, "<leader>s", "<cmd>lua require('vscode').action('workbench.action.gotoSymbol')<CR>")
map({"n", "v"}, "<leader>S", "<cmd>lua require('vscode').action('workbench.action.showAllSymbols')<CR>")
map({"n", "v"}, "<leader>,", "<cmd>lua require('vscode').call('find-it-faster.findWithinFiles')<CR>")