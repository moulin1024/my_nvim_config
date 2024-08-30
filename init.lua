-- init.lua
require('settings')
require('plugins')
require('treesitter')
require('lsp')        -- Load LSP configuration
require("nvim-tree").setup()

local toggle_terminal = require('toggle_terminal')

-- Map <leader>t to toggle terminal
vim.api.nvim_set_keymap('n', '<leader>t', ':lua require("toggle_terminal").ToggleTerminal()<CR>', { noremap = true, silent = true })

-- Map <leader>e to open nvim-tree
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })


-- Set tab and indentation options
vim.opt.tabstop = 4       -- Number of spaces that a <Tab> in the file counts for
vim.opt.shiftwidth = 4    -- Number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true  -- Convert tabs to spaces


-- cmp.lua or init.lua (where you set up cmp)

local cmp = require'cmp'

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vim-vsnip` users.
    end,
  },
  mapping = {
    ['<Down>'] = cmp.mapping.select_next_item(),    -- Move to the next item
    ['<Up>'] = cmp.mapping.select_prev_item(),      -- Move to the previous item
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept the selected item with Enter
    ['<C-Space>'] = cmp.mapping.complete(),         -- Manually trigger completion
    ['<Esc>'] = cmp.mapping.close(),                -- Close the completion menu
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' }, -- For vsnip users.
  }, {
    { name = 'buffer' },
    { name = 'path' },
  })
})



