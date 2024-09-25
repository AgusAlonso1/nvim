return {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        -- Header

        local header = {
            "",
            "  █████╗  ██████╗ ██╗   ██╗███████╗      ███╗   ██╗██╗   ██╗██╗███╗   ███╗",
            " ██╔══██╗██╔════╝ ██║   ██║██╔════╝      ████╗  ██║██║   ██║██║████╗ ████║",
            " ███████║██║  ███╗██║   ██║███████╗█████╗██╔██╗ ██║██║   ██║██║██╔████╔██║",
            " ██╔══██║██║   ██║██║   ██║╚════██║╚════╝██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║",
            " ██║  ██║╚██████╔╝╚██████╔╝███████║      ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║",
            " ╚═╝  ╚═╝ ╚═════╝  ╚═════╝ ╚══════╝      ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
            "",
        }

        dashboard.section.header.type = "text"
        dashboard.section.header.val = header
        dashboard.section.header.opts = {
            position = "center",
            hl = "Agus-Nvim-Header",
        }

        -- Sub-Header

        local today = os.date "%d/%m/%Y"
        local sh_top_section = {
            type = "text",
            val = "<---------------<   Today is: ".. today .." >--------------->",
            opts = {
                position = "center",
                hl = "Agus-Nvim-HeaderInfo",
            },
        }

        local datetime = os.date " %H:%M"
        local sh_bot_section = {
            type = "text",
            val = "<------< ".. datetime .." >------>",
            opts = {
                position = "center",
                hl = "Agus-Nvim-HeaderInfo",
            },
        }

        -- Buttons

        dashboard.section.buttons.val = {
            dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
            dashboard.button("SPC ee", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
            dashboard.button("SPC ff", "󰱼  > Find File", "<cmd>Telescope find_files<CR>"),
            dashboard.button("SPC fs", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
            dashboard.button("q", "  > Quit NVIM", "<cmd>qa<CR>"),
        }

        -- Footer

        dashboard.section.footer.type = "text"
        dashboard.section.footer.val = "  -> AgusAlonso1 |   -> River Plate"
        dashboard.section.footer.opts = {
            position = "center",
            hl = "Agus-Nvim-Footer"
        }

        local section = {
            header = dashboard.section.header,
            sh_top_section = sh_top_section,
            sh_bot_section = sh_bot_section,
            buttons = dashboard.section.buttons,
            footer = dashboard.section.footer,
        }

        dashboard.opts = {
            layout = {
                { type = "padding", val = 3 },
                section.header,
                { type = "padding", val = 2 },
                section.sh_top_section,
                section.sh_bot_section,
                { type = "padding", val = 2 },
                section.buttons,
                { type = "padding", val = 3 },
                section.footer,
            },
            opts = {
                margin = 5
            },
        }


        alpha.setup(dashboard.opts)

        -- Disable folding on alpha buffer
        vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
    end,
}
