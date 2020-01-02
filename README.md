# Usage

## Clone

    git clone git@github.com:harryxu/vimfiles.git ~/.vim

## Prepare for neovim

```shell
# install python3 for mac
brew install python3

ln -s ~/.vim/vimrc ~/.config/nvim/init.vim
pip3 install neovim
```


Open vim or neovim, if VimPlug not auto install, run `:PlugInstall`.

## deoplete.nvim truble


You need update neovim-python module.

	pip3 install --upgrade neovim

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


