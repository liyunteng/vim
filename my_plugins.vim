" http://git.what996.com

call plug#begin('~/.vim_runtime/my_plugins')
Plug 'https://github.com/jiangmiao/auto-pairs'
Plug 'https://github.com/jlanzarotta/bufexplorer'
Plug 'https://github.com/scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'https://github.com/chr4/nginx.vim'
Plug 'https://github.com/amix/open_file_under_cursor.vim'
Plug 'https://github.com/altercation/vim-colors-solarized'
Plug 'https://github.com/michaeljsmith/vim-indent-object'
Plug 'https://github.com/honza/vim-snippets'
Plug 'https://github.com/garbas/vim-snipmate'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/terryma/vim-expand-region'
Plug 'https://github.com/terryma/vim-multiple-cursors'
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/tpope/vim-rhubarb'
Plug 'https://github.com/junegunn/goyo.vim'
Plug 'https://github.com/amix/vim-zenroom2'
Plug 'https://github.com/tpope/vim-repeat'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/airblade/vim-gitgutter'
Plug 'https://github.com/morhetz/gruvbox'
Plug 'https://github.com/nvie/vim-flake8'
Plug 'https://github.com/digitaltoad/vim-pug'
Plug 'https://github.com/itchyny/lightline.vim'
Plug 'https://github.com/tpope/tpope-vim-abolish', {'as': 'vim-abolish'}
Plug 'https://github.com/rust-lang/rust.vim'
Plug 'https://github.com/mattn/vim-gist'
Plug 'https://github.com/vim-ruby/vim-ruby'
Plug 'https://github.com/leafgarland/typescript-vim'
Plug 'https://github.com/pangloss/vim-javascript'
Plug 'https://github.com/Vimjas/vim-python-pep8-indent'
Plug 'https://github.com/nathanaelkane/vim-indent-guides'
Plug 'https://github.com/vim-scripts/mru.vim'
Plug 'https://github.com/plasticboy/vim-markdown'
Plug 'https://github.com/vim-scripts/YankRing.vim'
Plug 'https://github.com/editorconfig/editorconfig-vim'
Plug 'https://github.com/dracula/vim', {'as': 'dracula'}

Plug 'https://github.com/dense-analysis/ale'
Plug 'https://github.com/maximbaz/lightline-ale'
Plug 'https://github.com/mileszs/ack.vim'
Plug 'https://github.com/vim-scripts/mayansmoke'
Plug 'https://github.com/MarcWeber/vim-addon-mw-utils'
Plug 'https://github.com/sophacles/vim-bundle-mako'
Plug 'https://github.com/kchmck/vim-coffee-script'
Plug 'https://github.com/maxbrunsfeld/vim-yankstack'
Plug 'https://github.com/groenewege/vim-less'
Plug 'https://github.com/therubymug/vim-pyte'
Plug 'https://github.com/tomtom/tlib_vim', {'as': 'tlib'}

" Plug 'https://github.com/neoclide/coc.nvim', {'branch': 'release'}
if has('patch-8.0.1453') || has('nvim')
" Plug 'https://github.com/neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'https://github.com/neoclide/coc.nvim', {'branch': 'release'}
endif

" Plug 'https://github.com/ctrlpvim/ctrlp.vim'
" Plug 'https://github.com/plasticboy/vim-markdown'
call plug#end()


" :PlugInstall
