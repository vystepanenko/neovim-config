-- HTTP requests from .hurl files (hurl CLI lives in ~/.local/bin)
return {
    "jellydn/hurl.nvim",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    ft = "hurl",
    opts = {
        mode = "split", -- response in a split; toggle to popup with <leader>hm
        show_notification = false,
        formatters = {
            json = { "jq" },
        },
    },
    keys = {
        { "<leader>hr", "<cmd>HurlRunnerAt<CR>", desc = "Hurl run request at cursor", ft = "hurl" },
        { "<leader>ha", "<cmd>HurlRunner<CR>", desc = "Hurl run all requests", ft = "hurl" },
        { "<leader>he", "<cmd>HurlRunnerToEntry<CR>", desc = "Hurl run up to entry", ft = "hurl" },
        { "<leader>hv", "<cmd>HurlVerbose<CR>", desc = "Hurl run verbose", ft = "hurl" },
        { "<leader>hm", "<cmd>HurlToggleMode<CR>", desc = "Hurl toggle split/popup", ft = "hurl" },
        { "<leader>hr", ":HurlRunner<CR>", desc = "Hurl run selection", mode = "v", ft = "hurl" },
    },
}
