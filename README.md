# Usage

## Clone

    git clone git@github.com:harryxu/vimfiles.git ~/.vim

## Prepare for neovim

```shell
# install python3 for mac
brew install python3

ln -s ~/.vim/vimrc ~/.config/nvim/init.vim
pip3 install pynvim
```


Open vim or neovim, if VimPlug not auto install, run `:PlugInstall`.

## deoplete.nvim truble

### for vim8 on macos:

https://github.com/roxma/vim-hug-neovim-rpc/issues/47#issuecomment-624548838

[Error Every time I load in vim8 (not neovim)](https://github.com/roxma/vim-hug-neovim-rpc/issues/47#issuecomment-630323947) (No module named ‘neovim’)

try 

```
pip3 install --user pynvim
```

or

```
PATH="/usr/local/opt/python@3.8/bin:$PATH" pip3 install pynvim
```

If see error:

	ImportError: cannot import name 'PackOverflowError'

`pip3 uninstall msgpack` and reinstall, then open neovim run `:UpdateRemotePlugins`

## GO completion

    :GoInstallBinaries 

### Set GOPATH

Put flow lines to `.zshrc` or `.bashrc`.

    # GOPATH
    if hash go 2>/dev/null; then
        export PATH=$PATH:$(go env GOPATH)/bin
        export GOPATH=$(go env GOPATH)
    fi


