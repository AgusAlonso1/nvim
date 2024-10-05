return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        local mason = require("mason")

        local mason_lspconfig = require("mason-lspconfig")

        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })

        mason_lspconfig.setup({
            ensure_installed = {
                "lua_ls",
                "pyright",
                "jdtls",
                "clangd",
                "vtsls",
                "gopls",
                "prismals",
                "cssls",
                "rust_analyzer",
                --"asm_lsp",
                "bashls",
                "dockerls",
                "html",
                "tailwindcss",
                "lemminx",
                "vimls",
            },
            automatic_installation = true,
        })
    end,
}
