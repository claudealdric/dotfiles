return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
	},
	opts = {
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
	},
}
