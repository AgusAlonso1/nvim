return {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
        local telescope = require("telescope")
        local telescope_actions = require("telescope.actions")

        telescope.setup({
            defaults = {
                path_display = { "smart" },
                mappings = {
                    i = {
                        ["<C-k>"] = telescope_actions.move_selection_previous,
                        ["<C-j>"] = telescope_actions.move_selection_next,
                    },
                },
            },
        })


        local keymap = vim.keymap

        keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
        keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Find recent files" })
        keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string" })
        keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor" })

    end,
}
