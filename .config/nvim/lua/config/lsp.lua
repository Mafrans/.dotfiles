return function()
    local lspconfig = require "lspconfig"
    local cmpnvimlsp = require "cmp_nvim_lsp"

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = cmpnvimlsp.default_capabilities(capabilities)

    lspconfig.typst_lsp.setup{
      capabilities=capabilities,
      settings={
        filetypes={"typst", "typ"},
        exportPdf="onType"
      }
    }
    lspconfig.pyright.setup{capabilities=capabilities}
    lspconfig.tsserver.setup{capabilities=capabilities}
    lspconfig.tailwindcss.setup{capabilities=capabilities}
    lspconfig.intelephense.setup{capabilities=capabilities}
    lspconfig.gopls.setup{capabilities=capabilities}
    lspconfig.java_language_server.setup{
      capabilities=capabilities,
      cmd={"java-language-server"}
    }
end
