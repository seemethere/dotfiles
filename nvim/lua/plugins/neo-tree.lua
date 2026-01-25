return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
        keys = {
            { "<C-e>", "<cmd>Neotree toggle<cr>", desc = "Toggle file tree" },
            { "<leader>e", "<cmd>Neotree reveal<cr>", desc = "Find file in tree" },
        },
        opts = {
            close_if_last_window = true,
            filesystem = {
                filtered_items = {
                    visible = true,
                    show_hidden_count = true,
                    hide_dotfiles = false,
                    hide_gitignored = true,
                    hide_by_name = {
                        ".git",
                        ".DS_Store",
                        "thumbs.db",
                    },
                },
                follow_current_file = {
                    enabled = true,
                },
                use_libuv_file_watcher = true,
            },
            window = {
                width = 35,
                mappings = {
                    ["<space>"] = "none",
                },
            },
        },
    },
}
