return {
  -- disable mini.surround from the default LazyVim distribution
  { "nvim-mini/mini.surround", enabled = false },
  -- directly conflicts with typical nvim-surroundkeymaps
  { "folke/flash.nvim", enabled = false },
  -- causes a ton of slow downs for me on macOS Sonoma
  -- { "echasnovski/mini.indentscope", enabled = false },
}
