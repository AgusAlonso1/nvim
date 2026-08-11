return {
    {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "LspInfo", "LspInstall", "LspUninstall", "Mason" },
        dependencies = {
            { "williamboman/mason.nvim", config = true },
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            { "j-hui/fidget.nvim",       opts = {} },
        },
        config = function()
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            local has_blink, blink = pcall(require, "blink.cmp")
            if has_blink then
                capabilities = vim.tbl_deep_extend("force", capabilities, blink.get_lsp_capabilities())
            end

            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
                callback = function(event)
                    local bufnr = event.buf
                    local function map(keys, fn, desc)
                        vim.keymap.set("n", keys, fn, { buffer = bufnr, desc = "LSP: " .. desc })
                    end

                    map("gd", vim.lsp.buf.definition, "Goto Definition")
                    map("gD", vim.lsp.buf.declaration, "Goto Declaration")
                    map("gi", vim.lsp.buf.implementation, "Goto Implementation")
                    map("gr", vim.lsp.buf.references, "References")
                    map("K", vim.lsp.buf.hover, "Hover Documentation")
                    map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
                    map("<leader>rn", vim.lsp.buf.rename, "Rename")
                    map("[d", function() vim.diagnostic.jump({ count = -1, float = true }) end, "Prev Diagnostic")
                    map("]d", function() vim.diagnostic.jump({ count = 1, float = true }) end, "Next Diagnostic")
                end,
            })

            local servers = {
                bashls = {},
                cssls = {},
                pyright = {},
                gopls = {},
                html = {},
                jsonls = {},
                lua_ls = {
                    settings = {
                        Lua = {
                            runtime = { version = "LuaJIT" },
                            diagnostics = { globals = { "vim" } },
                            telemetry = { enabled = false },
                        },
                    },
                },
                marksman = {},
                rust_analyzer = {},
                svelte = {},
                eslint = {
                    cmd = { "vscode-eslint-language-server", "--stdio", "--max-old-space-size=12288" },
                    settings = { format = false },
                },
                oxlint = {
                    root_markers = { ".oxlintrc.json" },
                },
                tailwindcss = {
                    filetypes = { "typescriptreact", "javascriptreact", "html", "svelte", "astro" },
                },
                yamlls = {},
                jdtls = {},
            }

            require("mason").setup()

            require("mason-lspconfig").setup({
                ensure_installed = vim.tbl_keys(servers),
                automatic_enable = {
                    exclude = { "ts_ls" },
                },
            })

            require("mason-tool-installer").setup({
                ensure_installed = vim.tbl_keys(servers),
            })

            for name, config in pairs(servers) do
                vim.lsp.config(name, {
                    cmd = config.cmd,
                    capabilities = capabilities,
                    filetypes = config.filetypes,
                    settings = config.settings,
                    root_dir = config.root_dir,
                    root_markers = config.root_markers,
                })

                if config.autostart ~= false then
                    vim.lsp.enable(name)
                end
            end
        end,
    }
}
