local on_attach = require("util.lsp").on_attach
local diagnostic_signs = require("util.lsp").diagnostic_signs

local config = function()
    require("neoconf").setup({})

    -- local capabilities = require("cmp_nvim_lsp").default_capabilities()
    --
    local lspconfig = require("lspconfig")
    local capabilities = require('blink.cmp').get_lsp_capabilities()
    for type, icon in pairs(diagnostic_signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- lua
    lspconfig.lua_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = { -- custom settings for lua
            Lua = {
                log_level = "info",
                -- make the language server recognize "vim" global
                diagnostics = {
                    globals = { "vim" },
                    disable = { "missing-fields" },
                },
                workspace = {
                    -- make language server aware of runtime files
                    library = {
                        -- [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                        -- [vim.fn.stdpath("config") .. "/lua"] = true,
                        vim.fn.expand("$VIMRUNTIME/lua"),
                        vim.fn.expand("$XDG_CONFIG_HOME") .. "/nvim/lua",
                    },
                },
            },
        },
    })

    --python
    lspconfig.pyright.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
            pyright = {
                disableOrganizeImports = false,
                analysis = {
                    useLibraryCodeForTypes = true,
                    autoSearchPaths = true,
                    diagnosticMode = "workspace",
                    autoImportCompletions = true,
                },
            },
        },
    })

    -- php
    lspconfig.intelephense.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        initializationOptions = {
            globalStoragePath = '/home/cannibal/intelephense'
        }
    })

    -- golang
    lspconfig.gopls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        cmd = { "gopls" },
        root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
        settings = {
            gopls = {
                analyses = {
                    unusedparams = true,
                },
                completeUnimported = true,
                usePlaceholders = true,
            },
        },
    })
end

return {
    "neovim/nvim-lspconfig",
    config = config,
    lazy = false,
    dependencies = {
        "windwp/nvim-autopairs",
        "williamboman/mason.nvim",
    },
}
