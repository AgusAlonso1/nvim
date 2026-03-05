return {
    "kevinhwang91/nvim-ufo",
	event = "BufEnter",
	dependencies = { "kevinhwang91/promise-async" },
    opts = {
        provider_selector = function(_bufnr, filetype, _buftype)
            local lsp_filetypes = {
                typescript = true,
                typescriptreact = true,
                javascript = true,
                javascriptreact = true,
            }

        if lsp_filetypes[filetype] then
          return { "lsp", "treesitter" }
        end
        return { "treesitter", "indent" }
      end,
    },
}
