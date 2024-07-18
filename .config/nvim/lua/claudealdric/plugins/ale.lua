return {
	"dense-analysis/ale",
	event = { "BufRead" },
	config = function()
		local g = vim.g

		g.ale_linters = {
			javascript = { "eslint" },
			typescript = { "eslint" },
			go = { "golangci-lint" },
		}
	end,
}
