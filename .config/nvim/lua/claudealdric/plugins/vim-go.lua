return {
	"fatih/vim-go",
	event = "VeryLazy",
	init = function()
		vim.g.go_addtags_transform = "camelcase"
		vim.g.go_doc_keywordprg_enabled = 0
		vim.g.go_fmt_autosave = 0
		vim.g.go_imports_autosave = 0
		vim.g.go_mod_fmt_autosave = 0
		-- vim.g.go_gopls_enabled = 0
	end,
}
