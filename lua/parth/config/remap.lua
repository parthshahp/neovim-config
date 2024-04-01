vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open NetRW" })

-- Move highlighted lines around
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Don't move cursors to end of line when pressing J
vim.keymap.set("n", "J", "mzJ`z")

-- Keep cursor in middle when movingremap
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Delete to void buffer
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Overwrite to void buffer" })
vim.keymap.set("n", "<leader>d", '"_d', { desc = "Delete to void buffer" })
vim.keymap.set("v", "<leader>d", '"_d', { desc = "Delete to void buffer" })

-- System clipboard
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

-- Window key
-- vim.api.nvim_set_keymap('n', '<leader>v', ':vsplit<CR>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<leader>h', ':split<CR>', { noremap = true })
-- vim.keymap.set('n', '<M-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<M-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<M-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<M-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- vim.api.nvim_set_keymap('n', '<leader>do', '<cmd>lua vim.diagnostic.open_float()<CR>', { desc = 'Open Diagnostic Float', noremap = true, silent = true })
vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Open Git Fugitive Window" })
vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Open Git Preview Hunk" })
vim.keymap.set({ "n", "v" }, "<leader>ghr", ":Gitsigns reset_hunk<CR>", { desc = "Reset Hunk" })

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find File" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Old Files" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })