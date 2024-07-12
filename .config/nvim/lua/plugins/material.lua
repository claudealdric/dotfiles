return {
	"marko-cerovac/material.nvim",
	branch = "main",
	lazy = false, -- make sure we load this during startup
	priority = 1000, -- make sure we load this before all others
	config = function()
		vim.g.material_style = "oceanic"
		vim.cmd("colorscheme material")
		require("material.functions").toggle_eob()
	end,
}
