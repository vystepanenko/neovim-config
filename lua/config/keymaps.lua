local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- nvim-tree
keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>", opts)
keymap.set("n", "<leader>ec", ":NvimTreeClose<CR>", opts)

-- Commet
vim.api.nvim_set_keymap("n", "<C-_>", "gcc", { noremap = false })
vim.api.nvim_set_keymap("v", "<C-_>", "gcc", { noremap = false })

-- nvim tmux navigation
keymap.set("n", "<C-Left>", ":TmuxNavigateLeft<CR>", opts) -- Nav left
keymap.set("n", "<C-Down>", ":TmuxNavigateDown<CR>", opts) -- Nav down
keymap.set("n", "<C-Up>", ":TmuxNavigateUp<CR>", opts) -- Nav up
keymap.set("n", "<C-Right>", ":TmuxNavigateRight<CR>", opts) -- Nav right

-- Windows managment
keymap.set("n", "<leader>sv", ":vsplit<CR>", opts) -- Nav vertically
keymap.set("n", "<leader>sh", ":split<CR>", opts) -- Nav horizontally
keymap.set("n", "<leader>se", "<C-w>=", opts) -- Nav equalizer
keymap.set("n", "<leader>sx", "<cmd>close<CR>", opts) -- Nav close
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", opts) -- Toggle minimize

-- Identing
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- Telescope
local builtin = require("telescope.builtin")
keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Telescope keymaps" })
keymap.set("n", "<leader>gb", ":Telescope git_branches<CR>", { desc = "Telescope [G]it [B]ranches" })
keymap.set("n", "<leader>grf", ":Telescope lsp_references<CR>", { desc = "Telescope LSP References" })

keymap.set("n", "<leader>nh", function()
    Snacks.notifier.show_history()
end, { desc = "Snacks [N]otification [H]istory" })

keymap.set("n", "<leader>od", function()
    vim.diagnostic.open_float()
end, { desc = "Open diagnostic" })

-- Gitsigns
keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", opts)
keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", opts)
