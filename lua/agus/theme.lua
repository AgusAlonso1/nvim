local M = {}

local colorschemes = {
    tokyonight = "tokyonight-storm",
    gruvbox = "gruvbox",
}

local function tokyo_lualine_theme()
    local custom_horizon = require("lualine.themes.horizon")

    custom_horizon.normal.a.bg = "#7aa2f7"
    custom_horizon.normal.a.fg = "#24283b"
    custom_horizon.normal.b.bg = "#3b4261"
    custom_horizon.normal.b.fg = "#7aa2f7"
    custom_horizon.normal.c.bg = "#021723"
    custom_horizon.normal.c.fg = "#ffffff"

    custom_horizon.insert.a.bg = "#1ad61a"
    custom_horizon.insert.a.fg = "#ffffff"
    custom_horizon.insert.b.fg = "#ffffff"
    custom_horizon.insert.c.bg = "#021723"
    custom_horizon.insert.c.fg = "#ffffff"

    custom_horizon.visual.a.bg = "#ad0afd"
    custom_horizon.visual.a.fg = "#ffffff"
    custom_horizon.visual.b.fg = "#ffffff"
    custom_horizon.visual.c.bg = "#021723"
    custom_horizon.visual.c.fg = "#ffffff"

    custom_horizon.command.a.bg = "#02a2da"
    custom_horizon.command.a.fg = "#ffffff"
    custom_horizon.command.b.fg = "#ffffff"
    custom_horizon.command.c.bg = "#021723"
    custom_horizon.command.c.fg = "#ffffff"

    custom_horizon.replace.a.bg = "#ff0000"
    custom_horizon.replace.a.fg = "#ffffff"
    custom_horizon.replace.b.fg = "#ffffff"
    custom_horizon.replace.c.bg = "#021723"
    custom_horizon.replace.c.fg = "#ffffff"

    return custom_horizon
end

local function lualine_theme_for(name)
    if name == "tokyonight" then
        return tokyo_lualine_theme()
    elseif name == "gruvbox" then
        return require("lualine.themes.gruvbox")
    end
end

function M.refresh_lualine()
    local theme_name = vim.g.agus_theme or "tokyonight"
    local lualine_theme = lualine_theme_for(theme_name)
    if not lualine_theme then
        return
    end

    local ok, lualine = pcall(require, "lualine")
    if not ok then
        return
    end

    lualine.setup({
        options = {
            theme = lualine_theme,
        },
    })
end

function M.set_theme(name)
    local colorscheme = colorschemes[name]
    if not colorscheme then
        vim.notify("Unknown theme: " .. name, vim.log.levels.ERROR)
        return
    end

    if name == "gruvbox" then
        require("lazy").load({ plugins = { "gruvbox.nvim" } })
        vim.o.background = "dark"
    end

    vim.g.agus_theme = name
    vim.cmd.colorscheme(colorscheme)
    M.refresh_lualine()
end

return M
