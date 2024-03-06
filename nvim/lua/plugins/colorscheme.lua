vim.opt.background = "dark"

return {
  { "ellisonleao/gruvbox.nvim", name = "gruvbox", priority = 1000 },

  -- Configure LazyVim to load the colors scheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
