return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        vim.cmd[[colorscheme tokyonight-night]]
    end,
    opts = {
        vim.api.nvim_create_user_command("SetDarkTheme", function()
            vim.opt.background = "dark"
            vim.cmd[[colorscheme tokyonight-night]]
        end, { nargs = 0 }),
        vim.api.nvim_create_user_command("SetLightTheme", function()
            vim.opt.background = "light"
            vim.cmd[[colorscheme tokyonight-day]]
        end, { nargs = 0 } )
    },
}
