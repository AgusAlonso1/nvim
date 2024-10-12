return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
        local lspconfig = require("lspconfig")

        local mason_lspconfig = require("mason-lspconfig")

        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local keymap = vim.keymap

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                keymap.set("n", "<leader>lsR", "<cmd>Telescope lsp_references<CR>", { desc = "Show LSP References" })

                keymap.set("n", "<leader>lg", vim.lsp.buf.declaration, { desc = "Go to declaration" })

                keymap.set("n", "<leader>lsd", "<cmd>Telescope lsp_definitions<CR>", { desc = "Show LSP definitions" })

                keymap.set("n", "<leader>lsi", "<cmd>Telescope lsp_implementations<CR>", { desc = "Show LSP implementations" })

                keymap.set("n", "<leader>lst", "<cmd>Telescope lsp_type_definitions<CR>", { desc = "Show LSP type definitions" })

                keymap.set("n", "<leader>ln", vim.lsp.buf.rename, { desc = "Smart rename" })

                keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, { desc = "Code actions" })

                keymap.set("n", "<leader>lD", "<cmd>Telescope diagnostics bufnr=0<CR>", { desc = "Buffer diagnostics" })

                keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Line diagnostics" })

                keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })

                keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })

                keymap.set("n", "<leader>li", vim.lsp.buf.hover, { desc = "Info" })

                keymap.set("n", "<leader>lr", ":LspRestart<CR>", { desc = "Restart LSP" }) -- mapping to restart lsp if necessary
            end,
        })

        -- Used to enable autocompletion (assign to every lsp server config)
        local capabilities = cmp_nvim_lsp.default_capabilities()

        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end


        mason_lspconfig.setup_handlers({
            -- Default handler for installed servers
            function(server_name)
                lspconfig[server_name].setup({
                    capabilities = capabilities,
                })
            end,
            ["tsserver"] = function()
            end,
        })

        
        vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
            vim.lsp.diagnostic.on_publish_diagnostics, {
                -- delay update diagnostics
                update_in_insert = true,
            }
        )
    end,
}
