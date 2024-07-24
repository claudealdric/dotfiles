return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			auto_install = true,
			ensure_installed = {
				"bash",
				"css",
				"dockerfile",
				"git_config",
				"git_rebase",
				"gitattributes",
				"gitcommit",
				"gitignore",
				"go",
				"gomod",
				"gosum",
				"graphql",
				"html",
				"javascript",
				"json",
				"lua",
				"sql",
				"toml",
				"typescript",
				"vim",
				"yaml",
			},
			ignore_install = {
				"tmux",
			},
			highlight = {
				enable = true,
				disable = {
					"tmux",
				},
			},
		})
	end,
}
