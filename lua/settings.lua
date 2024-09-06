-- settings.lua
vim.opt.number = true
vim.opt.relativenumber = true  -- Enables relative line numbers
vim.cmd('colorscheme habamax')


-- Configure toggle_terminal and file explorer

local toggle_terminal = require('toggle_terminal')
vim.api.nvim_set_keymap('n', '<leader>t', ':lua require("toggle_terminal").ToggleTerminal()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>', 'za', { noremap = true, silent = true })


-- Set tab and indentation options
vim.opt.tabstop = 4       -- Number of spaces that a <Tab> in the file counts for
vim.opt.shiftwidth = 4    -- Number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true  -- Convert tabs to spaces
vim.o.foldmethod = 'indent'   -- Use indentation levels for folding
vim.o.foldlevel = 99          -- Start with all folds open

