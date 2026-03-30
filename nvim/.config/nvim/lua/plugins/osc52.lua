return {
  {
    "ojroques/nvim-osc52",
    event = "VeryLazy",
    config = function()
      local osc52 = require("osc52")

      osc52.setup({
        max_length = 0,
        silent = false,
        trim = false,
      })

      -- Keymaps for manual OSC52 copy
      vim.keymap.set("n", "<leader>c", osc52.copy_operator, {
        expr = true,
        desc = "OSC52 Copy",
      })
      vim.keymap.set("v", "<leader>c", osc52.copy_visual, {
        desc = "OSC52 Copy",
      })

      -- Override Neovim clipboard provider for full bidirectional support
      local function copy(lines, _)
        osc52.copy(table.concat(lines, "\n"))
      end

      local function paste()
        -- OSC52 paste (Ghostty supports clipboard-read)
        local content = vim.fn.trim(vim.fn.system("printf '\\e]52;c;?\\a'"))
        return vim.split(content, "\n")
      end

      vim.g.clipboard = {
        name = "OSC52 + Ghostty",
        copy = {
          ["+"] = copy,
          ["*"] = copy,
        },
        paste = {
          ["+"] = paste,
          ["*"] = paste,
        },
      }
    end,
  },
}
