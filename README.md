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

I use the [dracula-theme] for iTerm2.


##License

MIT, see **LICENSE** for more details.


[dracula-theme]: https://draculatheme.com/
