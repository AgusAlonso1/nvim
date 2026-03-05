return {
    "dmmulroy/tsc.nvim",
    lazy = true,
    ft = { "typescript", "typescriptreact" },
    opts = {
        auto_open_qflist = true,
        pretty_errors = false,
        flags = "-b --pretty false",
    }
}
