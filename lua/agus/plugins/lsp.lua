return {
    {
        "folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
    },
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "LspInfo", "LspInstall", "LspUninstall", "Mason" },
        dependencies = {
            { "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local capabilities = vim.lsp.protocol.make_client_capabilities()

            local servers = {
                bashls = {},
                cssls = {},
                pyright = {},
                gopls = {},
                html = {},
                jsonls = {},
                lua_ls = {
                    settings = {
                        Lua = {
                            runtime = { version = "LuaJIT" },
                            diagnostics = { globals = { "vim" } },
                            telemetry = { enabled = false },
                        },
                    },
                },
                marksman = {},
                rust_analyzer = {},
                svelte = {},
                ts_ls = {},
                yamlls = {},
                jdtls = {},
            }

            require("mason").setup()

            require("mason-lspconfig").setup({
                ensure_installed = vim.tbl_keys(servers),
            })

            require("mason-tool-installer").setup({
                ensure_installed = vim.tbl_keys(servers),
            })

            for name, config in pairs(servers) do
                vim.lsp.config(name, {
                    cmd = config.cmd,
                    capabilities = capabilities,
                    filetypes = config.filetypes,
                    settings = config.settings,
                    root_dir = config.root_dir,
                    root_markers = config.root_markers,
                })

                if config.autostart == true then
                    vim.lsp.enable(name)
                end
            end
        end,
    }
}
