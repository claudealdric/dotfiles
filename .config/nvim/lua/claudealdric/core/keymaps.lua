vim.g.mapleader = " "

local keymap = vim.keymap

-- insert mode
keymap.set("i", "wq", "<ESC>", { desc = "Exit Insert Mode with 'wq'", noremap = true })

-- normal mode
keymap.set("n", "<leader>/", "<CMD>set hlsearch!<CR>", { desc = "Toggle highlight search", noremap = true })
keymap.set("n", "<leader><F2>", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- visual mode
-- "greatest remap ever" —Primeagen
keymap.set("x", "<leader>p", '"_dP') -- deleted words do not override default register
keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- you can drag highlighted sections
keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- you can drag highlighted sections

-- splits
keymap.set("n", "<leader>v", "<CMD>vsplit<CR>", { desc = "Create a vertical split", noremap = true })
keymap.set("n", "<leader>s", "<CMD>split<CR>", { desc = "Create a horizontal split", noremap = true })
keymap.set("n", "<leader>h", "<C-w>h", { desc = "Move to the left split" })
keymap.set("n", "<leader>j", "<C-w>j", { desc = "Move to the bottom split" })
keymap.set("n", "<leader>k", "<C-w>k", { desc = "Move to the top split" })
keymap.set("n", "<leader>l", "<C-w>l", { desc = "Move to the right split" })

-- tabs
keymap.set("n", "<leader>n", "<CMD>tabnew %<CR>", { desc = "Create a new tab", noremap = true })
keymap.set("n", "<S-Tab>", "<CMD>tabprev<CR>", { desc = "Move to the previous tab", noremap = true })
keymap.set("n", "<Tab>", "<CMD>tabnext<CR>", { desc = "Move to the next tab", noremap = true })

-- Telescope
-- Helpful mappings: https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file#default-mappings
keymap.set("n", "<leader>f", "<CMD>Telescope find_files<CR>", {
	desc = "Find files, fuzzy finder-style",
	noremap = true,
})
keymap.set("n", "<leader>gf", "<CMD>Telescope live_grep<CR>", {
	desc = "Perform grep on the files in the current working directory",
	noremap = true,
})
keymap.set("n", "<leader>b", "<CMD>Telescope buffers<CR>", {
	desc = "Find buffers, fuzzy finder-style",
	noremap = true,
})
keymap.set("n", "<leader>th", "<CMD>Telescope help_tags<CR>", {
	desc = "Lists available help tags",
	noremap = true,
})
keymap.set("n", "<leader>gs", "<CMD>Telescope grep_string<CR>", {
	desc = "Searches for the string under your cursor or selection in your current working directory",
	noremap = true,
})
keymap.set("n", "<leader>ch", "<CMD>Telescope command_history<CR>", {
	desc = "Lists commands that were executed recently",
	noremap = true,
})
keymap.set("n", "<leader>m", "<CMD>Telescope keymaps<CR>", {
	desc = "Lists normal mode keymappings",
	noremap = true,
})
keymap.set("n", "<leader>gc", "<CMD>Telescope git_bcommits<CR>", {
	desc = "Lists commits for current buffer with diff preview",
	noremap = true,
})

-- Undotree
keymap.set("n", "<leader>u", "<CMD>UndotreeToggle<CR>", {
	desc = "Visualize the undo history",
	noremap = true,
})
