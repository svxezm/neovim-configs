call plug#begin()

Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tad': '0.1.6' }
Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v3.x'}

let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier'] 
call plug#end()

set encoding=UTF-8

" Remaps "

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
