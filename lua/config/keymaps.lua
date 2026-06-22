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
-- local builtin = require("telescope.builtin")
-- keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
-- keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
-- keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
-- keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
-- keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Telescope keymaps" })
-- keymap.set("n", "<leader>gb", ":Telescope git_branches<CR>", { desc = "Telescope [G]it [B]ranches" })
local builtin = require("fzf-lua")
keymap.set("n", "<leader>ff", builtin.files, { desc = "Fzf find files" })
keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Fzf live grep" })
keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Fzf buffers" })
keymap.set("n", "<leader>fh", builtin.helptags, { desc = "Fzf help tags" })
keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Fzf keymaps" })
keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Fzf [G]it [B]ranches" })
keymap.set("n", "<leader>gs", builtin.git_status, { desc = "Fzf [G]it [S]taus" })

keymap.set("n", "<leader>nh", function()
    Snacks.notifier.show_history()
end, { desc = "Snacks [N]otification [H]istory" })

keymap.set("n", "<leader>od", function()
    vim.diagnostic.open_float()
end, { desc = "Open diagnostic" })

-- Gitsigns
keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", opts)
keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", opts)

-- move lines in visual mode
keymap.set("v", "<C-Down>", ":m '>+1<CR>gv=gv", { desc = "Moves lines down in visual selection" })
keymap.set("v", "<C-Up>", ":m '<-2<CR>gv=gv", { desc = "Moves lines up in visual selection" })

-- Esc via jj
vim.keymap.set("i", "jj", "<Esc>", { desc = "Exit insert mode with jj" })

-- Obsidian.nvim Keybindings
-- Daily Management
keymap.set("n", "<leader>on", "<cmd>Obsidian today<cr>", { desc = "Open Today's Note" })
keymap.set("n", "<leader>oy", "<cmd>Obsidian yesterday<cr>", { desc = "Open Yesterday's Note" })
keymap.set("n", "<leader>ot", "<cmd>Obsidian tomorrow<cr>", { desc = "Open Tomorrow's Note" })

-- Navigation & Search
keymap.set("n", "<leader>oo", "<cmd>Obsidian quick_switch<cr>", { desc = "Quick Switch Note" })
keymap.set("n", "<leader>os", "<cmd>Obsidian search<cr>", { desc = "Search Notes (grep)" })
keymap.set("n", "<leader>ob", "<cmd>Obsidian backlinks<cr>", { desc = "Show Backlinks" })
keymap.set("n", "<leader>ol", "<cmd>Obsidian links<cr>", { desc = "List All Links" })

-- Editing & Organization
keymap.set("n", "<leader>oc", "<cmd>Obsidian check<cr>", { desc = "Check Vault Integrity" })
keymap.set("n", "<leader>onw", "<cmd>Obsidian new<cr>", { desc = "Create New Note" })
keymap.set("n", "<leader>oti", "<cmd>Obsidian template<cr>", { desc = "Insert Template" })
keymap.set("n", "<leader>orn", "<cmd>Obsidian rename<cr>", { desc = "Rename Note & Update Links" })

-- Visual Mode (Link Creation)
keymap.set("v", "<leader>onl", ":Obsidian link_new<cr>", { desc = "Create Note from Selection" })
keymap.set("v", "<leader>olk", ":Obsidian link<cr>", { desc = "Link Selection to Existing Note" })
