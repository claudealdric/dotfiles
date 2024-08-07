return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = { "TabNew" },
	opts = {
		options = {
			mode = "tabs",
			separator_style = "slant",
			auto_toggle_bufferline = false,
			sort_by = "tabs",
		},
	},
}
