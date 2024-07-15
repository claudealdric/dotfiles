vim.g.mapleader = " "

local keymap = vim.keymap

-- insert mode
keymap.set("i", "wq", "<ESC>", {
	desc = "Exit Insert Mode with 'wq'",
	noremap = true,
})

-- normal mode
keymap.set("n", "<leader>/", "<CMD>set hlsearch!<CR>", {
	desc = "Toggle highlight search",
	noremap = true,
})
keymap.set(
	"n",
	"<leader><F2>",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Substitute the current term under the cursor", noremap = true }
)

-- visual mode
-- "greatest remap ever" —Primeagen
keymap.set("x", "<leader>p", '"_dP', {
	desc = "Deleted words do not override default register",
	noremap = true,
})
keymap.set("v", "J", ":m '>+1<CR>gv=gv", {
	desc = "Highlighted sections can be dragged downwards",
	noremap = true,
})
keymap.set("v", "K", ":m '<-2<CR>gv=gv", {
	desc = "Highlighted sections can be dragged upwards",
	noremap = true,
})

-- splits
keymap.set("n", "<leader>v", "<CMD>vsplit<CR>", {
	desc = "Create a vertical split",
	noremap = true,
})
keymap.set("n", "<leader>s", "<CMD>split<CR>", {
	desc = "Create a horizontal split",
	noremap = true,
})
keymap.set("n", "<leader>h", "<C-w>h", { desc = "Move to the left split" })
keymap.set("n", "<leader>j", "<C-w>j", { desc = "Move to the bottom split" })
keymap.set("n", "<leader>k", "<C-w>k", { desc = "Move to the top split" })
keymap.set("n", "<leader>l", "<C-w>l", { desc = "Move to the right split" })

-- tabs
keymap.set("n", "<leader>n", "<CMD>tabnew %<CR>", {
	desc = "Create a new tab",
	noremap = true,
})
keymap.set("n", "<S-Tab>", "<CMD>tabprev<CR>", {
	desc = "Move to the previous tab",
	noremap = true,
})
keymap.set("n", "<Tab>", "<CMD>tabnext<CR>", {
	desc = "Move to the next tab",
	noremap = true,
})

-- Undotree
keymap.set("n", "<leader>u", "<CMD>UndotreeToggle<CR>", {
	desc = "Visualize the undo history",
	noremap = true,
})
