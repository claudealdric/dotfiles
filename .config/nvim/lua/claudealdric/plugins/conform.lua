return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{
			"<leader>;",
			function()
				require("conform").format()
			end,
			{ "n", "v" },
			desc = "Format file (or range in visual mode)",
		},
	},
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				css = { "prettierd", "prettier", stop_after_first = true },
				go = { "gofumpt", "gci" },
				graphql = { "prettierd", "prettier", stop_after_first = true },
				html = { "prettierd", "prettier", stop_after_first = true },
				javascript = {
					"prettierd",
					"prettier",
					stop_after_first = true,
				},
				javascriptreact = {
					"prettierd",
					"prettier",
					stop_after_first = true,
				},
				json = { "prettierd", "prettier", stop_after_first = true },
				lua = { "stylua" },
				markdown = { "prettierd", "prettier", stop_after_first = true },
				typescript = {
					"prettierd",
					"prettier",
					stop_after_first = true,
				},
				typescriptreact = {
					"prettierd",
					"prettier",
					stop_after_first = true,
				},
				yaml = { "prettierd", "prettier", stop_after_first = true },
				-- Use the "_" filetype to run formatters on filetypes that don't
				-- have other formatters configured.
				["_"] = { "trim_whitespace" },
			},
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_format = "fallback",
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>;", function()
			require("conform").format()
		end, { desc = "Format file (or range in visual mode)" })
	end,
}
