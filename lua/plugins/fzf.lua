return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    -- dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    dependencies = { "echasnovski/mini.icons" },
    opts = {
        fzf_colors = true,
    },
    config = function(_, opts)
        local fzf = require("fzf-lua")
        fzf.setup(opts)
        fzf.register_ui_select() -- vim.ui.select menus via fzf-lua
    end,
}
