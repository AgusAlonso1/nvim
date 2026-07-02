return {
    "saghen/blink.cmp",
    event = "VeryLazy",
    dependencies = {
        "rafamadriz/friendly-snippets",
        "L3MON4D3/LuaSnip",
    },
    version = "v1.*",
    opts = {
        ["<Tab>"] = {
            function(cmp)
                if cmp.snippet_active() then
                    return cmp.snippet_forward()
                end
                return cmp.select_next()
            end,
            "fallback",
        },
        ["<S-Tab>"] = {
            function(cmp)
                if cmp.snippet_active() then
                    return cmp.snippet_backward()
                end
                return cmp.select_prev()
            end,
            "fallback",
        },
    },
    appearance = {
        use_nvim_cmp_as_default = false,
        nerd_font_variant = "mono",
    },
    sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        providers = {
            lsp = {
                score_offset = 1000,
            },
            path = {
                score_offset = 3,
            },
            snippets = {
                score_offset = -100,
                max_items = 2,
                min_keyword_length = 3,
            },
            buffer = {
                score_offset = -150,
                min_keyword_length = 3,
            },
        },
    },
    snippets = {
        preset = "luasnip",
    },
    signature = {
        enabled = true,
        trigger = {
            show_on_trigger_character = false,
            show_on_insert_on_trigger_character = false,
        },
        window = {
            border = "rounded",
            show_documentation = true,
        },
    },
    completion = {
        trigger = {
            show_on_trigger_character = true,
        },
        menu = {
            border = "rounded",
            max_height = 10,
            draw = {
                columns = {
                    { "kind_icon" },
                    { "label", "label_description", gap = 1 },
                    { "source_name" },
                },
                components = {
                    source_name = {
                        text = function(ctx)
                            local source_names = {
                                lsp = "[LSP]",
                                buffer = "[Buffer]",
                                path = "[Path]",
                                snippets = "[Snippet]",
                            }
                            return (source_names[ctx.source_name] or "[") .. ctx.source_name .. "]"
                        end,
                        highlight = "CmpItemMenu",
                    },
                },
            },
            auto_show = true,
        },
        documentation = {
            auto_show = true,
            window = {
                border = "rounded",
            },
        },
        ghost_text = {
            enabled = true,
        },
        list = {
            selection = {
                preselect = true,
            },
        },
        accept = {
            auto_brackets = {
                enabled = true,
            },
        },
    },
}
