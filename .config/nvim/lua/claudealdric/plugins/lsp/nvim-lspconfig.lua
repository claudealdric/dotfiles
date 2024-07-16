return {
	"neovim/nvim-lspconfig",
	event = { "BufRead" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local mason_lspconfig = require("mason-lspconfig")

		local keymap = vim.keymap
		local buf = vim.lsp.buf
		local diagnostic = vim.diagnostic
		local opts = { noremap = true }

		local default_on_attach = function(_, bufnr)
			opts.buffer = bufnr

			opts.desc = "Show LSP type definitions"
			keymap.set("n", "gt", buf.type_definition, opts)

			opts.desc = "Show code actions"
			keymap.set("n", "<leader>a", buf.code_action, opts)

			opts.desc = "Rename"
			keymap.set("n", "<F2>", buf.rename, opts)

			opts.desc = "Show buffer diagnostics"
			keymap.set(
				"n",
				"<leader>D",
				"<cmd>Telescope diagnostics bufnr=0<cr>",
				opts
			)

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

		-- Change the Diagnostic symbols in the sign column (gutter)
		-- local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		-- for type, icon in pairs(signs) do
		-- 	local hl = "DiagnosticSign" .. type
		-- 	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		-- end

		local default_capabilities = cmp_nvim_lsp.default_capabilities()

		mason_lspconfig.setup_handlers({
			-- default handler for installed servers
			function(server_name)
				lspconfig[server_name].setup({
					capabilities = default_capabilities,
					on_attach = default_on_attach,
				})
			end,
			["lua_ls"] = function(server_name)
				lspconfig[server_name].setup({
					settings = {
						Lua = {
							runtime = {
								version = "LuaJIT",
							},
							diagnostics = {
								globals = { "vim" },
							},
							workspace = {
								checkThirdParty = false,
								library = {
									vim.env.VIMRUNTIME,
								},
							},
						},
					},
				})
			end,
		})
	end,
}
