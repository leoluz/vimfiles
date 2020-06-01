FROM golang:alpine

RUN apk update && \
    apk add git openssh curl neovim neovim-doc

RUN adduser -S -h /neovim -D neovim -G root -u 1000
WORKDIR /neovim
USER neovim

RUN git clone https://github.com/leoluz/vimfiles.git .vim
RUN mkdir -p .config/nvim
RUN ln -s $HOME/.vim/vimrc $HOME/.config/nvim/init.vim

CMD ["/bin/sh"]
