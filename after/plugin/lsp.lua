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

lsp.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ['tsserver'] = {'javascript', 'typescript'},
    ['rust_analyzer'] = {'rust'},
    ['gopls'] = {'go'},
  }
})

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
        "bufls",
        "html",
        "typos_lsp",
        -- "sumneko_lua",
    },
    handlers = {
        lsp.default_setup,
    }
})

-- Completion setup
local cmp = require("cmp")

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

local lspconfig = require("lspconfig")
local servers = {"gopls", "rust_analyzer", "tsserver", "typos_lsp"}

-- default setup
for _, server in ipairs(servers) do
    lspconfig[server].setup {
        capabilities = capabilities
    }
end

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

