return {
	"mfussenegger/nvim-dap",
	keys = {
		{
			"<leader>dc",
			function()
				require("dap").continue()
			end,
			desc = "Debug: continue",
		},
		{
			"<leader>dso",
			function()
				require("dap").step_over()
			end,
			desc = "Debug: step over",
		},
		{
			"<leader>dsi",
			function()
				require("dap").step_into()
			end,
			desc = "Debug: step into",
		},
		{
			"<leader>dsO",
			function()
				require("dap").step_out()
			end,
			desc = "Debug: step out",
		},
		{
			"<leader>db",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "Debug: toggle breakpoint",
		},
		{
			"<leader>dB",
			function()
				require("dap").set_breakpoint()
			end,
			desc = "Debug: set breakpoint",
		},
		{
			"<leader>dlp",
			function()
				require("dap").set_breakpoint(
					nil,
					nil,
					vim.fn.input("Log point message: ")
				)
			end,
			desc = "Debug: log point message",
		},
		{
			"<leader>dro",
			function()
				require("dap").repl.open()
			end,
			desc = "Debug: REPL open",
		},
		{
			"<leader>drl",
			function()
				require("dap").run_last()
			end,
			desc = "Debug: run last",
		},
		{
			"<leader>dh",
			function()
				require("dap.ui.widgets").hover()
			end,
			{ "n", "v" },
			desc = "Debug: hover",
		},
		{
			"<leader>dp",
			function()
				require("dap.ui.widgets").preview()
			end,
			{ "n", "v" },
			desc = "Debug: preview",
		},
		{
			"<leader>df",
			function()
				local widgets = require("dap.ui.widgets")
				widgets.centered_float(widgets.frames)
			end,
			desc = "Debug: frames",
		},
		{
			"<leader>dsl",
			function()
				local widgets = require("dap.ui.widgets")
				widgets.centered_float(widgets.scopes)
			end,
			desc = "Debug: show locals/scope, locals",
		},
	},
}
