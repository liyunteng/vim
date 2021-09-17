call plug#begin('~/.vim_runtime/plugins')
Plug 'jiangmiao/auto-pairs'
Plug 'jlanzarotta/bufexplorer'
Plug 'scrooloose/nerdtree'
Plug 'chr4/nginx.vim'
Plug 'amix/open_file_under_cursor.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'michaeljsmith/vim-indent-object'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-expand-region'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/goyo.vim'
Plug 'amix/vim-zenroom2'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'airblade/vim-gitgutter'
Plug 'morhetz/gruvbox'
Plug 'nvie/vim-flake8'
Plug 'digitaltoad/vim-pug'
Plug 'itchyny/lightline.vim'
Plug 'tpope/tpope-vim-abolish'
Plug 'rust-lang/rust.vim'
Plug 'mattn/vim-gist'
Plug 'vim-ruby/vim-ruby'
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'vim-scripts/mru.vim'
Plug 'tpope/vim-markdown'
Plug 'vim-scripts/YankRing.vim'
Plug 'editorconfig/editorconfig-vim'

" Plug 'w0rp/ale'
" Plug 'maximbaz/lightline-ale'
" Plug 'mileszs/ack.vim'
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'vim-scripts/mayansmoke'
" Plug 'vim-scripts/tlib'
" Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'sophacles/vim-bundle-mako'
" Plug 'kchmck/vim-coffee-script'
" Plug 'plasticboy/vim-markdown'
" Plug 'maxbrunsfeld/vim-yankstack'
" Plug 'groenewege/vim-less'
" Plug 'therubymug/vim-pyte'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

if has('patch-8.0.1453')
    if !has('patch-8.1.1719')
        let g:coc_disable_startup_warning = 1
    endif
    source /Users/lyt/.vim_runtime/my_coc.vim
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

" call lightline#init()
