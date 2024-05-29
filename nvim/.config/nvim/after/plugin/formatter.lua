require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		yaml = { { "prettierd", "prettier" } },
		go = { { "gofmt" } },
	},

	format_on_save = {
		timeout_ms = 10000,
		lsp_fallback = true,
	},
})
