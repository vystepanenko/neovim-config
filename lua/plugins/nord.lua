return {
    "gbprod/nord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("nord").setup({
            transparent = true,
        })
        vim.g.nord_italic = false
        vim.g.nord_disable_background = false
        vim.cmd.colorscheme("nord")
    end,
}
