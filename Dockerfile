FROM golang:alpine

RUN apk update
# Basic tools
RUN apk add bash git curl neovim neovim-doc ctags
# Necessary for running CoC plugin
RUN apk add nodejs
# Necessary for running vim-go
RUN apk add gcc musl-dev
# Necessary for fzf Ag functionality
RUN apk add the_silver_searcher

RUN adduser -S -h /home/neovim -D neovim -G root -u 1000
WORKDIR /home/neovim
USER neovim

ADD . .vim

RUN mkdir -p .config/nvim
RUN ln -s $HOME/.vim/vimrc $HOME/.config/nvim/init.vim

ENTRYPOINT ["/bin/sh", "-c"]
CMD ["/home/neovim/.vim/install.sh; clear; /bin/bash"]
