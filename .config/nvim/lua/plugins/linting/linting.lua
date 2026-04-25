return {
	"mfussenegger/nvim-lint",

	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			c = { "cpplint" },
			cpp = { "cpplint" },
			python = { "ruff" },
			sh = { "shellcheck" },
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			json = { "jsonlint" },
		}

		vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
	vim.diagnostic.config({
		virtual_text = {
			prefix = "●",
			spacing = 2,
		},
		signs = true,
		underline = true,
		update_in_insert = false,
		severity_sort = true,
	}),
}
