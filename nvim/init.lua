-- options
require("config.options")

-- keymap
require("config.keymaps")

-- plugins
require("config.lazy")

--lsp
require("config.lsp")

-- Transparency
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
