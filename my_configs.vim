" line num
"set nu

" encoding
set fileencodings=utf-8,utf-16,gb2312,gb18030,gbk,big5,ucs-bom,cp936,latin1
set enc=utf8

" viminfo file
set viminfo^=%

" fold
" set foldenable
" set foldcolumn=2
" set foldmethod=indent
" set foldopen=all
" set foldclose=all
set nofoldenable
set foldlevel=2
set foldmethod=syntax

" scrolloff
set scrolloff=1

" don't hid
set nohidden

" line highlight
" hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
" hi CursorColumn cterm=NONE ctermbg=blue ctermfg=white guibg=darkred guifg=white
" hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white
hi CursorLine   cterm=NONE ctermbg=23
set cursorline

" don't auto add comment beginning
" set paste
augroup Format-Options
    autocmd!
    autocmd BufEnter * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

    " This can be done as well instead of the previous line, for setting formatoptions as you choose:
    autocmd BufEnter * setlocal formatoptions=crqn2l1j
augroup END


" Split window
nmap <leader>\ :vsp<cr>
nmap <leader>- :sp<cr>

" tab
nmap <leader>td :tabclose<cr>
nmap <leader>tt :exe "tabn ".g:lasttab<cr>
au TabLeave * let g:lasttab = tabpagenr()

" NERDTree
map <leader>nd :NERDTreeCWD<cr>

" YankRing
if has("win16") || has("win32")
    " Don't do anything
else
    let g:yankring_history_dir = '~/.vim_runtime/temp_dirs/'
endif
noremap <leader>y :YRGetElem<cr>

" gitgutter
nnoremap <silent> <leader>dn :GitGutterNextHunk<cr>
nnoremap <silent> <leader>dp :GitGutterPrevHunk<cr>
nnoremap <silent> <leader>du :GitGutterUndoHunk<cr>

" CRTL-P
let g:ctrlp_map = '<c-p>'
map <c-b> :CtrlPBuffer<cr>
unmap <C-B>
" map <leader>b :CtrlPBuffer<cr>

" don't use $ for insert pair
" vunmap $1 
vunmap $2
vunmap $3
vunmap $$
vunmap $q
" vunmap $e 

iunmap $1
iunmap $2
iunmap $3
iunmap $4
iunmap $q
iunmap $e

" 设置使用的ctags
set tags=${MY_KERNEL}/tags,/usr/include/tags


" F5编译和运行C程序，F6编译和运行C++程序
" 请注意，下述代码在windows下使用会报错
" 需要去掉./这两个字符
" C的编译和运行
"map <F5> :call CompileRunGcc()<CR>
" func! CompileRunGcc()
"         exec "w"
"         exec "!gcc % -o %<"
"         exec "! ./%<"
" endfunc
" C++的编译和运行
"map <F6> :call CompileRunGpp()<CR>
"func! CompileRunGpp()
"        exec "w"
"        exec "!g++ % -o %<"
"        exec "! ./%<"
"endfunc
""python 的运行
"map <F9> :call PythonRun()<CR>
"func! PythonRun()
"        exec "w"
"        exec "!python %"
"endfunc
"
