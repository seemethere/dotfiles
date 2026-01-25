return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        opts = {
            flavour = "mocha",
            transparent_background = false,
            integrations = {
                gitsigns = true,
                mason = true,
                neotree = true,
                telescope = true,
                treesitter = true,
                native_lsp = {
                    enabled = true,
                },
            },
        },
        config = function(_, opts)
            require("catppuccin").setup(opts)
            vim.cmd.colorscheme("catppuccin")
        end,
    },
}
