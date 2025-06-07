local map = vim.keymap.set

-- map("n", "<C-b>", vim.cmd.Ex, { desc = "Open NetRW" })
map("i", "<C-c>", "<ESC>")
map("n", "<ESC>", "<cmd>noh<CR>")
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "file copy whole" })

-- Move highlighted lines around
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Move windows
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Don't move cursors to end of line when pressing J
map("n", "J", "mzJ`z")

-- Keep cursor in middle when movingremap
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Delete to void buffer
map("x", "<leader>p", '"_dP', { desc = "Overwrite to void buffer" })
map("n", "<leader>d", '"_d', { desc = "Delete to void buffer" })
map("v", "<leader>d", '"_d', { desc = "Delete to void buffer" })

-- System clipboard
-- map("n", "<leader>y", '"+y')
-- map("v", "<leader>y", '"+y')
-- map("n", "<leader>Y", '"+Y')

map("n", "<leader><space>", "<C-^>", { desc = "Swap to last file" })

-- Highlight on Yank
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- LSP
