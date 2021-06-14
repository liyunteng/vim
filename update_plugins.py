try:
    import concurrent.futures as futures
except ImportError:
    try:
        import futures
    except ImportError:
        futures = None

import zipfile
import shutil
import tempfile
import requests

from os import path

# --- Globals ----------------------------------------------
PLUGINS = """
auto-pairs https://hub.fastgit.org/jiangmiao/auto-pairs
ale https://hub.fastgit.org/w0rp/ale
vim-yankstack https://hub.fastgit.org/maxbrunsfeld/vim-yankstack
ack.vim https://hub.fastgit.org/mileszs/ack.vim
bufexplorer https://hub.fastgit.org/jlanzarotta/bufexplorer
ctrlp.vim https://hub.fastgit.org/ctrlpvim/ctrlp.vim
mayansmoke https://hub.fastgit.org/vim-scripts/mayansmoke
nerdtree https://hub.fastgit.org/scrooloose/nerdtree
nginx.vim https://hub.fastgit.org/chr4/nginx.vim
open_file_under_cursor.vim https://hub.fastgit.org/amix/open_file_under_cursor.vim
tlib https://hub.fastgit.org/vim-scripts/tlib
vim-addon-mw-utils https://hub.fastgit.org/MarcWeber/vim-addon-mw-utils
vim-bundle-mako https://hub.fastgit.org/sophacles/vim-bundle-mako
vim-coffee-script https://hub.fastgit.org/kchmck/vim-coffee-script
vim-colors-solarized https://hub.fastgit.org/altercation/vim-colors-solarized
vim-indent-object https://hub.fastgit.org/michaeljsmith/vim-indent-object
vim-less https://hub.fastgit.org/groenewege/vim-less
vim-pyte https://hub.fastgit.org/therubymug/vim-pyte
vim-snippets https://hub.fastgit.org/honza/vim-snippets
vim-surround https://hub.fastgit.org/tpope/vim-surround
vim-expand-region https://hub.fastgit.org/terryma/vim-expand-region
vim-multiple-cursors https://hub.fastgit.org/terryma/vim-multiple-cursors
vim-fugitive https://hub.fastgit.org/tpope/vim-fugitive
goyo.vim https://hub.fastgit.org/junegunn/goyo.vim
vim-zenroom2 https://hub.fastgit.org/amix/vim-zenroom2
vim-repeat https://hub.fastgit.org/tpope/vim-repeat
vim-commentary https://hub.fastgit.org/tpope/vim-commentary
vim-gitgutter https://hub.fastgit.org/airblade/vim-gitgutter
gruvbox https://hub.fastgit.org/morhetz/gruvbox
vim-flake8 https://hub.fastgit.org/nvie/vim-flake8
vim-pug https://hub.fastgit.org/digitaltoad/vim-pug
lightline.vim https://hub.fastgit.org/itchyny/lightline.vim
lightline-ale https://hub.fastgit.org/maximbaz/lightline-ale
vim-abolish https://hub.fastgit.org/tpope/tpope-vim-abolish
rust.vim https://hub.fastgit.org/rust-lang/rust.vim
vim-markdown https://hub.fastgit.org/plasticboy/vim-markdown
vim-gist https://hub.fastgit.org/mattn/vim-gist
vim-ruby https://hub.fastgit.org/vim-ruby/vim-ruby
typescript-vim https://hub.fastgit.org/leafgarland/typescript-vim
vim-javascript https://hub.fastgit.org/pangloss/vim-javascript
vim-python-pep8-indent https://hub.fastgit.org/Vimjas/vim-python-pep8-indent
mru.vim https://hub.fastgit.org/vim-scripts/mru.vim
vim-markdown https://hub.fastgit.org/tpope/vim-markdown
YankRing.vim https://hub.fastgit.org/vim-scripts/YankRing.vim
editorconfig-vim https://hub.fastgit.org/editorconfig/editorconfig-vim
""".strip()

# vim-snipmate https://hub.fastgit.org/garbas/vim-snipmate
# snipmate-snippets https://hub.fastgit.org/scrooloose/snipmate-snippets
# vim-go https://hub.fastgit.org/fatih/vim-go

GITHUB_ZIP = "%s/archive/master.zip"

SOURCE_DIR = path.join(path.dirname(__file__), "sources_non_forked")


def download_extract_replace(plugin_name, zip_path, temp_dir, source_dir):
    temp_zip_path = path.join(temp_dir, plugin_name)

    # Download and extract file in temp dir
    req = requests.get(zip_path)
    open(temp_zip_path, "wb").write(req.content)

    zip_f = zipfile.ZipFile(temp_zip_path)
    zip_f.extractall(temp_dir)

    plugin_temp_path = path.join(
        temp_dir, path.join(temp_dir, "%s-master" % plugin_name)
    )

    # Remove the current plugin and replace it with the extracted
    plugin_dest_path = path.join(source_dir, plugin_name)

    try:
        shutil.rmtree(plugin_dest_path)
    except OSError:
        pass

    shutil.move(plugin_temp_path, plugin_dest_path)
    print("Updated {0}".format(plugin_name))


def update(plugin):
    name, github_url = plugin.split(" ")
    zip_path = GITHUB_ZIP % github_url
    download_extract_replace(name, zip_path, temp_directory, SOURCE_DIR)


if __name__ == "__main__":
    temp_directory = tempfile.mkdtemp()

    try:
        if futures:
            with futures.ThreadPoolExecutor(16) as executor:
                executor.map(update, PLUGINS.splitlines())
        else:
            [update(x) for x in PLUGINS.splitlines()]
    finally:
        shutil.rmtree(temp_directory)
