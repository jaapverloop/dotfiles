#Dotfiles

My personal dotfiles.


##Installation

Open a terminal and execute the following commands:

```sh
cd ~/code
git clone --recursive https://github.com/jaapverloop/dotfiles.git
cd dotfiles
./setup.sh
```


##Updating

Open a terminal and execute the following commands:

```sh
cd ~/code/dotfiles
git submodule update --init --recursive
./setup.sh
```


#Note

I use the color palette **gruvbox-dark**, taken from the [gruvbox-contrib]
repository, for iTerm2.


##License

MIT, see **LICENSE** for more details.


[gruvbox-contrib]: https://github.com/morhetz/gruvbox-contrib
