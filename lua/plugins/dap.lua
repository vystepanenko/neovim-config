return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "rcarriga/nvim-dap-ui",
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        vim.fn.sign_define("DapBreakpoint", { text = "📌", texthl = "", linehl = "", numhl = "" })
        vim.fn.sign_define("DapStopped", { text = "➡️", texthl = "", linehl = "", numhl = "" })

        require("dapui").setup({
            layouts = {
                {
                    elements = {
                        "scopes",
                        -- 'breakpoints',
                        "stacks",
                        -- 'watches',
                    },
                    size = 40,
                    position = "left",
                },
            },
        })

        dap.adapters.php = {
            type = "executable",
            command = "node",
            args = { "/home/cannibal/.config/vscode-php-debug/out/phpDebug.js" },
        }

        dap.configurations.php = {
            {
                name = "listen for Xdebug docker EDU",
                type = "php",
                request = "launch",
                port = 9003,
                hostname = "0.0.0.0",
                -- this is where your file is in the container
                pathMappings = {
                    ["/var/www/app/"] = "${workspaceFolder}",
                },
            },
            {
                name = "listen for Xdebug docker CRM",
                type = "php",
                request = "launch",
                port = 9004,
                hostname = "0.0.0.0",
                -- this is where your file is in the container
                pathMappings = {
                    ["/var/www/app/"] = "${workspaceFolder}",
                },
            },
            {
                name = "listen for Xdebug docker FM",
                type = "php",
                request = "launch",
                port = 9005,
                hostname = "0.0.0.0",
                -- this is where your file is in the container
                pathMappings = {
                    ["/var/www/app/"] = "${workspaceFolder}",
                },
            },
        }

        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end
        vim.keymap.set("n", "<Leader>dt", function()
            dap.toggle_breakpoint()
        end)
        vim.keymap.set("n", "<Leader>dc", function()
            dap.continue()
        end)
        vim.keymap.set("n", "<Leader>ds", function()
            dap.continue()
        end)
        vim.keymap.set("n", "<Leader>dn", function()
            dap.step_into()
        end)
        vim.keymap.set("n", "<Leader>dp", function()
            dap.step_over()
        end)
        vim.keymap.set("n", "<Leader>dd", function()
            dapui.toggle()
        end)
    end,
}
