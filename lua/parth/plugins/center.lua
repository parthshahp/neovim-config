return {
	"shortcuts/no-neck-pain.nvim",
	version = "*",
	config = function()
		require("lazy").setup({ { "shortcuts/no-neck-pain.nvim" } })
		require("no-neck-pain").setup({ width = 150, mappings = { enabled = true, toggle = "<Leader>np" } })
	end,
}
