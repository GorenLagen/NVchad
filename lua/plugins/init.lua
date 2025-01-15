return {

    -- TODO: add SQL

    {
        "stevearc/conform.nvim",
        event = "BufWritePre",
        opts = require "configs.conform",
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },


    -- TODO: Сделать возможность создавание ячееееееек
    -- Сделать подержку для отображения в коммандной линии <- че?

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

            { "<Leader>d",     "<Cmd>MultipleCursorsAddJumpNextMatch<CR>", mode = { "n", "x" },      desc = "Add cursor and jump to next cword" },
            { "<Leader>D",     "<Cmd>MultipleCursorsJumpNextMatch<CR>",    mode = { "n", "x" },      desc = "Jump to next cword" },
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

    -- {
    --     'echasnovski/mini.nvim',
    --     event = "BufRead",
    --     config = function()
    --         require 'configs.mini'
    --     end
    -- },

    {
        "folke/todo-comments.nvim",
        event = 'BufRead',
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = require "configs.todo",
    },

    {
        "mfussenegger/nvim-dap",
        keys = { { '<localleader>du' } },
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

    {
        "theprimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("harpoon"):setup()
        end,
        keys = {
            { "<localleader>H", function() require("harpoon"):list():append() end, desc = "harpoon file", },

            {
                "<localleader>h",
                function()
                    local harpoon = require("harpoon")
                    harpoon.ui:toggle_quick_menu(harpoon:list())
                end,
                desc = "harpoon quick menu",
            },

            -- { "<localleader>1", function() require("harpoon"):list():select(1) end, desc = "harpoon to file 1", },
            -- { "<localleader>2", function() require("harpoon"):list():select(2) end, desc = "harpoon to file 2", },
            -- { "<localleader>3", function() require("harpoon"):list():select(3) end, desc = "harpoon to file 3", },
            -- { "<localleader>4", function() require("harpoon"):list():select(4) end, desc = "harpoon to file 4", },
            -- { "<localleader>5", function() require("harpoon"):list():select(5) end, desc = "harpoon to file 5", },
        },
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

        -- TODO: сделать сниппеты -> выделение -> прописывание комманды textbf -> текст находиться в textbf

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

    -- TODO: сделать поддержу передвижения в telescope

    {
        "Wansmer/langmapper.nvim",
        -- lazy = false,
        ft = { 'tex', 'markdown' },
        config = function()
            require "configs/langmapper"
        end,
    },


    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "BufRead",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },

    {
        "kdheepak/lazygit.nvim",
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        -- setting the keybinding for LazyGit with 'keys' is recommended in
        -- order to load the plugin when the command is run for the first time
        keys = {
            { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
        }
    },

    {
        "HakonHarnes/img-clip.nvim",
        ft = { "markdown", 'tex' },
        opts = {
            -- add options here
            -- or leave it empty to use the default settings
        },
        keys = {
            -- suggested keymap
            { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
        },
    },

    {
        "folke/twilight.nvim",
    },

    {
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
        config = function()
            vim.cmd('ZenMode')
            vim.cmd('ZenMode')
        end,
    },

    {
        "reedes/vim-pencil",
        cmd = "PencilSoft",
        config = function()
            vim.cmd('PencilSoft') -- Включаем режим Pencil вручную
        end,
    },
}
