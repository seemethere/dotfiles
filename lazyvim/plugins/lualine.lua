return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
        return {
            options = {
                theme = "gruvbox",
                globalstatus = true,
                disabled_filetypes = {statusline = {"dashboard", "alpha"}}
            }
        }
    end
}
