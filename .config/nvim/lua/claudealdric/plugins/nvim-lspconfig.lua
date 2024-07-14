return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")
		local opts = { noremap = true, buffer = 0 }
		lspconfig.gopls.setup({
			on_attach = function()
				-- vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
				vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
				vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, opts)
			end,
		})
	end,
}
