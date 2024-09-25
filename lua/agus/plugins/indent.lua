return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
        exclude = {
            filetypes = { "help", "dashboard", "lazy", "NvimTree", "Trouble", "TelescopePrompt", "Float" },
            buftypes = { "terminal", "nofile", "telescope" },
        },
        indent = {
            char = "│",
        },
        scope = {
            enabled = true,
            show_start = false,
        },
    }
}
