"NERDTree
map <C-b> :NERDTreeToggle<CR>
map <C-i> :NERDTreeFind<CR>
let g:NERDTreePatternMatchHighlightFullName = 1 
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', 'node_modules', '.DS_Store']
let g:NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"typescript
let g:typescript_indent_disable = 1
"Theme 
syntax enable
set background=dark
highlight Normal ctermbg=None
colorscheme onedark
set termguicolors
"airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" AUTO CLOSE TAGS
let g:closetag_filenames = '*.html,*.jsx,*.tsx,*.js,*.vue,*.ejs,*.jsp'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js,*.vue,*.ejs,*.jsp'
let g:closetag_filetypes = 'html,js,xhtml,phtml,jsx,tsx,vue,ejs,jsp'
let g:closetag_xhtml_filetypes = 'xhtml,jsx,tsx,js,vue,jsp'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'

"FONT
let g:enable_italic_font = 1
let g:enable_bold_font = 1
"CLOSE BUFFER
let bclose_multiple = 0

"Emmet
let g:user_emmet_leader_key='<C-Z>'
let g:jsx_ext_required = 1
let g:jsx_pragma_required = 1
"ALE
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let b:ale_fixers=[]
let b:ale_linters=[]
let b:ale_linter_aliases=[]
" ======= Snippet =========
let g:UltiSnipsExpandTrigger="<c-c>"
let g:UltiSnipsJumpForwardTrigger="<c-c>"
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:UltiSnipsJumpBackwardTrigger="<c-c>"
" Use <C-l> for trigger snippet expand.
"=============end snippet==============
" Easymotion
let g:EasyMotion_smartcase = 1

"auto save
let g:auto_save = 0
let g:auto_save_events = ["InsertLeave", "TextChanged"]
"====== COC-NVIM ======
let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-json', 'coc-html', 'coc-ember']
set updatetime=300
set shortmess+=c
set signcolumn=yes

function! s:show_documentation()
  if (index(['nvim','help'], &filetype) >= 0)
    xecute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
"===== end of Coc-nvim======
"leaderF
let g:Lf_ShortcutF = '<C-P>'
let g:Lf_PreviewInPopup = 1
"ctrslf
let g:ctrlsf_default_view_mode = 'compact'

" Nerd-Commenter
set timeout timeoutlen=1500
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1
let g:NERDCustomDelimiters = { 'javascript.jsx': { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' } }

"Syntastic
set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" set statusline+=%{FugitiveStatusline()}
" set statusline=%<%f\ %h%m%r%{kite#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2  " always display the status line

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers = ['pylint']

"Highlight nerdtree
let g:NERDTreeHighlightFolders = 1 "
let g:NERDTreeHighlightFoldersFullName = 1
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['css'] = s:blue " sets the color of css files to blue

let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files

let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets the color for files ending with _spec.rb
let g:NERDTreePatternMatchHighlightColor['.*.ejs$'] = s:aqua " sets the color for files ending with _spec.rb

let g:NERDTreeExtensionHighlightColor = {} "this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['css'] = '' "assigning it to an empty string will skip highlight
let g:NERDTreeLimitedSyntax = 1
let g:NERDTreeSyntaxEnabledExtensions = ['hbs', 'lhs'] " enable highlight to .hbs and .lhs files with default colors

"***PYTHON SETUP***
let g:indentLine_enabled = 0

" Review window on search
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']
let g:fzf_preview_window = []

" Floating Window
let g:floaterm_keymap_new    = '<F12>'
let g:floaterm_keymap_kill = '<F11>'
let g:floaterm_width = 0.8
let g:floaterm_height = 0.8
let g:floaterm_wintitle = 0
let g:floaterm_position = 'topright'
let g:floaterm_autoclose = 0
nnoremap <leader>= :FloatermNew g++ --std=c++17 -o name main.cpp; ./name<CR>
nnoremap g= :FloatermNew go run main.go<CR>

" Any Jump
let g:any_jump_search_prefered_engine = 'ag'
let g:any_jump_ignored_files = ['*.tmp', '*.temp', '*.', 'node_modules', 'android', 'ios']
let g:any_jump_colors = {
      \"plain_text":         "Comment",
      \"preview":            "Comment",
      \"preview_keyword":    "Operator",
      \"heading_text":       "Function",
      \"heading_keyword":    "Identifier",
      \"group_text":         "Comment",
      \"group_name":         "Function",
      \"more_button":        "Operator",
      \"more_explain":       "Comment",
      \"result_line_number": "Comment",
      \"result_text":        "Statement",
      \"result_path":        "String",
      \"help":               "Comment"
      \}

" Barbar Tab Buffer
noremap <silent><leader>1 :BufferGoto 1<CR>
noremap <silent><leader>2 :BufferGoto 2<CR>
noremap <silent><leader>3 :BufferGoto 3<CR>
noremap <silent><leader>4 :BufferGoto 4<CR>
noremap <silent><leader>5 :BufferGoto 5<CR>
noremap <silent><leader>6 :BufferGoto 6<CR>
noremap <silent><leader>7 :BufferGoto 7<CR>
noremap <silent><leader>8 :BufferGoto 8<CR>
noremap <silent><leader>9 :BufferGoto 9<CR>
noremap <silent><leader>w :BufferClose<CR>
noremap <silent><leader>< :BufferMovePrevious<CR>
noremap <silent><leader>> :BufferMoveNext<CR>
noremap <silent><leader>. :BufferPrevious<CR>
noremap <silent><leader>/ :BufferNext<CR>

" Commentary
noremap <silent><leader>cc :TComment<CR>
noremap <silent><leader>ci :TComment<CR>
noremap <silent><leader>cb :TCommentBlock<CR>
noremap <silent><leader>cf :TCommentAs <c-r>=&ft<CR>

" Undo Tree
noremap <silent><leader>t :UndotreeToggle<CR>

"ALE
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let b:ale_fixers=[]
let b:ale_linters=[]
let b:ale_linter_aliases=[]
let g:ale_linters_explicit = 1

" Scroll Bar
augroup ScrollbarInit
  autocmd!
  autocmd CursorMoved,VimResized,QuitPre * silent! lua require('scrollbar').show()
  autocmd WinEnter,FocusGained           * silent! lua require('scrollbar').show()
  autocmd WinLeave,BufLeave,BufWinLeave,FocusLost            * silent! lua require('scrollbar').clear()
augroup end







