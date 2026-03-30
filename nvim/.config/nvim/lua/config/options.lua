-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--

-- Set all indentation sizes to 2 (example)
vim.opt.tabstop = 4 -- how many spaces a <Tab> is
vim.opt.shiftwidth = 4 -- indentation level for >> << and auto indent
vim.opt.softtabstop = 4 -- how many spaces <Tab> feels like in insert mode
vim.opt.expandtab = true -- convert tabs to spaces
vim.g.autoformat_disabled_filetypes = { "sh" }

vim.opt.title = true
vim.opt.titlestring = "nvim"
vim.opt.titleold = "shell"
vim.opt.clipboard = "unnamedplus"

-- Use built-in OSC52 support (Neovim 0.10+)
vim.g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
    ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
  },
  paste = {
    ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
    ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
  },
}
