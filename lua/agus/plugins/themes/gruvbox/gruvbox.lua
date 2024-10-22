return {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function ()
        vim.cmd[[colorscheme gruvbox]]

        local custom_config = {
                    options = {
                        theme = "auto";
                        section_separators = { left = '', right = ''},
                        component_separators = { left = '|', right = '|'},
                    },
                    sections = {
                        lualine_a = { 'mode' },
                        lualine_b = { 'branch' },
                        lualine_c = { 'diagnostics', 'filename' },
                        lualine_x = { 'diff', 'encoding', 'fileformat', 'filetype' },
                        lualine_y = { 'progress' },
                        lualine_z = { 'location' }
                    },
        }

        require("lualine").setup(custom_config)
    end,
    opts = {
        undercurl = false,
        underline = false,
        italic = {
            strings = false,
            emphasis = false,
            comments = false,
            operators = false,
            folds = false,
        },
    },
}
