" let g:kite_supported_languages = ['python', 'go']

au BufNewFile,BufRead *.ejs set filetype=html

let g:node_host_prog = '/usr/local/bin/neovim-node-host'

" Python highlight
" https://github.com/vim-python/python-syntax
let g:python_highlight_all = 1
let g:python_highlight_space_errors = 0
let g:deoplete#disable_auto_complete = 1

" python interperter
" autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
" autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
" autocmd filetype cpp nnoremap <F11> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>

" CPP compiler
" autocmd BufNewFile *.cpp execute "0r ~/.vim/template/".input("Template name: ").".cpp"
" map <F9> :!g++ -g % -o %:r && ./%:r <CR>
" map <F5> :!g++ -g % -o %:r <CR>
" map <F2> :w <CR>
" map <F12> :!gdb ./%:r <CR>

" Background
function! g:Base16hi(group, guibg)
  if a:guibg != ""
    exec "hi " . a:group . " guibg=#" . a:guibg
  endif
endfunction
fun <sid>hi(group, guibg)
  call g:Base16hi(a:group,a:guibg)
endfun
let s:gui00 = "171717"
call <sid>hi("Normal",s:gui00)



