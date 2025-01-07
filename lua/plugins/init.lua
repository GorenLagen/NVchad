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
    {
        "brenton-leighton/multiple-cursors.nvim",
        opts = {}, -- This causes the plugin setup function to be called
        keys = {
            { "<C-j>",         "<Cmd>MultipleCursorsAddDown<CR>",          mode = { "n", 'i', "x" }, desc = "Add cursor and move down" },
            { "<C-k>",         "<Cmd>MultipleCursorsAddUp<CR>",            mode = { "n", 'i', "x" }, desc = "Add cursor and move up" },

            { "<C-Up>",        "<Cmd>MultipleCursorsAddUp<CR>",            mode = { "n", "i", "x" }, desc = "Add cursor and move up" },
            { "<C-Down>",      "<Cmd>MultipleCursorsAddDown<CR>",          mode = { "n", "i", "x" }, desc = "Add cursor and move down" },

            { "<C-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>",   mode = { "n", "i" },      desc = "Add or remove cursor" },

            { "<Leader>a",     "<Cmd>MultipleCursorsAddMatches<CR>",       mode = { "n", "x" },      desc = "Add cursors to cword" },
            { "<Leader>A",     "<Cmd>MultipleCursorsAddMatchesV<CR>",      mode = { "n", "x" },      desc = "Add cursors to cword in previous area" },

            { "<Leader>d",     "<Cmd>MultipleCursorsAddJumpNextMatch<CR>", mode = { "n", "x" },      desc = "Add cursor and jump to next cword" },
            { "<Leader>D",     "<Cmd>MultipleCursorsJumpNextMatch<CR>",    mode = { "n", "x" },      desc = "Jump to next cword" },

            { "<Leader>l",     "<Cmd>MultipleCursorsLock<CR>",             mode = { "n", "x" },      desc = "Lock virtual cursors" },
        },
    },

    {

        "folke/todo-comments.nvim",
        event = 'BufRead',
        dependencies = { "nvim-lua/plenary.nvim" },
        opt = {
            signs = true,      -- show icons in the signs column
            sign_priority = 8, -- sign priority
            -- keywords recognized as todo comments
            keywords = {
                fix = {
                    icon = " ", -- icon used for the sign, and in search results
                    color = "error", -- can be a hex color, or a named color (see below)
                    alt = { "fixme", "bug", "fixit", "issue" }, -- a set of other keywords that all map to this fix keywords
                    -- signs = false, -- configure signs for some keywords individually
                },
                todo = { icon = " ", color = "info" },
                hack = { icon = " ", color = "warning" },
                warn = { icon = " ", color = "warning", alt = { "warning", "xxx" } },
                perf = { icon = " ", alt = { "optim", "performance", "optimize" } },
                note = { icon = " ", color = "hint", alt = { "info" } },
                test = { icon = "⏲ ", color = "test", alt = { "testing", "passed", "failed" } },
            },
            gui_style = {
                fg = "none",       -- the gui style to use for the fg highlight group.
                bg = "bold",       -- the gui style to use for the bg highlight group.
            },
            merge_keywords = true, -- when true, custom keywords will be merged with the defaults
            -- highlighting of the line containing the todo comment
            -- * before: highlights before the keyword (typically comment characters)
            -- * keyword: highlights of the keyword
            -- * after: highlights after the keyword (todo text)
            highlight = {
                multiline = true,                -- enable multine todo comments
                multiline_pattern = "^.",        -- lua pattern to match the next multiline from the start of the matched keyword
                multiline_context = 10,          -- extra lines that will be re-evaluated when changing a line
                before = "",                     -- "fg" or "bg" or empty
                keyword = "wide",                -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
                after = "fg",                    -- "fg" or "bg" or empty
                pattern = [[.*<(keywords)\s*:]], -- pattern or table of patterns, used for highlighting (vim regex)
                comments_only = true,            -- uses treesitter to match keywords in comments only
                max_line_len = 400,              -- ignore lines longer than this
                exclude = {},                    -- list of file types to exclude highlighting
            },
            -- list of named colors where we try to extract the guifg from the
            -- list of highlight groups or use the hex color if hl not found as a fallback
            colors = {
                error = { "diagnosticerror", "errormsg", "#dc2626" },
                warning = { "diagnosticwarn", "warningmsg", "#fbbf24" },
                info = { "diagnosticinfo", "#2563eb" },
                hint = { "diagnostichint", "#10b981" },
                default = { "identifier", "#7c3aed" },
                test = { "identifier", "#ff00ff" }
            },
            search = {
                command = "rg",
                args = {
                    "--color=never",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                },
                -- regex that will be used to match keywords.
                -- don't replace the (keywords) placeholder
                pattern = [[\b(keywords):]], -- ripgrep regex
                -- pattern = [[\b(keywords)\b]], -- match without the extra colon. you'll likely get false positives
            },
        }
    },

    {
        "mfussenegger/nvim-dap",
        keys = { { "<F9>" }, { "<F5>" } },
        -- ft = { 'python' },
        config = function()
            require "configs.dap"
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = "mfussenegger/nvim-dap",
        config = function()
            require "configs.dapui"
        end,
    },

    { "mfussenegger/nvim-dap-python",    keys = { { '<F9>' }, { '<F5>' } },     dependencies = "mfussenegger/nvim-dap" },
    { "theHamsta/nvim-dap-virtual-text", dependencies = "mfussenegger/nvim-dap" },
    { "nvim-neotest/nvim-nio",           dependencies = "mfussenegger/nvim-dap" },
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
        config = function()
            require "configs.leap"
        end,
    },
    {
        "rcarriga/nvim-notify",
        event = "BufRead",
        config = function()
            require("notify").setup {
                background_colour = "#1e1e1e", -- Цвет фона уведомлений
                fps = 30,
                timeout = 3000,                -- Время показа уведомлений (5 секунд)
                icons = {
                    DEBUG = "",
                    ERROR = "",
                    INFO = "",
                    TRACE = "✎",
                    WARN = "",
                },
                level = 2, -- Минимальный уровень для отображения сообщений
                render = "compact",
                minimum_width = 50,
                max_width = 30,
                max_height = 4,
                stages = "fade_in_slide_out", -- Анимация уведомлений
                top_down = false,
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
        -- lazy = false,
        cmd = "Leet",
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
    --
    --
}
