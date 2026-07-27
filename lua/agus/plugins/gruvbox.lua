return {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        contrast = "hard",
    },
    config = function(_, opts)
        require("gruvbox").setup(opts)
        require("agus.theme").set_theme("gruvbox")
    end,
}
