return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function ()
        local wk = require("which-key")

        wk.add({
            { "<leader>f", group = "Find" },
            { "<leader>e", group = "Explorer" },
            { "<leader>m", group = "Misc" },
            { "<leader>l", group = "LSP" },
            { "<leader>ls", group = "Show" },
            { "<leader>g", group = "Git" },
            { "<leader>t", group = "Tabs" },
            { "<leader>s", group = "Splits" },
            { "<leader>w", group = "Save Options" }
        })
    end
}
