return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons", },
    config = function()
        require("nvim-tree").setup({})

        local keymap = vim.keymap
        keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
        keymap.set("n", "<leader>ef", "<cmd>NvimTreeFocus<CR>", { desc = "Focus file explorer" })
        keymap.set("n", "<leader>ec", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" })
        keymap.set("n", "<leader>eq", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
        keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) 
    end,
}
