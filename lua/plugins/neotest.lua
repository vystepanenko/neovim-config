-- Run PHPUnit tests from nvim; tests execute inside the project's php-fpm
-- container via scripts/phpunit-docker (container + paths come from .env)
return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "olimorris/neotest-phpunit",
    },
    config = function()
        require("neotest").setup({
            adapters = {
                require("neotest-phpunit")({
                    phpunit_cmd = function()
                        return vim.fn.stdpath("config") .. "/scripts/phpunit-docker"
                    end,
                }),
            },
        })
    end,
    keys = {
        { "<leader>Tt", function() require("neotest").run.run() end, desc = "Test nearest" },
        { "<leader>Tf", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Test file" },
        { "<leader>Tl", function() require("neotest").run.run_last() end, desc = "Test last" },
        { "<leader>Ts", function() require("neotest").summary.toggle() end, desc = "Test summary" },
        { "<leader>To", function() require("neotest").output.open({ enter = true }) end, desc = "Test output" },
        { "<leader>Tp", function() require("neotest").output_panel.toggle() end, desc = "Test output panel" },
        { "<leader>Tx", function() require("neotest").run.stop() end, desc = "Test stop" },
    },
}
