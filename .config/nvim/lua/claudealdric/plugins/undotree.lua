return {
	"mbbill/undotree",
	config = function()
		vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<cr>", {
			desc = "Visualize the undo history",
			noremap = true,
		})
	end,
}
