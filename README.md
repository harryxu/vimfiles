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

## Install dein.vim

```shell
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.vim/bundle
```

Open vim or neovim, run `:call dein#install()`

## GO completion

    :GoInstallBinaries 

### Set GOPATH

Put flow lines to `.zshrc` or `.bashrc`.

    # GOPATH
    if hash go 2>/dev/null; then
        export PATH=$PATH:$(go env GOPATH)/bin
        export GOPATH=$(go env GOPATH)
    fi


