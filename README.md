# You should use a IDE!!!


## GO

### Install Gocode for autocompletion.

    go get -u github.com/nsf/gocode

### Set GOPATH

`.zshrc` or `/.bashrc`:

    # GOPATH
    if hash go 2>/dev/null; then
        export PATH=$PATH:$(go env GOPATH)/bin
        export GOPATH=$(go env GOPATH)
    fi


