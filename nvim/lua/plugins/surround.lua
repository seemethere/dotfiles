return {
  -- disable mini.surround from the default LazyVim distribution
  { "echasnovski/mini.surround", enabled = false },
  -- directly conflicts with typical nvim-surroundkeymaps
  { "folke/flash.nvim", enabled = false },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end,
  },
}
