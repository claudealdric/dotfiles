return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- to improve the performance of telescope
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"folke/todo-comments.nvim",
	},
	config = function()
		local telescope = require("telescope")

		local ignore_git_blob = "!**/.git/*"
		local vimgrep_arguments =
			{ unpack(require("telescope.config").values.vimgrep_arguments) }
		-- Search symlinked files
		table.insert(vimgrep_arguments, "--follow")
		-- Search in hidden/dot files
		table.insert(vimgrep_arguments, "--hidden")
		-- Don't search in the `.git` directory
		table.insert(vimgrep_arguments, "--glob")
		table.insert(vimgrep_arguments, ignore_git_blob)

		telescope.setup({
			defaults = {
				-- `hidden = true` is not supported in text grep commands.
				vimgrep_arguments = vimgrep_arguments,
			},
			pickers = {
				find_files = {
					-- `hidden = true` will still show the inside of `.git/` as
					-- it's not `.gitignore`d.
					find_command = {
						"rg",
						"--files",
						"--hidden",
						"--glob",
						ignore_git_blob,
					},
					-- Enable following symlinks
					follow = true,
				},
			},
		})

		telescope.load_extension("fzf")
	end,
	keys = {
		{
			"<leader>tr",
			"<cmd>Telescope lsp_references<cr>",
			desc = "Lists LSP references for word under the cursor",
			noremap = true,
		},
		{
			"<leader>tds",
			"<cmd>Telescope lsp_document_symbols<cr>",
			desc = "Lists LSP document symbols in the current buffer",
			noremap = true,
		},
		{
			"<leader>tim",
			"<cmd>Telescope lsp_implementations<cr>",
			desc = "Go to the implementation of the word under the cursor if there's only one, otherwise show all options in Telescope",
			noremap = true,
		},
		{
			"<leader>tic",
			"<cmd>Telescope lsp_incoming_calls<cr>",
			desc = "Lists LSP incoming calls for word under the cursor",
			noremap = true,
		},
		{
			"<leader>fb",
			"<cmd>Telescope buffers<cr>",
			desc = "Lists open buffers in current neovim instance",
			noremap = true,
		},
		{
			"<leader>ff",
			"<cmd>Telescope find_files<cr>",
			desc = "Find files, fuzzy finder-style",
			noremap = true,
		},
		{
			"<leader>gf",
			function()
				require("telescope.builtin").live_grep({
					glob_pattern = "!vendor/*",
				})
			end,
			"<cmd>Telescope live_grep<cr>",
			desc = "Perform grep on the files in the current working directory",
			noremap = true,
		},
		{
			"<leader>bf",
			"<cmd>Telescope buffers<cr>",
			desc = "Find buffers, fuzzy finder-style",
			noremap = true,
		},
		{
			"<leader>th",
			"<cmd>Telescope help_tags<cr>",
			desc = "Lists available help tags",
			noremap = true,
		},
		{
			"<leader>grs",
			"<cmd>Telescope grep_string<cr>",
			desc = "Searches for the string under your cursor or selection in your current working directory",
			noremap = true,
		},
		{
			"<leader>gb",
			"<cmd>Telescope current_buffer_fuzzy_find<cr>",
			desc = "Fuzzy find in buffer",
			noremap = true,
		},
		{
			"<leader>ch",
			"<cmd>Telescope command_history<cr>",
			desc = "Lists commands that were executed recently",
			noremap = true,
		},
		{
			"<leader>m",
			"<cmd>Telescope keymaps<cr>",
			desc = "Lists normal mode keymappings",
			noremap = true,
		},
		{
			"<leader>gb",
			"<cmd>Telescope git_bcommits<cr>",
			desc = "Lists current buffer commits with diff preview",
			noremap = true,
		},
		{
			"<leader>gc",
			"<cmd>Telescope git_commits<cr>",
			desc = "Lists commits with diff preview",
			noremap = true,
		},
		{
			"<leader>gs",
			"<cmd>Telescope git_status<cr>",
			desc = "Lists current changes per file with diff preview and add action. (Multi-selection still WIP)",
			noremap = true,
		},
		{
			"<leader>gc",
			"<cmd>Telescope git_commits<cr>",
			desc = "Lists commits with diff preview",
			noremap = true,
		},
		{
			"<leader>gc",
			"<cmd>Telescope git_commits<cr>",
			desc = "Lists commits with diff preview",
			noremap = true,
		},
		{
			"<leader>gc",
			"<cmd>Telescope git_commits<cr>",
			desc = "Lists commits with diff preview",
			noremap = true,
		},
		{
			"<leader>tt",
			"<cmd>TodoTelescope<cr>",
			desc = "Find all to-do's",
			noremap = true,
		},
	},
}
