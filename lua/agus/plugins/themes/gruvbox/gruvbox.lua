return {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function ()
        vim.cmd[[colorscheme gruvbox]]

        local gruvbox_custom_theme = {
            normal = {
                a = { fg = '#3c3836', bg = '#458588', gui = 'bold' },
                b = { fg = '#ebdbb2', bg = '#504945' },
                c = { fg = '#ebdbb2', bg = '#3c3836' },
            },
            insert = {
                a = { fg = '#3c3836', bg = '#8ec07c', gui = 'bold' },
                b = { fg = '#ebdbb2', bg = '#504945' },
                c = { fg = '#ebdbb2', bg = '#3c3836' },
            },
            visual = {
                a = { fg = '#3c3836', bg = '#de8629', gui = 'bold' },
                b = { fg = '#ebdbb2', bg = '#504945' },
                c = { fg = '#ebdbb2', bg = '#3c3836' },
            },
            command = {
                a = { fg = '#3c3836', bg = '#4bc073 ', gui = 'bold' },
                b = { fg = '#ebdbb2', bg = '#504945' },
                c = { fg = '#ebdbb2', bg = '#3c3836' },
            },
            replace = {
                a = { fg = '#3c3836', bg = '#cc241d', gui = 'bold' },
                b = { fg = '#ebdbb2', bg = '#504945' },
                c = { fg = '#ebdbb2', bg = '#3c3836' },
            },
        }

        local custom_config = {
                    options = {
                        theme = gruvbox_custom_theme;
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
