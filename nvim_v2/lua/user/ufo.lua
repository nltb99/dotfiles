vim.o.foldlevel = 99
vim.o.foldlevelstart = -1
vim.o.foldenable = true


local status_ok, ufo = pcall(require, "ufo")
if not status_ok then
  return
end

vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

local capabilities = require("user.lsp.handlers").capabilities
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = false
}

local language_servers = { 'rust_analyzer' } -- like {'gopls', 'clangd'}
for _, ls in ipairs(language_servers) do
  require('lspconfig')[ls].setup({
    capabilities = capabilities,
  })
end

ufo.setup({
    provider_selector = function(bufnr, filetype, buftype)
        return {'treesitter', 'indent'}
    end
})
