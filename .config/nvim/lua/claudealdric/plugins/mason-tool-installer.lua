return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = {
		"williamboman/mason.nvim",
	},
	event = "VeryLazy",
	opts = {
		ensure_installed = {
			"delve", -- DAP for Go
			"eslint_d",
			"golangci-lint",
			"prettierd",
			"stylua",
		},
		run_on_start = true,
	},
	keys = {
		{ "<leader>ti", "<cmd>MasonToolsInstall<cr>" },
	},
}
