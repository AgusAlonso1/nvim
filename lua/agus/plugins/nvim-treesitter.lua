return {
    {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "windwp/nvim-ts-autotag",
    },
    config = function()
        local treesitter = require("nvim-treesitter.configs")

        treesitter.setup({
            highlight = { enable = true }, -- Enable sintax highlighting
            indent = { enable = true }, -- Enable indentation
            autotag = { enable = true },
            ensure_installed = {
                "lua",
                -- "asm",
                "bash",
                "gitattributes",
                "haskell",
                "html",
                "json",
                "prisma",
                "ruby",
                "rust",
                "sql",
                "typescript",
                "vim",
                "xml",
                "css",
                "gitignore",
                "python",
                "c",
                "java",
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                init_selection = "<C-space>",
                node_incremental = "<C-space>",
                scope_incremental = false,
                node_decremental = "<bs>",
                },
            },
        })
    end,
    },
}
