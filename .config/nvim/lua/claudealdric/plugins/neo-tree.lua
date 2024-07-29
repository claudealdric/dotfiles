return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		-- Optional image support in preview window: See `# Preview Mode` for
		-- more information
		-- "3rd/image.nvim",
	},
	cmd = "Neotree",
	keys = {
		{
			"<leader>ft",
			function()
				require("neo-tree.command").execute({
					toggle = true,
				})
			end,
			desc = "Open file tree",
		},
		{
			"<leader>ge",
			function()
				require("neo-tree.command").execute({
					source = "git_status",
					toggle = true,
				})
			end,
			desc = "Git explorer",
		},
		{
			"<leader>be",
			function()
				require("neo-tree.command").execute({
					source = "buffers",
					toggle = true,
				})
			end,
			desc = "Buffer explorer",
		},
	},
	opts = {
		window = {
			position = "right",
			width = 40,
			mappings = {
				["<space>"] = "none",
			},
		},
		filesystem = {
			filtered_items = {
				visible = true,
				hide_dotfiles = false,
				hide_gitignored = true,
			},
			follow_current_file = {
				enabled = true,
			},
			use_libuv_file_watcher = true,
		},
		default_component_configs = {
			indent = {
				-- if nil and file nesting is enabled, will enable expanders
				with_expanders = true,
				expander_collapsed = "",
				expander_expanded = "",
				expander_highlight = "NeoTreeExpander",
			},
			git_status = {
				symbols = {
					unstaged = "󰄱",
					staged = "󰱒",
				},
			},
		},
	},
}
