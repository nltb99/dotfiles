call plug#begin('~/.config/nvim/bundle')

" Highlight & Decoration
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
Plug 'jparise/vim-graphql'        " GraphQL syntax
Plug 'windwp/nvim-autopairs'
Plug 'alvan/vim-closetag'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'vim-airline/vim-airline'
Plug 'Xuyuanp/scrollbar.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'gen740/SmoothCursor.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'

" Syntax
Plug 'dense-analysis/ale'
Plug 'folke/trouble.nvim'
Plug 'vim-syntastic/syntastic'

" Theme
Plug 'joshdick/onedark.vim'

" LSP
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig' 
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'lukas-reineke/lsp-format.nvim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'
Plug 'APZelos/blamer.nvim'

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

" Telescope
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.3' }
Plug 'nvim-telescope/telescope-media-files.nvim'
Plug 'nvim-lua/popup.nvim'

" Prettier
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'branch': 'release/1.x'
  \ }

" Programming
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pechorin/any-jump.vim'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tomtom/tcomment_vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'neoclide/coc-tsserver'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'brooth/far.vim'
Plug 'jlevesy/rust.vim'

call plug#end()

