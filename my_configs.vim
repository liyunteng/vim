" line num
"set nu

" encoding
set fileencodings=ucs-bom,utf-8,gb2312,gb18030,gbk,big5,cp936,iso-8859-2,utf-16,latin1
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

" don't auto add comment beginning
" set paste

" Colorscheme
set background=dark
colorscheme peaksea

" if has("gui_running")
" colorscheme gruvbox
" endif

" line highlight
" hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
if has("gui_running")
    hi CursorLine   term=NONE cterm=NONE ctermbg=239 gui=NONE guifg=NONE guibg=#333333
else
    hi CursorLine   term=NONE cterm=NONE ctermbg=239
endif
set cursorline

" reload
map <leader>r :source ~/.vimrc<cr>

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

" MRU
map <leader>f :MRU<CR>

" CTRL-P
let g:ctrlp_map = '<c-p>'
map <leader>b <Nop>
" map <leader>b :CtrlPBuffer<cr>

" PageUp PageDown
map <C-f> <PageDown>
map <C-b> <PageUp>

" split window
nmap <leader>\ :vsp<cr>
nmap <leader>- :sp<cr>

" don't use $ for insert pair
vnoremap $1 $1
vnoremap $2 $2
vnoremap $3 $3
vnoremap $$ $$
vnoremap $q $q
vnoremap $e $e

inoremap $1 $1
inoremap $2 $2
inoremap $3 $3
inoremap $4 $4
inoremap $q $q
inoremap $e $e



augroup Format-Options
    autocmd!
    autocmd BufEnter * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

    " This can be done as well instead of the previous line, for setting formatoptions as you choose:
    autocmd BufEnter * setlocal formatoptions=crqn2l1j
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ]]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*FugitiveHead")?FugitiveHead():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*FugitiveHead") && ""!=FugitiveHead())'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': '|' }
      \ }

" Commentry format
set commentstring=#%s
au FileType cpp set commentstring=//%s
au FileType c set commentstring=//%s

" 设置使用的ctags
set tags=${MY_KERNEL}/tags,/usr/include/tags,/data1/liyunteng/g1_sys/tags,/data1/liyunteng/b0_sys/tags,/Users/lyt/git/webrtc-source/webrtc/src/tags

