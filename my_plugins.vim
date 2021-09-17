call plug#begin('~/.vim_runtime/plugins')
Plug 'https://hub.fastgit.org/jiangmiao/auto-pairs'
Plug 'https://hub.fastgit.org/jlanzarotta/bufexplorer'
Plug 'https://hub.fastgit.org/scrooloose/nerdtree'
Plug 'https://hub.fastgit.org/chr4/nginx.vim'
Plug 'https://hub.fastgit.org/amix/open_file_under_cursor.vim'
Plug 'https://hub.fastgit.org/altercation/vim-colors-solarized'
Plug 'https://hub.fastgit.org/michaeljsmith/vim-indent-object'
Plug 'https://hub.fastgit.org/honza/vim-snippets'
Plug 'https://hub.fastgit.org/tpope/vim-surround'
Plug 'https://hub.fastgit.org/terryma/vim-expand-region'
Plug 'https://hub.fastgit.org/terryma/vim-multiple-cursors'
Plug 'https://hub.fastgit.org/tpope/vim-fugitive'
Plug 'https://hub.fastgit.org/junegunn/goyo.vim'
Plug 'https://hub.fastgit.org/amix/vim-zenroom2'
Plug 'https://hub.fastgit.org/tpope/vim-repeat'
Plug 'https://hub.fastgit.org/tpope/vim-commentary'
Plug 'https://hub.fastgit.org/airblade/vim-gitgutter'
Plug 'https://hub.fastgit.org/morhetz/gruvbox'
Plug 'https://hub.fastgit.org/nvie/vim-flake8'
Plug 'https://hub.fastgit.org/digitaltoad/vim-pug'
Plug 'https://hub.fastgit.org/itchyny/lightline.vim'
Plug 'https://hub.fastgit.org/tpope/tpope-vim-abolish'
Plug 'https://hub.fastgit.org/rust-lang/rust.vim'
Plug 'https://hub.fastgit.org/mattn/vim-gist'
Plug 'https://hub.fastgit.org/vim-ruby/vim-ruby'
Plug 'https://hub.fastgit.org/leafgarland/typescript-vim'
Plug 'https://hub.fastgit.org/pangloss/vim-javascript'
Plug 'https://hub.fastgit.org/Vimjas/vim-python-pep8-indent'
Plug 'https://hub.fastgit.org/vim-scripts/mru.vim'
Plug 'https://hub.fastgit.org/tpope/vim-markdown'
Plug 'https://hub.fastgit.org/vim-scripts/YankRing.vim'
Plug 'https://hub.fastgit.org/editorconfig/editorconfig-vim'

" Plug 'https://hub.fastgit.org/w0rp/ale'
" Plug 'https://hub.fastgit.org/maximbaz/lightline-ale'
" Plug 'https://hub.fastgit.org/mileszs/ack.vim'
" Plug 'https://hub.fastgit.org/ctrlpvim/ctrlp.vim'
" Plug 'https://hub.fastgit.org/vim-scripts/mayansmoke'
" Plug 'https://hub.fastgit.org/vim-scripts/tlib'
" Plug 'https://hub.fastgit.org/MarcWeber/vim-addon-mw-utils'
" Plug 'https://hub.fastgit.org/sophacles/vim-bundle-mako'
" Plug 'https://hub.fastgit.org/kchmck/vim-coffee-script'
" Plug 'https://hub.fastgit.org/plasticboy/vim-markdown'
" Plug 'https://hub.fastgit.org/maxbrunsfeld/vim-yankstack'
" Plug 'https://hub.fastgit.org/groenewege/vim-less'
" Plug 'https://hub.fastgit.org/therubymug/vim-pyte'

Plug 'https://hub.fastgit.org/neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

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

" call lightline#init()
