vim.opt.background = "dark"

return {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- Configure LazyVim to load the colors scheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
}
