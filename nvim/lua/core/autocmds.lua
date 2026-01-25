-- Autocommands
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Strip trailing whitespace on save
autocmd("BufWritePre", {
    group = augroup("strip_whitespace", { clear = true }),
    pattern = "*",
    callback = function()
        local save_cursor = vim.fn.getpos(".")
        pcall(function()
            vim.cmd([[%s/\s\+$//e]])
        end)
        vim.fn.setpos(".", save_cursor)
    end,
})

-- Restore cursor position
local ignore_buftype = { "quickfix", "nofile", "help" }
local ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" }

autocmd({ "BufWinEnter", "FileType" }, {
    group = augroup("restore_cursor", { clear = true }),
    callback = function()
        if vim.tbl_contains(ignore_buftype, vim.bo.buftype) then
            return
        end
        if vim.tbl_contains(ignore_filetype, vim.bo.filetype) then
            vim.cmd([[normal! gg]])
            return
        end
        if vim.fn.line(".") > 1 then
            return
        end
        local last_line = vim.fn.line([['"]])
        local buff_last_line = vim.fn.line("$")
        if last_line > 0 and last_line <= buff_last_line then
            vim.cmd([[normal! g`"zz]])
        end
    end,
})

-- Highlight on yank
autocmd("TextYankPost", {
    group = augroup("highlight_yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank({ timeout = 200 })
    end,
})

-- Auto-resize splits on window resize
autocmd("VimResized", {
    group = augroup("resize_splits", { clear = true }),
    command = "tabdo wincmd =",
})

-- Disable line numbers in terminal
autocmd("TermOpen", {
    group = augroup("terminal_settings", { clear = true }),
    pattern = "*",
    command = "setlocal nonumber norelativenumber",
})

-- 2-space indentation for specific filetypes
autocmd("FileType", {
    group = augroup("indent_settings", { clear = true }),
    pattern = { "haskell", "puppet", "ruby", "yaml", "yml", "lua", "javascript", "typescript", "json" },
    callback = function()
        vim.opt_local.shiftwidth = 2
        vim.opt_local.softtabstop = 2
    end,
})
