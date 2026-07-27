return {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,
    config = function()
        require("tiny-inline-diagnostic").setup({
            preset = "classic",
            options = {
                show_source = { enabled = false },
                use_icons_from_diagnostic = false,
                multilines = {
                    enabled = false,
                    always_show = false,
                },
                show_all_diags_on_cursorline = false,
            },
        })

        vim.diagnostic.config({ virtual_text = false })
    end,
}
