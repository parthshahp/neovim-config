return {
	"folke/persistence.nvim",
	event = "BufReadPre", -- this will only start session saving when an actual file was opened
	opts = {
		-- add any custom options here
	},
	vim.keymap.set("n", "<leader>qs", function()
		require("persistence").load()
	end),
}
