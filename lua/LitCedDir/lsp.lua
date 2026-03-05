return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "saadparwaiz1/cmp_luasnip",
        "L3MON4D3/LuaSnip",
        "zbirenbaum/copilot.lua",
        "zbirenbaum/copilot-cmp",
        "folke/fidget.nvim",
    },

    config = function()
        local lspconfig = require("lspconfig")
        local cmp = require("cmp")
        local luasnip = require("luasnip")
        local cmp_lsp = require("cmp_nvim_lsp")

        -- Mason setup
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "tsserver",
                "emmet_ls",
                "rust_analyzer",
                "tailwindcss",
            },
        })

        -- Fidget for LSP progress
        require("fidget").setup({})

        -- LSP capabilities for CMP
        local capabilities = vim.tbl_deep_extend(
            "force",
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )

        -- LSP Servers
        local servers = {
            "lua_ls",
            "tsserver",
            "rust_analyzer",
            "tailwindcss",
            "emmet_ls",
        }

        for _, lsp_name in ipairs(servers) do
            lspconfig[lsp_name].setup({
                capabilities = capabilities,
                on_attach = function(client, bufnr)
                    local opts = { buffer = bufnr, remap = false }
                    -- Keymaps
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
                    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
                    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
                    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
                    vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
                    vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
                    vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
                    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
                end,
                settings = lsp_name == "lua_ls" and {
                    Lua = {
                        runtime = { version = "LuaJIT" },
                        diagnostics = { globals = { "vim" } },
                        workspace = { library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false },
                        format = { enable = true },
                    }
                } or nil,
                filetypes = lsp_name == "emmet_ls" and {
                    "html", "typescriptreact", "javascriptreact", "css", "sass", "scss"
                } or nil,
            })
        end

        -- CMP setup
        local cmp_select = { behavior = cmp.SelectBehavior.Select }
        cmp.setup({
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    elseif require("copilot.suggestion").is_visible() then
                        require("copilot.suggestion").accept()
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
                { name = "copilot", group_index = 2 },
                { name = "nvim_lsp" },
                { name = "luasnip" },
            }, {
                { name = "buffer" },
            }),
        })

        -- Copilot setup
        require("copilot").setup({
            panel = { enabled = true },
            suggestion = { enabled = true },
            filetypes = {
                ["*"] = true,
            },
        })
        require("copilot_cmp").setup({
            method = "getCompletionsCycling",
        })

        -- Diagnostics
        vim.diagnostic.config({
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
            },
        })
    end
}