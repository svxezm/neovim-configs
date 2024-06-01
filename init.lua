local vimrc = vim.fn.stdpath("config") .. "./vimrc.vim"
vim.cmd.source(vimrc)

-- Sets
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.g.mapleader = " "


-- Plug installer
local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')


Plug 'rose-pine/neovim'
Plug 'williamboman/mason.nvim'
Plug 'tribela/vim-transparent'
Plug 'ThePrimeagen/harpoon'
Plug 'nvim-lua/plenary.nvim'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'CRAG666/code_runner.nvim'
Plug ('nvim-telescope/telescope.nvim', { tag = '0.1.6' })

Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'

-- Auto completrion
Plug 'neoclide/coc.nvim'
Plug 'neoclide/coc-tsserver'
Plug 'neoclide/coc-tslint-plugin'
Plug 'neoclide/coc-css'
Plug 'neoclide/coc-json'
Plug 'neoclide/coc-prettier'

Plug 'ap/vim-css-color'
Plug 'rstacruz/vim-closer'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'

-- JSX and tsX
Plug 'yuezk/vim-js'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'maxmellon/vim-jsx-pretty'
vim.call('plug#end')


-- Remaps
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
end)

vim.keymap.set("n", "<leader>w", ":w<CR>", { noremap = true, silent = false })

vim.keymap.set('n', '<leader>r', ':RunCode<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rf', ':RunFile<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rft', ':RunFile tab<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rp', ':RunProject<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rc', ':RunClose<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>crf', ':CRFiletype<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>crp', ':CRProjects<CR>', { noremap = true, silent = false })



-- Colos
vim.cmd.colorscheme("rose-pine")

-- Code Runner
require("code_runner").setup({
    filetype = {
        python = "python3 -u",
        typescript = "bun run",
        javascript = "bun run",
        cs = "dotnet run",
        c = function(...)
            c_base = {
                "cd $dir &&",
                "gcc $fileName -o",
                "/tmp/$fileNameWIthoutExt",
            }
            local c_exec = {
                "&& /tmp/$fileNameWithoutExt &&",
                "rm /tmp/$fileNameWithoutExt",
            }
            vim.ui.input({ prompt = "Add more args:" }, function(input)
                c_base[4] = input
                vim.print(vim.tbl_extend("force", c_base, c_exec))
                require("code_runner.commands").run_from_fn(vim.list_extend(c_base,c_exec))
            end)
        end,
    },
})


-- Fugitive
vim.keymap.set("n", "<leader>gs", vim.cmd.Git);

-- Harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-s>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-n>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-e>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-i>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-o>", function() ui.nav_file(4) end)

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-g>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', "gt", "<cmd>diffget //2<CR>")
vim.keymap.set('n', "gn", "<cmd>diffget //3<CR>")

-- Treesiter
--require'nvim-treesitter.configs'.setup {
--  ensure_installed = { "javascript", "typescript", "c", "lua", "vim", "vimdoc", "query" },
--
--  sync_install = false,
--
--  auto_install = true,
--
--  highlight = {
--    enable = true,
--    additional_vim_regex_highlighting = false,
--  },
--}

