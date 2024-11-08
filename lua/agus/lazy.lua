-- Bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugins
require("lazy").setup({ 
    { import = "agus.plugins"},   
    { import = "agus.plugins.lsp" },
})

vim.keymap.set("n", "<leader>z", "<cmd>Lazy<CR>", { desc = "Lazy Interface" })
