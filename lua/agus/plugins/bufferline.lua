return {
    "akinsho/bufferline.nvim",
    dependencies = { 'DaikyXendo/nvim-material-icon' },
    version = "*",
    opts = {
        options = {
            mode = "buffers",
            separator_style = "slant",
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer ",
                    highlight = "Agus-Nvim-Tree-Tittle",
                    text_align = "center",
                    separator = true,
                }
            },
        },
    },
}
