return {
    -- Tmux-Neovim pane navigation
    {
        "christoomey/vim-tmux-navigator",
        event = "VeryLazy",
        init = function()
            vim.g.tmux_navigator_disable_when_zoomed = 1
        end,
    },

    -- Auto-cd to project root
    {
        "airblade/vim-rooter",
        event = "VeryLazy",
        init = function()
            vim.g.rooter_patterns = { ".git", "Cargo.toml", "go.mod", "package.json", "pyproject.toml" }
            -- Don't change directory for files without a project root
            vim.g.rooter_change_directory_for_non_project_files = ""
        end,
    },
}
