return {
    -- Mason for managing LSP servers
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        build = ":MasonUpdate",
        opts = {},
        config = function()
            require("mason").setup()
        end,
    },

    -- Bridge between mason and lspconfig
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        opts = {
            ensure_installed = {
                "pyright",
                "gopls",
                "rust_analyzer",
                "ts_ls",
                "lua_ls",
            },
            automatic_installation = true,
        },
    },

    -- LSP configuration (Neovim 0.11+ native API)
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- LSP keymaps on attach
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("lsp_attach", { clear = true }),
                callback = function(event)
                    local function map(mode, lhs, rhs, desc)
                        vim.keymap.set(mode, lhs, rhs, { buffer = event.buf, silent = true, desc = desc })
                    end
                    map("n", "gd", vim.lsp.buf.definition, "Go to definition")
                    map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
                    map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
                    map("n", "gr", vim.lsp.buf.references, "Go to references")
                    map("n", "K", vim.lsp.buf.hover, "Hover documentation")
                    map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
                    map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
                    map("n", "[d", vim.diagnostic.goto_prev, "Previous diagnostic")
                    map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
                end,
            })

            -- Server configurations using vim.lsp.config (Neovim 0.11+)
            vim.lsp.config("pyright", {
                capabilities = capabilities,
            })

            vim.lsp.config("gopls", {
                capabilities = capabilities,
            })

            vim.lsp.config("rust_analyzer", {
                capabilities = capabilities,
            })

            vim.lsp.config("ts_ls", {
                capabilities = capabilities,
            })

            vim.lsp.config("lua_ls", {
                capabilities = capabilities,
                settings = {
                    Lua = {
                        workspace = { checkThirdParty = false },
                        telemetry = { enable = false },
                    },
                },
            })

            -- Disable stylua (it's a formatter, not an LSP, but Neovim 0.11 tries to use it)
            vim.lsp.enable("stylua", false)

            -- Enable configured servers
            vim.lsp.enable({ "pyright", "gopls", "rust_analyzer", "ts_ls", "lua_ls" })
        end,
    },

    -- Autocompletion
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "buffer" },
                    {
                        name = "path",
                        option = {
                            get_cwd = function()
                                return vim.fn.getcwd()
                            end,
                        },
                    },
                }),
            })

            -- Disable autocompletion in wiki files
            cmp.setup.filetype("vimwiki", {
                enabled = false,
            })
        end,
    },
}
