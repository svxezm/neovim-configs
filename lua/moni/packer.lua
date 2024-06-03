-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    require("mason").setup()

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use({
        "rose-pine/neovim",
        as = "rose-pine",
        config = function()
            vim.cmd("colorscheme rose-pine")
        end
    })

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('nvim-treesitter/playground')
    use('ThePrimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use('tribela/vim-transparent')
    use{'neoclide/coc.nvim', branch = 'release'}
    use('neoclide/coc-tsserver')
    use('neoclide/coc-tslint-plugin')
    use('neoclide/coc-css')
    use('neoclide/coc-json')
    use('neoclide/coc-prettier')
    use('CRAG666/code_runner.nvim')
    use('OmniSharp/Omnisharp-vim')

    use('rstacruz/vim-closer')
    use('tpope/vim-surround')
    use('jiangmiao/auto-pairs')

    -- JSX and TSX
    use('yuezk/vim-js')
    use('HerringtonDarkholme/yats.vim')
    use('maxmellon/vim-jsx-pretty')

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment the two plugins below if you want to manage the language servers from neovim
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
            {'neovim/nvim-lspconfig'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'hrsh7th/cmp-nvim-lua'},
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
        }
    }
end)

