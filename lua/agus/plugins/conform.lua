return {
    'stevearc/conform.nvim',
    event = "VeryLazy",
    opts = {
        formatters_by_ft = {
            css = { { "prettied", "prettier" } },
            html = { { "prettied", "prettier" } },
            javascript = { { "prettied", "prettier" } },
            javascriptreact = { { "prettied", "prettier" } },
            json = { { "prettied", "prettier" } },
            lua = { "stylua" },
            markdown = { { "prettied", "prettier" } },
            python = { "isort", "black" },
            sql = { "sql-formatter" },
            typescript = { { "prettied", "prettier" } },
            typescriptreact = { { "prettied", "prettier" } },
            yaml = { "prettier" },
        },
    },
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                css = { { "prettied", "prettier" } },
                html = { { "prettied", "prettier" } },
                javascript = { { "prettied", "prettier" } },
                javascriptreact = { { "prettied", "prettier" } },
                json = { { "prettied", "prettier" } },
                lua = { "stylua" },
                markdown = { { "prettied", "prettier" } },
                python = { "isort", "black" },
                sql = { "sql-formatter" },
                typescript = { { "prettied", "prettier" } },
                typescriptreact = { { "prettied", "prettier" } },
                yaml = { "prettier" },
            },
        })

        vim.keymap.set("n", "<leader>mf", function()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 500,
            })
        end, { desc = "Format File" })

        vim.keymap.set({ "v" }, "<leader>f", function()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 500,
            })
        end, { desc = "Format Selection" })
    end,
}
