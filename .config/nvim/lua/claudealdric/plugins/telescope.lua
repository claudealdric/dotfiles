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
			"<leader>ff",
			"<cmd>Telescope find_files<cr>",
			desc = "Find files, fuzzy finder-style",
			noremap = true,
		},
		{
			"<leader>gf",
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
			"<leader>gs",
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
			"<leader>gc",
			"<cmd>Telescope git_bcommits<cr>",
			desc = "Lists commits for current buffer with diff preview",
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
