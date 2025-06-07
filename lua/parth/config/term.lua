vim.api.nvim_create_autocmd("TermOpen", {
	group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.relativenumber = false
	end,
})

local function open_and_switch_to_terminal()
	local terminal_buffer_found = false
	-- Iterate through all buffers
	for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_loaded(bufnr) then
			local filetype = vim.api.nvim_get_option_value("buftype", { buf = bufnr })
			if filetype == "terminal" then
				local winid = vim.fn.bufwinid(bufnr)
				if winid ~= -1 then
					vim.api.nvim_set_current_win(winid)
				else
					vim.cmd("buffer " .. bufnr) -- Switch to the terminal buffer
				end
				terminal_buffer_found = true
				break
			end
		end
	end

	if not terminal_buffer_found then
		vim.cmd("terminal")
		-- Or 'vsplit term://bash', 'terminal', etc.
		-- If you want it in a new tab: vim.cmd('tabnew | terminal')
	end
end

vim.keymap.set("n", "<leader>j", open_and_switch_to_terminal, { desc = "Open/Switch to Terminal" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit Terminal Mode" })
-- vim.keymap.set("t", "<C-<Esc>>", "<C-\\><C-n>", { desc = "Exit Terminal Mode" })
