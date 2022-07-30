--local capabilities = vim.lsp.protocol.make_client_capabilities()
--capabilities.textDocument.foldingRange = {
    --dynamicRegistration = false,
    --lineFoldingOnly = true
--}
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
require('ufo').setup()
