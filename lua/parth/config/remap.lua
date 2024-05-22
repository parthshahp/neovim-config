local map = vim.keymap.set

map("n", "<leader>pv", vim.cmd.Ex, { desc = "Open NetRW" })
--map("n", "<C-n>", vim.cmd.Ex, { desc = "Open NetRW" })
map("i", "<C-c>", "<ESC>")
map("n", "<ESC>", "<cmd>noh<CR>")
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "file copy whole" })

-- Move highlighted lines around
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Don't move cursors to end of line when pressing J
map("n", "J", "mzJ`z")

-- Keep cursor in middle when movingremap
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Delete to void buffer
-- map("x", "<leader>p", '"_dP', { desc = "Overwrite to void buffer" })
-- map("n", "<leader>d", '"_d', { desc = "Delete to void buffer" })
-- map("v", "<leader>d", '"_d', { desc = "Delete to void buffer" })

-- Jump in quickfix list
map("n", "<C-j>", ":cnext<CR>")
map("n", "<C-k>", ":cprev<CR>")

-- System clipboard
map("n", "<leader>y", '"+y')
map("v", "<leader>y", '"+y')
map("n", "<leader>Y", '"+Y')

map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Highlight on Yank
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

map("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Open Git Preview Hunk" })
map({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", { desc = "Reset Hunk" })

-- Telescope
local builtin = require("telescope.builtin")
map("n", "<leader>ff", builtin.find_files, { desc = "Find File" })
map("n", "<leader>fw", builtin.live_grep, { desc = "Live Grep" })
map("n", "<leader>fo", builtin.oldfiles, { desc = "Old Files" })
map("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
map("n", "<leader>fd", builtin.diagnostics, { desc = "Diagnostics" })
map("n", "<leader>fg", builtin.git_status, { desc = "Git Status" })
map("n", "<leader>fh", builtin.help_tags, { desc = "Help" })
map("n", "<leader>fz", builtin.current_buffer_fuzzy_find, { desc = "Current Buffer Find" })
map("n", "<leader>fr", function()
  require("telescope.builtin").lsp_references()
end, { desc = "Find References" })
