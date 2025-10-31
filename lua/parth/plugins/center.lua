return {
	"shortcuts/no-neck-pain.nvim",
	version = "*",
	config = function()
		require("no-neck-pain").setup({ width = 150, mappings = { enabled = true, toggle = "<Leader>np" } })
	end,
}
