-- lsp.lua

-- Import lspconfig
local lspconfig = require'lspconfig'

-- Setup LSP servers

-- Fortran (fortls)
lspconfig.fortls.setup{}

-- C++ and CUDA (clangd)
lspconfig.clangd.setup{
    cmd = { "clangd" },
    filetypes = { "c", "cpp", "cuda" },  -- Adding support for CUDA
    root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
}

-- Python (pyright)
lspconfig.pyright.setup{}



-- LSP server configuration
local lspconfig = require'lspconfig'

-- Example: Set up LSP for Python using pyright
lspconfig.pyright.setup{}


vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
    }
)
