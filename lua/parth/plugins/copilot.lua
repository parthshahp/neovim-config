-- return {
-- 	"zbirenbaum/copilot.lua",
-- 	lazy = true,
-- 	dependencies = {
-- 		"copilotlsp-nvim/copilot-lsp"
-- 	},
-- 	cmd = 'Copilot',
-- 	event = 'InsertEnter',
-- 	config = function()
-- 		require("copilot").setup({
-- 			copilot_node_command = "/Users/parth.shah/.local/share/fnm/node-versions/v22.21.0/installation/bin/node",
-- 			suggestion = {
-- 				enabled = true,
-- 				auto_trigger = true,
-- 				debounce = 75,
-- 				keymap = {
-- 					accept = "<C-l>",
-- 					accept_word = false,
-- 					accept_line = false,
-- 					next = "<M-]>",
-- 					prev = "<M-[>",
-- 					dismiss = "<C-]>",
-- 				},
-- 			},
-- 		})
-- 	end,
-- }

return {
	"zbirenbaum/copilot.lua",
	lazy = true,
	dependencies = {
		"copilotlsp-nvim/copilot-lsp"
	},
	cmd = 'Copilot',
	event = 'InsertEnter',
	config = function()
		require("copilot").setup({
			copilot_node_command = "/Users/parth.shah/.local/share/fnm/node-versions/v22.21.0/installation/bin/node",
			suggestion = {
				enabled = false, 
				auto_trigger = false,
			},
            panel = { enabled = false }, 
		})
	end,
}
