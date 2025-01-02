return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  { "mfussenegger/nvim-dap", event = "BufRead" },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    event = "BufRead",
    config = function()
      require "configs.dapui"
    end,
  },

  { "mfussenegger/nvim-dap-python", dependencies = "mfussenegger/nvim-dap", event = "BufRead" },
  { "theHamsta/nvim-dap-virtual-text", dependencies = "mfussenegger/nvim-dap", event = "BufRead" },
  { "nvim-neotest/nvim-nio", dependencies = "mfussenegger/nvim-dap", event = "BufRead" },
  --
  -- {
  --   "NeogitOrg/neogit",
  --   event = "BufRead",
  --   config = function()
  --     require "configs.neogit"
  --   end,
  -- },
  --
  {
    "ggandor/leap.nvim",
    event = "BufRead",
    -- dependencies = { 't' },
    config = function()
      require "configs.leap"
    end,
  },
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
      require("notify").setup {
        background_colour = "#1e1e1e", -- Цвет фона уведомлений
        timeout = 5000, -- Время показа уведомлений (5 секунд)
        icons = {
          DEBUG = "",
          ERROR = "",
          INFO = "",
          TRACE = "✎",
          WARN = "",
        },
        level = 3, -- Минимальный уровень для отображения сообщений
        minimum_width = 50,
        stages = "fade_in_slide_out", -- Анимация уведомлений
        top_down = true,
      }
    end,
    dependencies = {
      "MunifTanjim/nui.nvim", -- Обязательная зависимость для работы nvim-notify
      "rcarriga/nvim-notify", -- Плагин для уведомлений
    },
  },
  {
    "folke/noice.nvim",
    event = "BufRead",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require "configs.noice"
    end,
  },
  --
  --
  {
    "kawre/leetcode.nvim",
    lazy = false,
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require "configs.leetcode"
    end,
  },
  --
  { "MunifTanjim/nui.nvim" },
  --
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    lazy = false,
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
  },
  -- {
  --     "Wansmer/langmapper.nvim",
  --     event = 'BufRead ',
  --     config = function()
  --         require "configs.langmapper"
  --     end,
  -- },
  --
  -- {
  --   "3rd/image.nvim",
  --   config = function()
  --     require "config.image"
  --   end,
  -- },
  {
    "lervag/vimtex",
    ft = { "tex", "latex" }, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_syntax_enabled = 0
      vim.g.vimtex_view_method = "zathura"
    end,
  },
  -- {
  --   "benlubas/molten-nvim",
  --   lazy = false,
  --   version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
  --   build = ":UpdateRemotePlugins",
  --   config = function()
  --     require "configs.molten"
  --   end,
  -- },
  -- {
  --     "quarto-dev/quarto-nvim",
  --     dependencies = {
  --         "jmbuhr/otter.nvim",
  --         "Vigemus/iron.nvim",
  --         "nvim-treesitter/nvim-treesitter",
  --     },
  --     config = function()
  --         require "configs.quarto"
  --     end,
  -- },
  --
  -- {
  --   "Vigemus/iron.nvim",
  --   lazy = false,
  --   config = function()
  --     require "configs.iron"
  --   end,
  -- },
}
