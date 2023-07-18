return {
    -- You can also add new plugins here as well:
    -- Add plugins, the lazy syntax
    { "vimwiki/vimwiki", lazy = false }, {
    "kylechui/nvim-surround",
    version = "*",     -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup {
            -- Configuration here, or leave empty to use defaults
        }
    end
},
    {
        "github/copilot.vim",
        cmd = "Copilot",
        event = { "BufReadPost", "BufNewFile" }
    }
    -- "andweeb/presence.nvim",
    -- {
    --   "ray-x/lsp_signature.nvim",
    --   event = "BufRead",
    --   config = function()
    --     require("lsp_signature").setup()
    --   end,
    -- },
}
