return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
        code = {
		    sign = false,
			width = "block",
			right_pad = 1,
		},
		heading = {
			sign = false,
			icons = {},
		},
    },
    ft = { "markdown", "norg", "rmd", "org" },
}
