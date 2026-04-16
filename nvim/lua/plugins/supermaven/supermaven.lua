return {
	"supermaven-inc/supermaven-nvim",
	config = function()
		require("supermaven-nvim").setup({
			keymaps = {
				accept_suggestion = "<Tab>",
				clear_suggestion = "<C-]>",
				accept_word = "<C-j>",
			},
			ignore_filetypes = {
				markdown = true,
				text = true,
				gitcommit = true,
			},
		})

		-- Supermaven API
		local supermaven = require("supermaven-nvim.api")

		-- Useful Shortcuts
		vim.keymap.set("n", "<leader>sm", supermaven.toggle, { desc = "Toggle Supermaven" })
		vim.keymap.set("n", "<leader>ms", supermaven.start, { desc = "Start Supermaven" })
		vim.keymap.set("n", "<leader>sx", supermaven.stop, { desc = "Stop Supermaven" })
		vim.keymap.set("n", "<leader>sr", supermaven.restart, { desc = "Restart Supermaven" })

		vim.keymap.set("n", "<leader>st", function()
			print("Supermaven running: " .. tostring(supermaven.is_running()))
		end, { desc = "Supermaven Status" })
	end,
}
