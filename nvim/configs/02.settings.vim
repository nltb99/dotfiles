" Global variable os
if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
        let g:os = "Windows"
    else
        let g:os = substitute(system('uname'), '\n', '', '')
    endif
endif

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
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

if has("gui_running")
    if g:os == "Darwin"
        vnoremap <silent> y y:call ClipboardYank()<cr>
        vnoremap <silent> d d:call ClipboardYank()<cr>
        nnoremap <silent> p :call ClipboardPaste()<cr>p
    elseif g:os == "Linux"
    elseif g:os == "Windows"
    endif
endif

" Switch Buffer
nnoremap <Leader>b :ls<CR>:b<Space>

" FZF
command! -bang -nargs=? -complete=dir FF call fzf#vim#files(<q-args>, {'options': ['--info=inline', '-i', '--preview', '~/.config/nvim/preview.sh {}']}, <bang>0)
command! -bang -nargs=? -complete=dir FG call fzf#vim#gitfiles(<q-args>, {'options': ['--info=inline', '-i', '--preview', '~/.config/nvim/preview.sh {}']}, <bang>0)
command! -bang -nargs=? -complete=dir BB call fzf#vim#buffers(<q-args>, {'options': ['--info=inline', '-i', '--preview', '~/.config/nvim/preview.sh {}']}, <bang>0)
command! -bang -nargs=? -complete=dir Ag call fzf#vim#ag(<q-args>, '--path-to-ignore ~/.ignore --hidden --column --numbers --noheading --color --smart-case -i --ignore-dir node_modules ' , <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case  '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

function! RipgrepFzfCurrentDir(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case --no-require-git -- %s -f %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query), expand('%:p:h'))
  let reload_command = printf(command_fmt, '{q}', expand('%:p:h'))
  let spec = {'options': ['--disabled', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  let spec = fzf#vim#with_preview(spec, 'hidden,right,50%,<70(up,40%)', 'ctrl-/')
  call fzf#vim#grep(initial_command, 1, spec, a:fullscreen)
endfunction

function! RipgrepFzfCurrentFile(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case --no-require-git -- %s -f %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query), expand('%:p'))
  let reload_command = printf(command_fmt, '{q}', expand('%:p'))
  let spec = {'options': ['--disabled', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  let spec = fzf#vim#with_preview(spec, 'hidden,right,50%,<70(up,40%)', 'ctrl-/')
  call fzf#vim#grep(initial_command, 1, spec, a:fullscreen)
endfunction

command! -nargs=* -bang GG call RipgrepFzfCurrentDir(<q-args>, <bang>0)
command! -nargs=* -bang SS call RipgrepFzfCurrentFile(<q-args>, <bang>0)

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

