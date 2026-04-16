return {
	"nvimtools/none-ls.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				-- C / C++
				null_ls.builtins.formatting.clang_format,
				null_ls.builtins.diagnostics.cpplint,

				-- Shell
				null_ls.builtins.diagnostics.shellcheck,

				-- Python
				null_ls.builtins.diagnostics.ruff,

				-- JS
				null_ls.builtins.diagnostics.eslint_d,

				-- JSON
				null_ls.builtins.diagnostics.jsonlint,
			},
		})
	end,
}
