-- Импортируем dap
local dap = require "dap"

dap.adapters.python = {
    type = "executable",
    command = "python",
    args = { "-m", "debugpy.adapter" },
}
-- Настройка конфигурации для Python
dap.configurations.python = {
    {
        type = "python",
        request = "launch",
        name = "Launch Program",
        program = "${file}",
    },
}

require("dapui").setup()
require("nvim-dap-virtual-text").setup()
