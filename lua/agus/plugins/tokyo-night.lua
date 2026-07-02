return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
        require("agus.theme").set_theme("tokyonight")
    end,
}
