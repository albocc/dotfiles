# dotfiles
My personal dotfiles

# How to use them
1. Clone the Repository to a location on your system. I have a directory in my
home directory called `Repositories` where I keep all my repositories, including
this one.
2. If you like to use the `.gitignore` templates from github/gitignore, you can
initialize the submodule by running `git submodule init`.
These templates are handy when you start your own new project and need a
template for your specific content/language to get started.
3. Now you can decide, if you want to maintain a copy of the dotfiles yourself,
in which case you can just copy the dotfiles to your home directory:

        # You can leave away the next line if you are in the repo already:
        cd /put/path/to/your/clone/here
        cp .aliases ~/
        cp .bash_profile ~/
        cp .curlrc ~/
        cp .exports ~/
        cp .gitconfig ~/
        cp .gitignore ~/
        cp -r .vim ~/
        cp .vimrc ~/
        # If you want the .gitignore.d submodule too, run the next line too
        cp -r .gitignore.d ~/

Or alternatively, like me, symlink them to your home directory like so:

        # You can leave away the next line if you are in the repo already:
        cd /put/path/to/your/clone/here
        pathToRepo=`pwd`
        ln -s $pathToRepo/.aliases ~/
        ln -s $pathToRepo/.bash_profile ~/
        ln -s $pathToRepo/.curlrc ~/
        ln -s $pathToRepo/.exports ~/
        ln -s $pathToRepo/.gitconfig ~/
        ln -s $pathToRepo/.gitignore ~/
        ln -s $pathToRepo/.vim ~/
        ln -s $pathToRepo/.vimrc ~/
        # If you want the .gitignore.d submodule too, run the next line too
        ln -s $pathToRepo/.gitignore.d ~/

Of course you are free to leave away any files you don't need.
