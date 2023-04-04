#!/bin/bash
_log "Asdf setup"

if [ ! -d "$HOME/.asdf" ]; then
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.3
    _log "Asdf installed"
fi

if [ ! -d "$HOME/.asdf/installs/nodejs" ]; then
    asdf plugin add nodejs && \
    asdf install nodejs 16.17.0 && \
    asdf global nodejs 16.17.0 && \
    npm i -g eslint vscode-langservers-extracted typescript typescript-language-server && \
    _log "Nodejs plugin added"
fi

if [ ! -d "$HOME/.asdf/installs/python" ]; then
    asdf plugin add python && \
    asdf install python 3.10.7 && \
    asdf global python 3.10.7 && \
    asdf reshim && \
    pip install neovim && \
    pip install black && \
    pip install psycopg2-binary && \    
    pip install pyright
    _log "Python plugin added"
fi

if [ ! -d "$HOME/.asdf/installs/golang" ]; then
    asdf plugin-add golang https://github.com/kennyp/asdf-golang.git && \
    asdf install golang 1.19 && \
    asdf global golang 1.19 && \
    asdf reshim && \
    go install golang.org/x/tools/gopls@latest
    _log "Golang plugin added"
fi

if [ ! -d "$HOME/.asdf/installs/dotnet-core" ]; then
    asdf plugin-add dotnet-core https://github.com/emersonsoares/asdf-dotnet-core.git && \    
    asdf install dotnet-core 3.1.426 && \
    asdf install dotnet-core 6.0.407 && \
    asdf global dotnet-core 3.1.426 && \
    asdf reshim && \    
    _log "Dotnet plugin added"
fi

asdf reshim

_log "Asdf finished"
