local spell_check = vim.api.nvim_create_augroup("SpellCheck", { clear = true })

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    group = spell_check,
    pattern = { "*.jrnl", "*.note" },
    callback = function()
        vim.bo.filetype = "notes"
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    group = spell_check,
    pattern = { "notes", "markdown" },
    callback = function()
        vim.opt_local.spell = true
        vim.opt_local.spelllang = "en_us"
        vim.opt_local.wrap = true
    end,
})
