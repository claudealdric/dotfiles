local get_lsp_setup_overrides = function(lspconfig)
	return {
		lua_ls = function(server_name)
			lspconfig[server_name].setup({
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						diagnostics = { globals = { "vim" } },
						workspace = {
							checkThirdParty = false,
							library = { vim.env.VIMRUNTIME },
						},
					},
				},
			})
		end,
		harper_ls = function(server_name)
			lspconfig[server_name].setup({
				filetypes = { "markdown" },
			})
		end,
	}
end

local set_keymaps = function(_, bufnr)
	local keymap = vim.keymap
	local buf = vim.lsp.buf
	local diagnostic = vim.diagnostic
	local opts = { noremap = true }

	opts.buffer = bufnr

	opts.desc = "Show LSP type definitions"
	keymap.set("n", "gt", buf.type_definition, opts)

	opts.desc = "Show code actions"
	keymap.set("n", "<leader>a", buf.code_action, opts)

	opts.desc = "Rename"
	keymap.set("n", "<F2>", buf.rename, opts)

	opts.desc = "Show buffer diagnostics"
	keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<cr>", opts)

	opts.desc = "Show line diagnostics"
	keymap.set("n", "<leader>d", diagnostic.open_float, opts)

	opts.desc = "Hover"
	keymap.set("n", "K", buf.hover, opts)

	opts.desc = "Show LSP definitions"
	keymap.set("n", "gd", buf.definition, opts)

	opts.desc = "Go to declaration"
	keymap.set("n", "gD", buf.declaration, opts)

	opts.desc = "Show LSP implementations"
	keymap.set("n", "gi", buf.implementation, opts)

	opts.desc = "Show LSP references"
	keymap.set("n", "gr", buf.references, opts)

	opts.desc = "Restart LSP"
	keymap.set("n", "<leader>rs", "<cmd>LspRestart<cr>", opts)
end

return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local mason_lspconfig = require("mason-lspconfig")

		local default_capabilities = cmp_nvim_lsp.default_capabilities()
		local default_lsp_handler = function(server_name)
			lspconfig[server_name].setup({
				capabilities = default_capabilities,
				on_attach = set_keymaps,
			})
		end

		local setup_handlers_args = { default_lsp_handler }
		local custom_lsp_handlers = get_lsp_setup_overrides(lspconfig)
		for server_name, set_up_server in pairs(custom_lsp_handlers) do
			setup_handlers_args[server_name] = set_up_server
		end

		mason_lspconfig.setup_handlers(setup_handlers_args)
	end,
}
