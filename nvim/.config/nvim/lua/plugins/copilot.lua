return {
  "zbirenbaum/copilot.lua",
  cond = function()
    local allowed_dir = vim.fn.expand("~/code/experiment/zig")
    local current_dir = vim.fn.getcwd()
    return vim.startswith(current_dir, allowed_dir)
  end,
  opts = {
    filetypes = {
      javascript = true,
      python = true,
      zig = true,
      go = true,
      rust = true,
      cpp = true,
      ["*"] = false,
    },
  },
}
