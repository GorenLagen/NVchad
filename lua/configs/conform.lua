local options = {
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "ruff", "black" },
        tex = { "latexindent" },
        markdown = { "prettier" },
        -- css = { "prettier" },
        -- html = { "prettier" },
    },

    formatters = {
        -- Python
        ruff = {
            prepend_args = {
                "check",
                "format",
            },
        },

        black = {
            prepend_args = {
                "--fast",
                "--line-length",
                "80",
            },
        },

        -- Markdown
        prettier = {
            prepend_args = {
                "--prose-wrap",
                "always",
            },
        },
    },

    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
    },
}

return options
