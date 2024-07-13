return {
	"marko-cerovac/material.nvim",
	branch = "main",
	lazy = false,
	priority = 500,
	config = function()
		vim.g.material_style = "oceanic"
		vim.cmd("colorscheme material")
		require("material.functions").toggle_eob()
	end,
}
