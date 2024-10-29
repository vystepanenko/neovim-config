local keymap = vim.keymap
local opts = { noremap = true, silent = true }

local mapkey = require("util.keymapper").mapkey

-- Dir nav
keymap.set("n", "<leader>ee", ":NvimTreeFocus<CR>", opts)
keymap.set("n", "<leader>ec", ":NvimTreeClose<CR>", opts)

-- Pane nav
-- keymap.set("n", "<C-Left>", "wincmd h", opts) -- Nav left
-- keymap.set("n", "<C-Down>", "wincmd j", opts) -- Nav down
-- keymap.set("n", "<C-Up>", "wincmd k", opts) -- Nav up
-- keymap.set("n", "<C-Right>", "wincmd l", opts) -- Nav right

-- nvim tmux navigation
keymap.set("n", "<C-Left>", ":TmuxNavigateLeft<CR>", opts) -- Nav left
keymap.set("n", "<C-Down>", ":TmuxNavigateDown<CR>", opts) -- Nav down
keymap.set("n", "<C-Up>", ":TmuxNavigateUp<CR>", opts) -- Nav up
keymap.set("n", "<C-Right>", ":TmuxNavigateRight<CR>", opts) -- Nav right

-- Windows managment
keymap.set("n", "<leader>sv", ":vsplit<CR>", opts) -- Nav vertically
keymap.set("n", "<leader>sh", ":split<CR>", opts) -- Nav horizontally
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", opts) -- Toggle minimize

-- Commnet
vim.api.nvim_set_keymap("n", "<C-_>", "gcc", { noremap = false })
vim.api.nvim_set_keymap("v", "<C-_>", "gcc", { noremap = false })

-- Identing
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- Show Full File-Path
mapkey("<leader>fp", "echo expand('%:p')", "n")

-- Gitsigns
keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", opts)
keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", opts)

-- Telescope
mapkey("<leader>gf", "Telescope lsp_references<CR>", "n")
mapkey("<leader>gb", "Telescope git_branches<CR>", "n")

-- Lspsaga
keymap.set("n", "<leader>tt", ":Lspsaga term_toggle<CR>", opts)
