vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH
require("core.options")
require("core.keymaps")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require("lazy").setup({
	require("plugins.neotree.neotree"),
	require("plugins.theme.catppuccin"),
	require("plugins.bufferline.bufferline"),
	require("plugins.statusline.lualine"),
	require("plugins.treesitter.treesitter"),
	require("plugins.telescope.telescope"),
	require("plugins.lsp.lsp"),
	require("plugins.autocompletion.autocompletion"),
	require("plugins.gitsigns.gitsigns"),
	require("plugins.alpha.alpha"),
	require("plugins.indent.indent"),
	require("plugins.misc.misc"),
	require("plugins.comment.comment"),
	require("plugins.VimBeGood.VimBeGood"),
	require("plugins.flash.flash"),
	require("plugins.fugitive.fugitive"),
	require("plugins.tabout.tabout"),
	require("plugins.undotree.undotree"),
	require("plugins.harpoon.harpoon"),
	require("plugins.nvim-cmp.nvim-cmp"),
	require("plugins.conform.conform"),
	require("plugins.linting.linting"),
	require("plugins.supermaven.supermaven"),
})
