return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"debugloop/telescope-undo.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local builtin = require("telescope.builtin")
		local map = vim.keymap.set
		map("n", "<leader>fd", builtin.diagnostics, { desc = "Diagnostics" })
		map("n", "<leader>fg", builtin.git_status, { desc = "Git Status" })
		map("n", "<leader>fz", builtin.current_buffer_fuzzy_find, { desc = "Current Buffer Find" })
		map("n", "<leader>fq", builtin.quickfix, { desc = "Quickfix" })
		-- map("n", "gs", builtin.lsp_document_symbols, { desc = "Symbol in Document" })
		-- map("n", "gS", builtin.lsp_workspace_symbols, { desc = "Symbol in Workspace" })
		-- map("n", "gr", builtin.lsp_references, { desc = "References" })
	end,
}
