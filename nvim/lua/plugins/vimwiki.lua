return {
  {
    "vimwiki/vimwiki",
    init = function() --replace 'config' with 'init'
      vim.g.vimwiki_list = { { path = "~/vimwiki", syntax = "markdown", ext = ".wiki" } }
    end,
  },
}
