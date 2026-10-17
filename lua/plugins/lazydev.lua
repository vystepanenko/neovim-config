-- Neovim runtime + plugin types for lua_ls when editing this config
return {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
        library = {
            -- vim.uv types, loaded only when `vim.uv` is used
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            -- Snacks global
            { path = "snacks.nvim", words = { "Snacks" } },
        },
    },
}
