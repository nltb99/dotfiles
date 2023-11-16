au BufNewFile,BufRead *.ejs set filetype=html

let g:node_host_prog = '/usr/local/bin/neovim-node-host'
let g:loaded_ruby_provider = 0

" Python highlight
" https://github.com/vim-python/python-syntax
let g:python_highlight_all = 1
let g:python_highlight_space_errors = 0
let g:deoplete#disable_auto_complete = 1

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
