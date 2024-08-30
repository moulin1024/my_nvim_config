-- plugins.lua
require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'itchyny/lightline.vim'


    use 'tpope/vim-fugitive'
    -- Vim commentary plugin
    use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
    }
    -- File explorer
    use 'kyazdani42/nvim-tree.lua'
    use 'kyazdani42/nvim-web-devicons' -- Optional, for file Icons
    
    -- nvim-treesitter for syntax highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            require('nvim-treesitter.install').update({ with_sync = true })
        end,
    }

    -- Polyglot for many language support
    use 'sheerun/vim-polyglot'

    -- GitHub Copilot plugin
    use 'github/copilot.vim'

    -- LSP support
    use 'neovim/nvim-lspconfig' -- Collection of configurations for the built-in LSP client

    -- Autocompletion
    use 'hrsh7th/nvim-cmp'        -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp'    -- LSP source for nvim-cmp
    use 'hrsh7th/cmp-buffer'      -- Buffer completions
    use 'hrsh7th/cmp-path'        -- Path completions
    use 'hrsh7th/cmp-vsnip'       -- Snippet completions
    use 'hrsh7th/vim-vsnip'       -- Snippet engine

    -- Optional: Icons for autocompletion
    use 'onsails/lspkind-nvim'
end)

