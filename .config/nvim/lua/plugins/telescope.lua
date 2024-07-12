return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-fzf-native.nvim", -- to improve the performance of telescope
		build = "make",
	},
	config = function()
		require("telescope").load_extension("fzf")
	end,
}
