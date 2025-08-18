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
				css = { "prettier", stop_after_first = true },
				go = { "gofumpt", "gci" },
				graphql = { "prettier", stop_after_first = true },
				html = { "prettier", stop_after_first = true },
				javascript = {

					"prettier",
					stop_after_first = true,
				},
				javascriptreact = {

					"prettier",
					stop_after_first = true,
				},
				json = {
					--
					"prettier",
					stop_after_first = true,
				},
				lua = { "stylua" },
				markdown = { "prettier", stop_after_first = true },
				typescript = {

					"prettier",
					stop_after_first = true,
				},
				typescriptreact = {

					"prettier",
					stop_after_first = true,
				},
				yaml = { "prettier", stop_after_first = true },
				-- Use the "_" filetype to run formatters on filetypes that don't
				-- have other formatters configured.
				["_"] = { "trim_whitespace" },
			},
			format_after_save = function(bufnr)
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
			conform.format({ async = true, lsp_format = "fallback" })
		end, { desc = "Format file (or range in visual mode)" })

		vim.api.nvim_create_user_command("FormatDisable", function(args)
			if args.bang then
				-- FormatDisable! will disable formatting just for this buffer
				vim.b.disable_autoformat = true
			else
				vim.g.disable_autoformat = true
			end
		end, {
			desc = "Disable autoformat-on-save",
			bang = true,
		})
		vim.api.nvim_create_user_command("FormatEnable", function()
			vim.b.disable_autoformat = false
			vim.g.disable_autoformat = false
		end, {
			desc = "Re-enable autoformat-on-save",
		})
	end,
}
