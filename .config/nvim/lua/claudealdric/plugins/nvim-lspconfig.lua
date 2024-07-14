return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")
		local opts = { noremap = true, buffer = 0 }
		lspconfig.gopls.setup({
			on_attach = function()
				-- vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover , opts)
			end,
		})
	end,
}
