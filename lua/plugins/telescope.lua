local mapkey = require("util.keymapper").mapkey

-- theme for telescope
local config = function()
    local telescope = require("telescope")
    telescope.setup({
        extensions = {
            fzf = {
                fuzzy = true,
                -- 		override_generic_sorter = false,
                -- 		override_file_sorter = false,
            },
        },
        defaults = {
            path_display = { "smart" },
            -- path_display = { "filename_first" },
            mappings = {
                i = {
                    ["<C-j>"] = "move_selection_next",
                    ["<C-k>"] = "move_selection_previous",
                },
            },
        },
        pickers = {
            find_files = {
                theme = "ivy",
                previewer = true,
                hidden = false,
            },
            -- live_grep = {
            -- 	theme = "cursor",
            -- 	previewer = true,
            -- },
            -- buffers = {
            -- 	theme = "dropdown",
            -- 	previewer = false,
            -- },
        },
    })

    telescope.load_extension("fzf")
end

return {
    {
        "nvim-telescope/telescope.nvim",
        -- tag = "*",
        lazy = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
            },
        },
        config = config,
        keys = {
            mapkey("<leader>fk", "Telescope keymaps", "n"),
            mapkey("<leader>fh", "Telescope help_tags", "n"),
            mapkey("<leader>ff", "Telescope find_files", "n"),
            mapkey("<leader>fg", "Telescope live_grep", "n"),
            mapkey("<leader>fb", "Telescope buffers", "n"),
        },
    },
}
