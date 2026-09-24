return {
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            current_line_blame = true,
            signs = {
                add = { text = "+" },
                change = { text = "~" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
            },
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns
                local function map(mode, lhs, rhs, desc)
                    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
                end

                map("n", "]h", gs.next_hunk, "Next hunk")
                map("n", "[h", gs.prev_hunk, "Previous hunk")
                map("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
                map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
                map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")
                map("n", "<leader>hb", gs.blame_line, "Blame line")
            end,
        },
    },
}
