--- @diagnostic disable: undefined-global
-- Define a list of language servers to enable
local lsps = {
    "lua_ls",
    "rust_analyzer",
    "gopls",
}
for _, lsp in ipairs(lsps) do
    vim.lsp.enable(lsp)
end

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
      local bufnr = event.buf
      local opts = { buffer = bufnr, noremap = true, silent = true }

      -- diagnostics
      vim.diagnostic.config {
          virtual_text = {
              spacing = 3,
              prefix = '●',
          },
          signs = {
              text = {
                  [vim.diagnostic.severity.ERROR] = "✘",
                  [vim.diagnostic.severity.WARN]  = "▲",
                  [vim.diagnostic.severity.INFO]  = "·",
                  [vim.diagnostic.severity.HINT]  = "➤",
              },
          },
      }
      -- keymaps
      local function map(key, fn, desc)
          vim.keymap.set('n', key, fn, vim.tbl_extend('force', opts, { desc = desc }))
      end

      map('gd', vim.lsp.buf.definition, 'LSP Goto Definition')

      map('gD', vim.lsp.buf.declaration, 'LSP Goto Declaration')

      map('<leader>ld', function()
          vim.diagnostic.open_float { source = true }
      end, 'LSP: Show Diagnostic')

      map('K', vim.lsp.buf.hover, 'LSP: Hover Documentation')

      map('<leader>rn', vim.lsp.buf.rename, 'LSP: Rename Symbol')

  end,
})
