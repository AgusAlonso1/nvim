return {
    "nvim-lualine/lualine.nvim",
    dependencies = { 'DaikyXendo/nvim-material-icon' },
    config = function()
        local lualine = require("lualine")

        local custom_horizon = require "lualine.themes.horizon"

        -- Normal Mode
        custom_horizon.normal.a.bg = '#ff5f1f'
        custom_horizon.normal.a.fg = '#ffffff'

        custom_horizon.normal.b.fg = '#ffffff'

        custom_horizon.normal.c.bg = '#021723'
        custom_horizon.normal.c.fg = '#ffffff'

        -- Insert Mode
        custom_horizon.insert.a.bg = '#1ad61a'
        custom_horizon.insert.a.fg = '#ffffff'

        custom_horizon.insert.b.fg = '#ffffff'

        custom_horizon.insert.c.bg = '#021723'
        custom_horizon.insert.c.fg = '#ffffff'

        -- Visual Mode
        custom_horizon.visual.a.bg = '#ad0afd'
        custom_horizon.visual.a.fg = '#ffffff'

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
        custom_horizon.replace.a.fg = '#ffffff'

        custom_horizon.replace.b.fg = '#ffffff'

        custom_horizon.replace.c.bg = '#021723'
        custom_horizon.replace.c.fg = '#ffffff'

        lualine.setup({
            options = {
                theme = custom_horizon,
            },
        })
    end,

}

