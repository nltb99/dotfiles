call plug#begin('~/.config/nvim/bundle')

" Highlight & Decoration
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'windwp/nvim-autopairs'
Plug 'alvan/vim-closetag'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'vim-airline/vim-airline'
Plug 'Xuyuanp/scrollbar.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'gen740/SmoothCursor.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'

" Syntax
Plug 'folke/trouble.nvim', { 'dependencies': ['nvim-tree/nvim-web-devicons'] }
" Plug 'dense-analysis/ale'
" Plug 'vim-syntastic/syntastic'

" snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

" Theme
Plug 'joshdick/onedark.vim'
Plug 'LunarVim/primer.nvim'
Plug 'LunarVim/Onedarker.nvim'

" LSP
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig' 
Plug 'lukas-reineke/lsp-format.nvim'
" Plug 'jose-elias-alvarez/null-ls.nvim'

" CMP
" Plug 'hrsh7th/nvim-cmp'
" Plug 'hrsh7th/cmp-buffer' 
" Plug 'hrsh7th/cmp-path'
" Plug 'saadparwaiz1/cmp_luasnip' 
" Plug 'hrsh7th/cmp-nvim-lsp'
" Plug 'hrsh7th/cmp-nvim-lua'
" Plug 'hrsh7th/cmp-cmdline'

" Git
Plug 'lewis6991/gitsigns.nvim'
Plug 'f-person/git-blame.nvim'

" Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }

" Common
Plug 'goolord/alpha-nvim'
Plug 'lewis6991/impatient.nvim'
Plug 'folke/which-key.nvim'
Plug 'ggandor/lightspeed.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'scrooloose/nerdtree'
Plug 'romgrk/barbar.nvim'
Plug 'mbbill/undotree'
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'ahmedkhalf/project.nvim'
Plug 'easymotion/vim-easymotion'
Plug 'tomtom/tcomment_vim'
Plug 'ThePrimeagen/harpoon'
Plug 'moll/vim-bbye'
Plug 'nvim-pack/nvim-spectre'

" Telescope
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.3' }
Plug 'nvim-telescope/telescope-media-files.nvim'

" Prettier
" Plug 'prettier/vim-prettier', {
"   \ 'do': 'yarn install --frozen-lockfile --production',
"   \ 'branch': 'release/1.x'
"   \ }

" Programming
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'terryma/vim-multiple-cursors'
Plug 'neoclide/coc-tsserver'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'brooth/far.vim'
Plug 'pechorin/any-jump.vim'

call plug#end()

