return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
		{ "L3MON4D3/LuaSnip", build = "make install_jsregexp" }, -- snippet engine
		"saadparwaiz1/cmp_luasnip", -- for autocompletion
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		luasnip.add_snippets("go", {
			-- trigger is `iferr`
			luasnip.snippet("iferr", {
				luasnip.text_node({ "if err != nil {", "\t" }),
				luasnip.insert_node(1),
				luasnip.text_node({ "", "}" }),
			}),
			luasnip.snippet("packagemain", {
				luasnip.text_node({ "package main" }),
				luasnip.text_node({ "", "", "func main() {", "\t" }),
				luasnip.insert_node(1),
				luasnip.text_node({ "", "}" }),
			}),
			luasnip.snippet("gofunc", {
				luasnip.text_node({ "go func () {", "\t" }),
				luasnip.insert_node(1),
				luasnip.text_node({ "", "}()" }),
			}),
			luasnip.snippet("print", {
				luasnip.text_node({ "fmt.Println(" }),
				luasnip.insert_node(1),
				luasnip.text_node({ ")" }),
			}),
		})
		-- ./nvim-cmp.lua
		-- loads vscode style snippets from installed plugins
		-- (e.g., friendly-snippets)
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				-- Accept currently selected item. Set `select` to `false` to
				-- only confirm explicitly selected items.
				["<cr>"] = cmp.mapping.confirm({ select = false }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" }, -- snippets
				{ name = "buffer" }, -- text within current buffer
				{ name = "path" }, -- file system paths
			}),
		})
	end,
}
