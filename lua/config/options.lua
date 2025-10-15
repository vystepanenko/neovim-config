local opt = vim.opt

-- Tab / Identation
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

-- Search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true

-- Appearance
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.colorcolumn = "100"
opt.signcolumn = "yes"
opt.cmdheight = 1
opt.scrolloff = 10
opt.completeopt = "menuone,noinsert,noselect"
opt.showmode = false

-- Behaviour
opt.hidden = true
opt.errorbells = false
opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.expand("~/.vim/undodir")
opt.undofile = true
opt.backspace = "indent,eol,start"
opt.splitright = true
opt.splitbelow = true
opt.autochdir = false
opt.iskeyword:append("-")
opt.mouse:append("a")
vim.schedule(function()
    opt.clipboard:append("unnamedplus")
end)
opt.modifiable = true
opt.encoding = "UTF-8"

-- for obsidian
vim.opt.conceallevel = 1

-- spelling
vim.opt.spelllang = "en_us"
vim.opt.spell = true
vim.opt.spelloptions = "camel"

local colors = {
    bad = "#DC2626",
    rare = "#F59E0B",
    regional = "#3B82F6",
    cap = "#6D28D9",
}

vim.api.nvim_set_hl(0, "SpellBad", { undercurl = true, sp = colors.bad })
vim.api.nvim_set_hl(0, "SpellRare", { undercurl = true, sp = colors.rare })
vim.api.nvim_set_hl(0, "SpellLocal", { undercurl = true, sp = colors.regional })
vim.api.nvim_set_hl(0, "SpellCap", { undercurl = true, sp = colors.cap })
