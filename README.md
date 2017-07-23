# You should use a IDE!!!

## Clone

    git clone git@github.com:harryxu/vimfiles.git ~/.vim

## Prepare for neovim

    ln -s ~/.vim ./config/nvim
    pip3 install neovim

## Install dein.vim

    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
    sh ./installer.sh ~/.vim/bundle

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


