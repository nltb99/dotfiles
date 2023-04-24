function! ClipboardYank()
    call system('pbcopy',@@)
endfunction

function! ClipboardPaste()
    let @@=system('pbpaste')
endfunction

" Undo
function! <SID>ForgetUndo()
    let old_undolevels = &undolevels
    set undolevels=-1
    exe "normal a \<BS>\<Esc>"
    let &undolevels = old_undolevels
    unlet old_undolevels
endfunction
command -nargs=0 CU call <SID>ForgetUndo()

" Ag Current File
function! s:ag_to_qfC(line)
  let parts = split(a:line, ':')
  return {'filename': expand('%'), 'lnum': parts[0], 'col': parts[1],
        \ 'text': join(parts[3:], ':')}
endfunction

function! s:ag_handlerC(lines)
  if len(a:lines) < 2 | return | endif

  let cmd = get({'ctrl-x': 'split',
               \ 'ctrl-v': 'vertical split',
               \ 'ctrl-t': 'tabe'}, a:lines[0], 'e')
  let list = map(a:lines[1:], 's:ag_to_qfC(v:val)')

  let first = list[0]
  execute cmd escape(first.filename, ' %#\')
  execute first.lnum
  execute 'normal!' first.col.'|zz'

  if len(list) > 1
    call setqflist(list)
    copen
    wincmd p
  endif
endfunction
command! -nargs=* Agc call fzf#run({
\ 'source':  printf('ag --nogroup --depth 0 --color -G "%s" "%s" "%s"',
\                   expand('%:t'),
\                   escape(empty(<q-args>) ? '^(?=.)' : <q-args>, '"\'),
\                   expand('%:p')),
\ 'sink*':    function('<sid>ag_handlerC'),
\ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x --delimiter : --nth 4.. '.
\            '--multi --bind=alt-a:select-all,alt-d:deselect-all '.
\             '--prompt "Agc> "',
\ 'down':    '~30%'
\ })

" Undo Tree
" if has("persistent_undo")
"    let target_path = expand('~/.undodir')
"
"     " create the directory and any parent directories
"     " if the location does not exist.
"     if !isdirectory(target_path)
"         call mkdir(target_path, "p", 0700)
"     endif
"
"     let &undodir=target_path
"     set undofile
" endif

" Clipboard
" let g:clipboard = {"name": "void", "copy": {}, "paste": {}}
" let g:clipboard.copy["+"] = {-> v:true}
" let g:clipboard.paste["+"] = {-> []}
" let g:clipboard.copy["*"] = g:clipboard.copy["+"]
" let g:clipboard.paste["*"] = g:clipboard.paste["+"]

" Typescript config
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

nnoremap <silent> K :call CocAction('doHover')<CR>

function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#float#has_float() == 0 && CocHasProvider('hover') == 1)
    silent call CocActionAsync('doHover')
  endif
endfunction

function! s:show_hover_doc()
  call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>

nmap <leader>do <Plug>(coc-codeaction)
