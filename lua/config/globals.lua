vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.clipboard = {
    name = "WslClipboard",
    copy = {
        ["+"] = "clip.exe",
        ["*"] = "clip.exe",
    },
    paste = {
        ["+"] =
        'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        ["*"] =
        'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = 0,
}

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking(copying) text",
    group = vim.api.nvim_create_augroup("higlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.g.python3_host_prog = vim.fn.expand("~/.venvs/nvim/bin/python")
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
