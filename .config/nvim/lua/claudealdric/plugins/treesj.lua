return {
	"Wansmer/treesj",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	keys = {
		{
			"<leader>ts",
			"<cmd>TSJSplit<cr>",
			desc = "TreeSJ split blocks",
			noremap = true,
		},
		{
			"<leader>tj",
			"<cmd>TSJJoin<cr>",
			desc = "TreeSJ join blocks",
			noremap = true,
		},
	},
	opts = {
		use_default_keymaps = false,
		max_join_length = 1000,
	},
}
