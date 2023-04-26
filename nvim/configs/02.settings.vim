let mapleader=","

" Override copy paste
nnoremap x "_x
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d
nnoremap <leader>d ""d
nnoremap <leader>D ""D
vnoremap <leader>d ""d

filetype plugin on
filetype plugin indent on

autocmd BufEnter * :set scroll=10
syntax on
set encoding=UTF-8
set mouse=a
set clipboard^=unnamed,unnamedplus

set number
set relativenumber
" set ignorecase
set smartcase

set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
set lazyredraw
set nobackup
set noswapfile
set nowrap

set visualbell
set noerrorbells

set autoread
set autowrite
"imap
inoremap jj <ESC>
inoremap ww <ESC>:w<cr>
inoremap <silent> <c-l> <ESC>la
inoremap <silent><expr><Tab> pumvisible() ? "\<C-N>" : "\<Tab>"
inoremap <silent><expr><S-Tab> pumvisible() ? "\<C-P>" : "\<S-Tab>"
"nmap
nnoremap ; :
nnoremap <Esc><Esc> :nohlsearch<CR>
nnoremap <silent> dh :ALEGoToDefinitionInSplit<cr>
nnoremap <silent> dv :ALEGoToDefinitionInVSplit<cr>
nnoremap <silent> K :call <SID>show_documentation()<CR>
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
nnoremap <silent> <c-x> :BD<cr>
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
noremap Y y$
nmap <silent> ff <Plug>(easymotion-overwin-f2)
nmap <silent> fl <Plug>(easymotion-overwin-line)
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

"escape highlight search
"copy/pase
vnoremap < <gv
vnoremap > >gv
vnoremap <silent> y y:call ClipboardYank()<cr>
vnoremap <silent> d d:call ClipboardYank()<cr>
nnoremap <silent> p :call ClipboardPaste()<cr>p
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Switch Buffer
nnoremap <Leader>b :ls<CR>:b<Space>

" FZF
command! -bang -nargs=? -complete=dir FF call fzf#vim#files(<q-args>, {'options': ['--info=inline', '-i', '--preview', 'cat {}']}, <bang>0)
command! -bang -nargs=? -complete=dir BB call fzf#vim#buffers(<q-args>, {'options': ['--info=inline', '-i', '--preview', 'cat {}']}, <bang>0)
command! -bang -nargs=? -complete=dir HH call fzf#vim#history(<q-args>, {'options': ['--info=inline', '-i', '--preview', 'cat {}']}, <bang>0)


" Search Word Exact
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>

