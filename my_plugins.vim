" hub.fastgit.org
call plug#begin('~/.vim_runtime/plugins')
Plug 'https://github.com/jiangmiao/auto-pairs'
Plug 'https://github.com/jlanzarotta/bufexplorer'
Plug 'https://github.com/scrooloose/nerdtree'
Plug 'https://github.com/chr4/nginx.vim'
Plug 'https://github.com/amix/open_file_under_cursor.vim'
Plug 'https://github.com/altercation/vim-colors-solarized'
Plug 'https://github.com/michaeljsmith/vim-indent-object'
Plug 'https://github.com/honza/vim-snippets'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/terryma/vim-expand-region'
Plug 'https://github.com/terryma/vim-multiple-cursors'
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/junegunn/goyo.vim'
Plug 'https://github.com/amix/vim-zenroom2'
Plug 'https://github.com/tpope/vim-repeat'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/airblade/vim-gitgutter'
Plug 'https://github.com/morhetz/gruvbox'
Plug 'https://github.com/nvie/vim-flake8'
Plug 'https://github.com/digitaltoad/vim-pug'
Plug 'https://github.com/itchyny/lightline.vim'
Plug 'https://github.com/tpope/tpope-vim-abolish'
Plug 'https://github.com/rust-lang/rust.vim'
Plug 'https://github.com/mattn/vim-gist'
Plug 'https://github.com/vim-ruby/vim-ruby'
Plug 'https://github.com/leafgarland/typescript-vim'
Plug 'https://github.com/pangloss/vim-javascript'
Plug 'https://github.com/Vimjas/vim-python-pep8-indent'
Plug 'https://github.com/vim-scripts/mru.vim'
Plug 'https://github.com/tpope/vim-markdown'
Plug 'https://github.com/vim-scripts/YankRing.vim'
Plug 'https://github.com/editorconfig/editorconfig-vim'

" Plug 'https://github.com/w0rp/ale'
" Plug 'https://github.com/maximbaz/lightline-ale'
" Plug 'https://github.com/mileszs/ack.vim'
" Plug 'https://github.com/ctrlpvim/ctrlp.vim'
" Plug 'https://github.com/vim-scripts/mayansmoke'
" Plug 'https://github.com/vim-scripts/tlib'
" Plug 'https://github.com/MarcWeber/vim-addon-mw-utils'
" Plug 'https://github.com/sophacles/vim-bundle-mako'
" Plug 'https://github.com/kchmck/vim-coffee-script'
" Plug 'https://github.com/plasticboy/vim-markdown'
" Plug 'https://github.com/maxbrunsfeld/vim-yankstack'
" Plug 'https://github.com/groenewege/vim-less'
" Plug 'https://github.com/therubymug/vim-pyte'

Plug 'https://github.com/neoclide/coc.nvim', {'branch': 'release'}
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
