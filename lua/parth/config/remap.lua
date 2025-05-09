local map = vim.keymap.set

-- Delete global default keymaps
vim.keymap.del("n", "grn")
vim.keymap.del("n", "gra")
vim.keymap.del("n", "gri")

-- map("n", "<C-b>", vim.cmd.Ex, { desc = "Open NetRW" })
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
map("x", "<leader>p", '"_dP', { desc = "Overwrite to void buffer" })
map("n", "<leader>d", '"_d', { desc = "Delete to void buffer" })
map("v", "<leader>d", '"_d', { desc = "Delete to void buffer" })

-- Jump in quickfix list
map("n", "<C-j>", ":cnext<CR>")
map("n", "<C-k>", ":cprev<CR>")

-- System clipboard
-- map("n", "<leader>y", '"+y')
-- map("v", "<leader>y", '"+y')
-- map("n", "<leader>Y", '"+Y')

map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Highlight on Yank
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- LSP
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)
       local options = { buffer = event.buf }
       vim.api.nvim_create_autocmd("BufWritePre", {
         buffer = event.buf,
         callback = function()
           vim.lsp.buf.format {async = false, id = event.data.client_id }
         end,
       })

        map("n", "<leader>d", vim.diagnostic.open_float, options)
        map("n", "K", vim.lsp.buf.hover, options)
        map("n", "gd", vim.lsp.buf.definition, options)
        map("n", "gD", vim.lsp.buf.declaration, options)
        map("n", "<leader>r", vim.lsp.buf.rename, options)
        map("n", "gI", vim.lsp.buf.implementation, options)
        map("n", "gt", vim.lsp.buf.type_definition, options)
        map("n", "g.", vim.lsp.buf.code_action, options)
    end,
})
