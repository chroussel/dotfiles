local lsp = require('lsp-zero')

vim.g.rustaceanvim = {

    tools = {
        hover_with_actions = false,
    },
    server = {
        capabilities = lsp.get_capabilities(),
        on_attach = function(_, bufnr)

        end,
        ['rust-analyzer'] = {
            diagnostics = {
                enable = true
            },
            checkOnSave = {
                command = "clippy",
            },
            cargo = {
                allFeatures = true,
            }
        }
    }
}

