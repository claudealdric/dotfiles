-- IDE-like breadcrumbs
return {
	"Bekaboo/dropbar.nvim",
	enabled = true,
	dependencies = {
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
	config = function()
		local dropbar_api = require("dropbar.api")
		local keymap = vim.keymap

		keymap.set(
			"n",
			"[;",
			dropbar_api.goto_context_start,
			{ desc = "Go to start of current context" }
		)
		keymap.set(
			"n",
			"];",
			dropbar_api.select_next_context,
			{ desc = "Select next context" }
		)
	end,
}
