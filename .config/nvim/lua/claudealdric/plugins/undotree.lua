return {
	"mbbill/undotree",
	config = function()
		vim.keymap.set("n", "<leader>u", "<CMD>UndotreeToggle<CR>", {
			desc = "Visualize the undo history",
			noremap = true,
		})
	end,
}
