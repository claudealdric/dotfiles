return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		-- to improve the performance of telescope
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		require("telescope").load_extension("fzf")

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
	end,
}
