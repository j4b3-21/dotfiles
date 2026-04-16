return {
	"stevearc/conform.nvim",

	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				c = { "clang_format" },
				cpp = { "clang_format" },
				python = { "ruff_format", "black" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				json = { "prettier" },
				sh = { "shfmt" },
			},

			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		})
	end,
}
