return {
    "obsidian-nvim/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = false,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --   -- refer to `:h file-pattern` for more examples
    --   "BufReadPre path/to/my-vault/*.md",
    --   "BufNewFile path/to/my-vault/*.md",
    -- },
    dependencies = {
        -- Required.
        "nvim-lua/plenary.nvim",
        "MeanderingProgrammer/render-markdown.nvim",

        -- see below for full list of optional dependencies 👇
    },
    opts = {
        legacy_commands = false,
        workspaces = {
            {
                name = "personal",
                path = "/mnt/c/Users/canni/Documents/obsidian/",
            },
        },
        completion = {
            -- Trigger completion at 2 chars.
            min_chars = 2,
        },
        ui = { enable = false },
        templates = {
            folder = "Templates",
            date_format = "%Y-%m-%d",
            time_format = "%H:%M",
            substitutions = {},
        },
        daily_notes = {
            folder = "04_Journal",
            date_format = "%Y-%m-%d",
            template = "daily_template.md",
        },

        -- see below for full list of options 👇
    },
}
