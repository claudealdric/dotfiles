return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		formatters_by_ft = {
			css = { { { "prettierd", "prettier" } } },
			go = { "gofmt" },
			graphql = { { { "prettierd", "prettier" } } },
			html = { { { "prettierd", "prettier" } } },
			javascript = { { { "prettierd", "prettier" } } },
			javascriptreact = { { { "prettierd", "prettier" } } },
			json = { { { "prettierd", "prettier" } } },
			lua = { "stylua" },
			markdown = { { { "prettierd", "prettier" } } },
			typescript = { { { "prettierd", "prettier" } } },
			typescriptreact = { { { "prettierd", "prettier" } } },
			yaml = { { { "prettierd", "prettier" } } },
			-- Use the "_" filetype to run formatters on filetypes that don't
			-- have other formatters configured.
			["_"] = { "trim_whitespace" },
		},
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
	config = function()
		vim.keymap.set({ "n", "v" }, "<leader>;", function()
			require("conform").format({
				timeout_ms = 1000,
				lsp_format = "fallback",
			})
		end, { desc = "Format file (or range in visual mode)" })
	end,
}
