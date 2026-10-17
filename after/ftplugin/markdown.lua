-- Soft wrap like Obsidian: long lines wrap visually at window width
vim.opt_local.wrap = true
vim.opt_local.linebreak = true -- break between words
vim.opt_local.breakindent = true -- keep list/quote indent on wrapped lines

-- Move by visual lines; with a count (5j) move by real lines
local opts = { buffer = true, expr = true, silent = true }
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", opts)
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", opts)
