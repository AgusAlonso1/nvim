vim.api.nvim_create_user_command("ConformDisable", function(args)
	if args.bang then
		vim.b.disable_autoformat = true
	else
		vim.g.disable_autoformat = true
	end
end, {
	desc = "Disable conform format-on-save",
	bang = true,
})

vim.api.nvim_create_user_command("ConformEnable", function()
	vim.b.disable_autoformat = false
	vim.g.disable_autoformat = false
end, {
	desc = "Re-enable conform format-on-save",
})

vim.g.disable_autoformat = true

return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		opts = {
			notify_on_error = false,
			default_format_opts = {
				async = true,
				timeout_ms = 500,
				lsp_format = "fallback",
			},
			format_after_save = function(buffer_number)
				if vim.g.disable_autoformat or vim.b[buffer_number].disable_autoformat then
					return
				end
				return {
					async = true,
					timeout_ms = 500,
					lsp_format = "fallback",
				}
			end,
			-- Try oxfmt first, fall back to prettier. Each only runs if the
			-- project has its config file (see the `condition`s below).
			formatters_by_ft = {
				javascript = { "oxfmt", "prettier", stop_after_first = true },
				javascriptreact = { "oxfmt", "prettier", stop_after_first = true },
				typescript = { "oxfmt", "prettier", stop_after_first = true },
				typescriptreact = { "oxfmt", "prettier", stop_after_first = true },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
			},
			formatters = {
				oxfmt = {
					condition = function(_, ctx)
						return vim.fs.find({ ".oxfmtrc.json", ".oxfmtrc.jsonc" }, {
							path = ctx.filename,
							upward = true,
							stop = vim.uv.os_homedir(),
						})[1] ~= nil
					end,
				},
				prettier = {
					condition = function(_, ctx)
						return vim.fs.find({
							".prettierrc",
							".prettierrc.json",
							".prettierrc.js",
							".prettierrc.cjs",
							".prettierrc.mjs",
							"prettier.config.js",
							"prettier.config.cjs",
							"prettier.config.mjs",
						}, {
							path = ctx.filename,
							upward = true,
							stop = vim.uv.os_homedir(),
						})[1] ~= nil
					end,
				},
			},
		},
	},
}
