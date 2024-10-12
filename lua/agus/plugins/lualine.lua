return {
    "nvim-lualine/lualine.nvim",
    dependencies = { 'DaikyXendo/nvim-material-icon' },
    config = function()
        local lualine = require("lualine")

        local custom_horizon = require "lualine.themes.horizon"

        local custom_theme = {
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
                theme = custom_theme;
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

        -- Normal Mode
        custom_horizon.normal.a.bg = '#dbfb0c'
        custom_horizon.normal.a.fg = '#181922'

        custom_horizon.normal.b.fg = '#ffffff'

        custom_horizon.normal.c.bg = '#021723'
        custom_horizon.normal.c.fg = '#ffffff'

        -- Insert Mode
        custom_horizon.insert.a.bg = '#02daf9'
        custom_horizon.insert.a.fg = '#181922'

        custom_horizon.insert.b.fg = '#ffffff'

        custom_horizon.insert.c.bg = '#021723'
        custom_horizon.insert.c.fg = '#ffffff'

        -- Visual Mode
        custom_horizon.visual.a.bg = '#ad0afd'
        custom_horizon.visual.a.fg = '#181922'

        custom_horizon.visual.b.fg = '#ffffff'

        custom_horizon.visual.c.bg = '#021723'
        custom_horizon.visual.c.fg = '#ffffff'

        -- Command Mode
        custom_horizon.command.a.bg = '#02a2da'
        custom_horizon.command.a.fg = '#ffffff'

        custom_horizon.command.b.fg = '#ffffff'

        custom_horizon.command.c.bg = '#021723'
        custom_horizon.command.c.fg = '#ffffff'

        -- Replace mode
        custom_horizon.replace.a.bg = '#ff0000'
        custom_horizon.replace.a.fg = '#181922'

        custom_horizon.replace.b.fg = '#ffffff'

        custom_horizon.replace.c.bg = '#021723'
        custom_horizon.replace.c.fg = '#ffffff'

        lualine.setup(custom_config)
    end,

}

