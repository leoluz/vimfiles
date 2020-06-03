LeoLuz Vim configuration files
======================================

About
-----

This is a project to maintain my Neovim configuration files.

Fill free to hack around and use these files as you wish but the best way to learn is doing it all by yourself.

Good luck!

Instalation
-----------

### Powerline symbols support

Its necessary to install the preferred powerline fonts. 

For example:

    $ brew cask install homebrew/cask-fonts/font-menlo-for-powerline

You can check [powerline fonts](https://github.com/powerline/fonts) repository for a more complete list of fonts and how to install them.

After installing just select the powerline version of your font in the terminal or nvim gui of choice.

### Try it not installing anything

If you want to give this setup a try but don't want to install anything in your OS, you can use the provided docker image. In order to do so, make sure you have docker installed and run the provided script:

    $ ./docker-run.sh

The first time you run the script it will build the docker image and install all Neovim plugins landing you in a bash terminal with Neovim fully configured. Just type `nvim` and give it a try.

That's it!

Details
-------

* author: Leonardo Luz
* email: leonardo.la at gmail dot com
* twitter: @leo_luz
