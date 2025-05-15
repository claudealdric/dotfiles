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
			format_on_save = function(bufnr)
				-- Disable with a global or buffer-local variable
				if
					vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat
				then
					return
				end

				-- Get the full path and extract just the filename
				local filename =
					vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufnr), ":t")

				-- Skip formatting for specific filenames
				local excluded = {
					["values.yaml"] = true,
					["values.yml"] = true,
					["application.json"] = true,
				}

				if excluded[filename] then
					return
				end

				return {
					async = true,
					lsp_format = "fallback",
				}
			end,
		})

		vim.keymap.set({ "n", "v" }, "<leader>;", function()
			require("conform").format()
		end, { desc = "Format file (or range in visual mode)" })
	end,
}
