LeoLuz Vim configuration files
======================================

About
-----

This is a project to maintain my Vim configuration files.
It uses [NeoBundle](https://github.com/Shougo/neobundle.vim) approach to manage Vim plugins.

Fill free to hack around and use these files as you wish but IMHO the best
way to learn is doing it by yourself.

Good luck!

Pre-reqs
--------

This vim setup depends on having `lua` support. To check just type :version and you should see `+lua` instead of `-lua` listed.

Instalation
-----------

In your favorite shell type:

    cd ~
    git clone https://leoluz@github.com/leoluz/vimfiles.git .vim
    ln -s ~/.vim/vimrc .vimrc
    cd .vim
    git submodule init
    git submodule update

For the first time you start Vim it will automatically install all the needed plugins.

That's it! You are ready to go! 
Enjoy!

Details
-------

* author: Leonardo Luz
* email: leonardo.la at gmail dot com
* blog: [LeoLuz](http://blog.leoluz.me)
* twitter: @leo_luz
