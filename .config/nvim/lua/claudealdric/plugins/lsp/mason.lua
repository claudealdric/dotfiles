return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")

		mason.setup({
			-- ui = {
			-- 	icons = {
			-- 		package_installed = "✓",
			-- 		package_pending = "→",
			-- 		package_uninstalled = "✗",
			-- 	},
			-- },
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"bashls",
				"cssls",
				"docker_compose_language_service",
				"dockerls",
				"emmet_ls",
				"eslint",
				"gopls",
				"graphql",
				"html",
				"jsonls",
				"lua_ls",
				"markdown_oxide",
				"pyright",
				"sqls",
				"tsserver",
				"vimls",
				"yamlls",
			},
			automatic_installation = true,
		})
	end,
}
