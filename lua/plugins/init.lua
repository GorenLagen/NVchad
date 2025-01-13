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


    -- TODO: Сделать возможность создавание ячееееееек
    {
        "nvimtools/hydra.nvim",
        keys = { { '<Leader>oa' } },
        config = function()
            require "configs.hydra"
        end,

        dependencies = {
            "quarto-dev/quarto-nvim",
            "nvim-treesitter/nvim-treesitter-textobjects",
        }
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

    { "LunarVim/bigfile.nvim" },
    lazy = false,
    opts = {
        filesize = 2, -- MiB (2 MiB is just over 2MB)
        features = {
            "indent_blankline",
            "lsp",
            "treesitter",
            "syntax",
            "vimopts",
            "filetype",
        },
    },

    { "kylechui/nvim-surround", event = 'VeryLazy' },

    {

        -- TODO: сделат ьинд для посика tood с телескопа

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
        keys = { { '<Leader>du' } },
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

    { "mfussenegger/nvim-dap-python",    dependencies = "mfussenegger/nvim-dap" },
    { "theHamsta/nvim-dap-virtual-text", dependencies = "mfussenegger/nvim-dap" },
    { "nvim-neotest/nvim-nio",           dependencies = "mfussenegger/nvim-dap" },

    {
        "ggandor/leap.nvim",
        keys = { { 's' }, { 'S' }, { 'ы' }, { 'Ы' } },
        config = function()
            require "configs.leap"
        end,
    },
    -- {
    --     "rcarriga/nvim-notify",
    --     event = "BufRead",
    --     config = function()
    --         require("notify").setup {
    --             background_colour = "#1e1e1e", -- Цвет фона уведомлений
    --             fps = 30,
    --             timeout = 3000,                -- Время показа уведомлений (5 секунд)
    --             icons = {
    --                 DEBUG = "",
    --                 ERROR = "",
    --                 INFO = "",
    --                 TRACE = "✎",
    --                 WARN = "",
    --             },
    --             level = 2, -- Минимальный уровень для отображения сообщений
    --             render = "compact",
    --             max_wihth = 30,
    --             max_height = 4,
    --             stages = "fade_in_slide_out", -- Анимация уведомлений
    --             top_down = false,
    --         }
    --     end,
    --     dependencies = {
    --         "MunifTanjim/nui.nvim", -- Обязательная зависимость для работы nvim-notify
    --         'nvim-telescope/telescope.nvim',
    --     },
    -- },
    -- TODO: Сделать short cat команды Noce Telescope

    {
        "folke/noice.nvim",
        lazy = false,
        dependencies = {
            "MunifTanjim/nui.nvim",
            -- "rcarriga/nvim-notify",
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
    {
        -- TODO: Русифицировать телескоп\команды для latex

        "Wansmer/langmapper.nvim",
        ft = { 'tex' },
        config = function()
            require "configs/langmapper"
        end,
    },

    {
        'GCBallesteros/jupytext.nvim',
        -- ft = { { 'ipynb' }, { 'python' } },
        -- keys = { { '<Leader>oa' } },
        lazy = false,
        config = function()
            require("jupytext").setup({
                style = "markdown",
                output_extension = "md",
                force_ft = "markdown",
            })
        end
    },
    --
    {
        "3rd/image.nvim",
        ft = { 'markdown' }, -- !!!
        -- lazy = false,
        -- keys = { { '<Leader>oa' }, },
        config = function()
            require("image").setup({
                backend = "ueberzug",
                processor = "magick_rock", -- or "magick_cli"
                integrations = {
                    markdown = {
                        enabled = true,
                        clear_in_insert_mode = false,
                        download_remote_images = true,
                        only_render_image_at_cursor = false,
                        floating_windows = false,              -- if true, images will be rendered in floating markdown windows
                        filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
                    },
                    neorg = {
                        enabled = true,
                        filetypes = { "norg" },
                    },
                    typst = {
                        enabled = true,
                        filetypes = { "typst" },
                    },
                    html = {
                        enabled = false,
                    },
                    css = {
                        enabled = false,
                    },
                },
                max_width = 50,
                max_height = 50,
                max_height_window_percentage = math.huge,
                max_width_window_percentage = math.huge,
                window_overlap_clear_enabled = false,                                               -- toggles images when windows are overlapped
                window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "snacks_notif", "scrollview", "scrollview_sign" },
                editor_only_render_when_focused = false,                                            -- auto show/hide images when the editor gains/looses focus
                tmux_show_only_in_active_window = false,                                            -- auto show/hide images in the correct Tmux window (needs visual-activity off)
                hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, -- render image files as images when opened
            })
        end,
    },
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

    {
        "benlubas/molten-nvim",
        keys = { { '<Leader>oa' }, },
        version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
        build = ":UpdateRemotePlugins",
        config = function()
            require "configs.molten"
        end,
        -- dependencies = {
        --     "3rd/image.nvim",
        -- }
    },


    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        config = function()
            require "configs.textobj"
        end,
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },

    {
        'jmbuhr/otter.nvim',
        keys = { '<Leader>oa' },
        -- lazy = false, -- либо замените на ft = { 'markdown', 'quarto' } для ленивой загрузки
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'hrsh7th/nvim-cmp', -- не обязателен, если не используете автодополнение
        },
        config = function()
            local otter = require 'otter'
            otter.setup {
                lsp = {
                    hover = {
                        border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
                    },
                    diagnostic_update_events = { "BufWritePost" }, -- обновление диагностики
                },
                buffers = {
                    set_filetype = true,   -- установить filetype для otter-буферов
                    write_to_disk = false, -- не сохранять временные файлы на диск
                },
                strip_wrapping_quote_characters = { "'", '"', "`" },
                handle_leading_whitespace = false,

            }


            vim.keymap.set('n', '<leader>oa', function()
                require('otter').activate({ 'python', 'lua' }, true, true)
                print("Otter activated!")

                -- vim.cmd(":MoltenInit")
                -- print("Molten initialized!")

                vim.cmd("MoltenImportOutput")
                print('Molten output!')
            end, { noremap = true, silent = true, desc = "Activate Otter and Molten and import outputs" })
        end,
    },

    {
        "quarto-dev/quarto-nvim",
        keys = { '<Leader>oa' },
        config = function()
            require 'configs.quarto'
        end,

        dependencies = {
            "jmbuhr/otter.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
    },


    -- {
    --     "epwalsh/obsidian.nvim",
    --     version = "*",
    --     ft = "markdown",
    --     dependencies = {
    --         "nvim-lua/plenary.nvim",
    --     },
    --     opts = {
    --         workspaces = {
    --             {
    --                 name = "2brain",
    --                 path = "~/../../media/sf_2brain/",
    --             },
    --         },
    --     },
    --     config = function(_, opts)
    --         require("obsidian").setup(opts)
    --         vim.opt.conceallevel = 2
    --     end,
    -- }
}
