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
		-- I want to search symlinked files.
		table.insert(vimgrep_arguments, "--follow")
		-- I want to search in hidden/dot files.
		table.insert(vimgrep_arguments, "--hidden")
		-- I don't want to search in the `.git` directory.
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

		-- Helpful mappings: https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file#default-mappings
		local keymap = vim.keymap
		keymap.set("n", "<leader>f", "<cmd>Telescope find_files<cr>", {
			desc = "Find files, fuzzy finder-style",
			noremap = true,
		})
		keymap.set("n", "<leader>gf", "<cmd>Telescope live_grep<cr>", {
			desc = "Perform grep on the files in the current working directory",
			noremap = true,
		})
		keymap.set("n", "<leader>b", "<cmd>Telescope buffers<cr>", {
			desc = "Find buffers, fuzzy finder-style",
			noremap = true,
		})
		keymap.set("n", "<leader>th", "<cmd>Telescope help_tags<cr>", {
			desc = "Lists available help tags",
			noremap = true,
		})
		keymap.set("n", "<leader>gs", "<cmd>Telescope grep_string<cr>", {
			desc = "Searches for the string under your cursor or selection in your current working directory",
			noremap = true,
		})
		keymap.set(
			"n",
			"<leader>gb",
			"<cmd>Telescope current_buffer_fuzzy_find<cr>",
			{
				desc = "Fuzzy find in buffer",
				noremap = true,
			}
		)
		keymap.set("n", "<leader>ch", "<cmd>Telescope command_history<cr>", {
			desc = "Lists commands that were executed recently",
			noremap = true,
		})
		keymap.set("n", "<leader>m", "<cmd>Telescope keymaps<cr>", {
			desc = "Lists normal mode keymappings",
			noremap = true,
		})
		keymap.set("n", "<leader>gc", "<cmd>Telescope git_bcommits<cr>", {
			desc = "Lists commits for current buffer with diff preview",
			noremap = true,
		})
		keymap.set("n", "<leader>tt", "<cmd>TodoTelescope<cr>", {
			desc = "Find all to-do's",
			noremap = true,
		})
	end,
}
