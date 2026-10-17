return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        require("nvim-treesitter-textobjects").setup({
            select = {
                lookahead = true,
                selection_modes = {
                    ["@parameter.outer"] = "v", -- charwise
                    ["@function.outer"] = "V", -- linewise
                    ["@class.outer"] = "<c-v>", -- blockwise
                },
                include_surrounding_whitespace = true,
            },
        })

        local select = require("nvim-treesitter-textobjects.select")
        local function sel(lhs, query, group, desc)
            vim.keymap.set({ "x", "o" }, lhs, function()
                select.select_textobject(query, group or "textobjects")
            end, { desc = desc })
        end
        sel("af", "@function.outer", nil, "Select outer function")
        sel("if", "@function.inner", nil, "Select inner function")
        sel("ac", "@class.outer", nil, "Select outer class")
        sel("ic", "@class.inner", nil, "Select inner part of a class region")
        sel("ao", "@comment.outer", nil, "Select comment")
        sel("as", "@local.scope", "locals", "Select language scope")

        local swap = require("nvim-treesitter-textobjects.swap")
        vim.keymap.set("n", "]a", function()
            swap.swap_next("@parameter.inner")
        end, { desc = "Swap with next parameter" })
        vim.keymap.set("n", "[a", function()
            swap.swap_previous("@parameter.inner")
        end, { desc = "Swap with previous parameter" })
    end,
}
