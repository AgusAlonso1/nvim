return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function ()
        vim.cmd[[colorscheme tokyonight-storm]]

        local lualine = require("lualine")

        local tokyo_night_custom_theme = {
            normal = {
                a = { fg = '#212539', bg = '#7aa2f7', gui = 'bold' },
                b = { fg = '#6b8cd4', bg = '#3b4261' },
                c = { fg = '#a4abd0', bg = '#1f2335' },
            },
            insert = {
                a = { fg = '#212539', bg = '#98c668', gui = 'bold' },
                b = { fg = '#98c668', bg = '#3b4261' },
                c = { fg = '#a4abd0', bg = '#1f2335' },
            },
            visual = {
                a = { fg = '#212539', bg = '#ad0afd', gui = 'bold' },
                b = { fg = '#ad0afd', bg = '#3b4261' },
                c = { fg = '#a4abd0', bg = '#1f2335' },
            },
            command = {
                a = { fg = '#212539', bg = '#e07022', gui = 'bold' },
                b = { fg = '#e07022', bg = '#3b4261' },
                c = { fg = '#a4abd0', bg = '#1f2335' },
            },
            replace = {
                a = { fg = '#212539', bg = '#ed1c24', gui = 'bold' },
                b = { fg = '#ed1c24', bg = '#3b4261' },
                c = { fg = '#a4abd0', bg = '#1f2335' },
            },
        }

        local custom_config = {
            options = {
                theme = tokyo_night_custom_theme;
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

        lualine.setup(custom_config)
    end,
}
