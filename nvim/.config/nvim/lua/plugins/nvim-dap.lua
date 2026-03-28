return {
  "mfussenegger/nvim-dap",
  dependencies = {
    { "jay-babu/mason-nvim-dap.nvim", event = "BufReadPre" },
  },
  opts = function()
    local dap = require("dap")
    dap.adapters.lldb = {
      type = "executable",
      name = "lldb",
      executable = {
        command = "zlldb-dap",
      },
    }
    dap.adapters.gdb = {
      type = "executable",
      command = "gdb",
      args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
    }
    dap.adapters.codelldb = {
      type = "server",
      port = "${port}",
      name = "lldb-dap",
      executable = {
        command = "zlldb-dap",
        args = { "--port", "${port}" },
      },
    }
    dap.configurations.zig = {
      {
        name = "Launch",
        type = "gdb",
        request = "launch",
        program = "${workspaceFolder}/zig-out/bin/${workspaceFolderBasename}",
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
      },
    }
  end,
}
