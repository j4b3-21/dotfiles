return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "auto", -- latte, frappe, macchiato, mocha
			background = {
				light = "latte",
				dark = "mocha",
			},
			transparent_background = true,
			show_end_of_buffer = false,
			term_colors = false,
			highlight_overrides = {

				all = function(colors)
					return {
						LineNr = { fg = colors.overlay1 }, -- darker than default
						CursorLineNr = { fg = colors.lavender, style = { "bold" } },
						LineNrAbove = { fg = colors.overlay1 },
						LineNrBelow = { fg = colors.overlay1 },
					}
				end,
			},

			dim_inactive = {
				enabled = false,
				shade = "dark",
				percentage = 0.15,
			},

			no_italic = false,
			no_bold = false,
			no_underline = false,

			styles = {
				comments = { "italic" },
				conditionals = { "italic" },
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
				operators = {},
			},

			lsp_styles = {
				virtual_text = {
					errors = { "italic" },
					hints = { "italic" },
					warnings = { "italic" },
					information = { "italic" },
				},
			},
		})

		-- IMPORTANT: apply colorscheme
		vim.cmd.colorscheme("catppuccin")
	end,
}
