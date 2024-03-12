-- LSP setup
local lsp = require('lsp-zero').preset({ manage_nvim_cmp = false})

lsp.preset("recommended")
lsp.extend_lspconfig()

lsp.on_attach(function(_, bufnr)
    -- see :help lsp-zero-keybindings
    -- to learn the available actions
    lsp.default_keymaps({ buffer = bufnr })
end)

lsp.set_preferences({
    sign_icons = {}
})

lsp.on_attach(function(_, bufnr)
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
    -- diagnostic next one
    vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next , opts)
    -- diagnostic previous one 
    vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev , opts)
    -- rename
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename , opts)
end)

lsp.setup()

--- Language server configurations
require("mason").setup({})
require("mason-lspconfig").setup({
    -- Replace the language servers listed here
    -- with the ones you want to install
    ensure_installed = {
        "tsserver",
        "rust_analyzer",
        "lua_ls",
        "gopls",
        "bufls"
        -- "sumneko_lua",
    },
    handlers = {
        lsp.default_setup,
    }
})

-- Completion setup
local cmp = require("cmp")
-- local cmp_select = { behavior = cmp.SelectBehavior.Seelect }
-- local cmp_mappings = lsp.defaults.cmp_mappings({
--     ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
--     ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
--     ["<C-y>"] = cmp.mapping.confirm({ select = true }),
--     ["<C-Space>"] = cmp.mapping.complete(),
-- })

vim.opt.completeopt = {"menu", "menuone", "noselect"}

-- Set up nvim-cmp
cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- accept currently selected item. Set `select` to `false` only to confirm explicitly selected items.
    }),
    sources = cmp.config.sources(
    {
        { name = "nvim_lsp" },
        { name = "luasnip" }, -- For luasnip users.

    },
    {
        { name = "buffer" }
    }
    )
})

-- Set configuration for specific file type.
cmp.setup.filetype("gitcommit", {
    sources = cmp.config.sources(
    {
        { name = "git" },
    },
    {
        { name = "buffer" },
    })
})

-- Set lspconfig
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
local lspconfig = require("lspconfig")

lspconfig["gopls"].setup {
    capabilities = capabilities
}

lspconfig["rust_analyzer"].setup {
    capabilities = capabilities
    -- capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
}

lspconfig["lua_ls"].setup {
    settings = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
        },
    },
}

-- local sumneko_root = vim.fn.stdpath('cache') .. '/lspconfig/sumneko_lua/lua-language-server'
-- 
-- lspconfig["sumneko_lua"].setup {
--   cmd = {
--     sumneko_root .. '/bin/macOS/lua-language-server',
--     '-E',
--     sumneko_root .. '/main.lua',
--   },
--   capabilities = capabilities,
--   settings = {
--     Lua = {
--       runtime = { version = 'LuaJIT', path = vim.split(package.path, ';') },
--       diagnostics = {
--         enable = true,
--         globals = {'vim'},
--       },
--     }
--   },
-- }

-- lspconfig.rust_analyzer.setup({
--    settings = {
--      ['rust-analyzer'] = {
--        diagnostics = {
--          -- enable = false;
--          enable = true;
--        },
--        inlayHints = {
--            bindingModeHints = {
--                enable = true;
--            },
--            chainingHints = {
--                enable = true;
--            },
--            parameterHints = {
--                enable = true;
--            },
--            typeHints = {
--                enable = true;
--            }
--        }
--      }
--    }
--  })
-- 
