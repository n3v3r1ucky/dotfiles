local capabilities = vim.tbl_deep_extend(
  "force",
  vim.lsp.protocol.make_client_capabilities(),
  require('lsp-file-operations').default_capabilities()
)
vim.lsp.config('*', {
    capabilities = capabilities
})

vim.lsp.enable({ 'basedpyright', "lua_ls" })

-- Reserve a space in the gutter
vim.opt.signcolumn = 'yes'

-- This should be executed before you configure any language server

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        vim.keymap.set('n', 'gS', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('n', 'cr', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set({ 'n', 'x' }, 'cf', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
        vim.keymap.set('n', 'ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
        vim.keymap.set('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
        vim.keymap.set('n', '<leader>ss', '<cmd>Telescope lsp_dynamic_workspace_symbols<CR>', opts)
    end,
})

local cmp = require('cmp')

local cmp_select = { behavior = 'select' }
cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
    },
    snippet = {
        expand = function(args)
            -- You need Neovim v0.10 to use vim.snippet
            vim.snippet.expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
    }),
})

-- Enable inline diagnostics (virtual text)
vim.diagnostic.config({
    virtual_text = true,    -- Show inline diagnostics
    signs = true,           -- Show signs in the sign column
    update_in_insert = false, -- Don't update diagnostics while in insert mode
    underline = true,       -- Underline the offending code
    severity_sort = true,   -- Sort diagnostics by severity
})

-- Optional: Customize the virtual text format
vim.diagnostic.config({
    virtual_text = {
        source = true, -- Show the source of the diagnostic
        prefix = "■", -- Custom prefix for virtual text
        spacing = 4, -- Spacing between the prefix and the message
    },
})
