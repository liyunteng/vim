" line num
"set nu

" term
if has("terminfo")
set term=$TERM
endif

" timeoutlen
set timeoutlen=1000

" encoding
set fileencodings=ucs-bom,utf-8,gb2312,gb18030,gbk,big5,cp936,iso-8859-2,utf-16,latin1
set enc=utf8

" viminfo file
" set viminfo^=%
if has("nvim")
set viminfo='50,<1000,s100,:0,n~/.vim_runtime/cache/nviminfo
else
set viminfo='50,<1000,s100,:0,n~/.vim_runtime/cache/viminfo
endif

" fold
" set foldenable
" set foldcolumn=2
" set foldmethod=indent
" set foldopen=all
" set foldclose=all
set foldlevel=2
set foldmethod=syntax
set nofoldenable

" scrolloff
set scrolloff=1

" don't hid
set nohidden

" don't auto add comment beginning
" set paste

" Colorscheme
set background=dark
colorscheme peaksea

" if has("gui_running") || has("nvim")
" colorscheme gruvbox
" endif

" line highlight
" hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
if has("gui_running")  || has("nvim")
    hi CursorLine term=NONE cterm=NONE ctermbg=239 gui=NONE guifg=NONE guibg=#333333
else
    hi CursorLine term=NONE cterm=NONE ctermbg=239
endif
set cursorline

" reload
map <silent> <leader>r :source ~/.vimrc<cr>

" tab
nmap <silent> <leader>td :tabclose<cr>
nmap <silent> <leader>tt :exe "tabn ".g:lasttab<cr>
au TabLeave * let g:lasttab = tabpagenr()

" NERDTree
map <silent> <leader>nd :NERDTreeCWD<cr>

" YankRing
if has("win16") || has("win32")
    " Don't do anything
else
    let g:yankring_history_dir = '~/.vim_runtime/cache/'
endif
noremap <silent> <leader>y :YRGetElem<cr>

" gitgutter
let g:gitgutter_enabled=0
let g:gitgutter_map_keys=0
let g:gitgutter_highlight_lines=1
let g:gitgutter_set_sign_backgrounds=1
let g:gitgutter_show_msg_on_hunk_jumping=1
autocmd BufWritePost * GitGutter
nnoremap <silent> <leader>dt :GitGutterToggle<cr>
nnoremap <silent> <leader>dp :GitGutterPrevHunk<cr>
nnoremap <silent> <leader>d[ :GitGutterPrevHunk<cr>
nnoremap <silent> <leader>dn :GitGutterNextHunk<cr>

nnoremap <silent> <leader>d] :GitGutterNextHunk<cr>
nnoremap <silent> <leader>du :GitGutterUndoHunk<cr>
nnoremap <silent> <leader>ds :GitGutterStageHunk<cr>
nnoremap <silent> <leader>dh :GitGutterLineHighlightsToggle<cr>

" ale
nnoremap <silent> <leader>d :ALEGoToDefinition<cr>
nnoremap <silent> <leader>u :ALEHover<cr>

" MRU
let g:MRU_File=$HOME . '/.vim_runtime/cache/mru'
map <silent> <leader>f :MRU<CR>

" CTRL-P
let g:ctrlp_map = '<c-p>'
map <leader>b <Nop>
" map <leader>b :CtrlPBuffer<cr>

" PageUp PageDown
map <C-f> <PageDown>
map <C-b> <PageUp>

" split window
set splitright
set splitbelow
set switchbuf=vsplit
nmap <silent> <leader>\ :vsp<cr>
nmap <silent> <leader>- :sp<cr>

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

" Commentry format
set commentstring=#%s
au FileType cpp set commentstring=//%s
au FileType c set commentstring=//%s

" 设置使用的ctags
set tags=${MY_KERNEL}/tags,/usr/include/tags,${ADDX_ROOT}/tags,/Users/lyt/git/webrtc-source/webrtc/src/tags


" Coc
if has('patch-8.0.1453')
    if !has('patch-8.1.1719')
        let g:coc_disable_startup_warning = 1
    endif
    source ~/.vim_runtime/my_coc.vim
endif

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

" clipboard
let g:clipboard = {
          \   'name': 'myClipboard',
          \   'copy': {
          \      '+': {lines, regtype -> extend(g:, {'foo': [lines, regtype]}) },
          \      '*': {lines, regtype -> extend(g:, {'foo': [lines, regtype]}) },
          \    },
          \   'paste': {
          \      '+': {-> get(g:, 'foo', [])},
          \      '*': {-> get(g:, 'foo', [])},
          \   },
          \ }


" call lightline#init()
