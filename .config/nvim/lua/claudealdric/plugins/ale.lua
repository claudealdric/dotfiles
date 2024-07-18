return {
	"dense-analysis/ale",
	event = { "BufRead" },
	config = function()
		local g = vim.g

		g.ale_linters = {}
	end,
}
