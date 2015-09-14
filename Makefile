.PHONY: help \
	install-fzf \
	install-homebrew \
	install-nvm \
	install-pipsi \
	install-pythonz

help:
	@echo "Helpers to install additional software"
	@echo
	@echo "+ fzf			: make install-fzf"
	@echo "+ homebrew		: make install-homebrew"
	@echo "+ nvm			: make install-nvm"
	@echo "+ pipsi			: make install-pipsi"
	@echo "+ pythonz		: make install-pythonz"
	@echo

install-fzf:
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install

install-homebrew:
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

install-nvm:
	git clone https://github.com/creationix/nvm.git ~/.nvm \
	&& cd ~/.nvm \
	&& git checkout `git describe --abbrev=0 --tags`

install-pipsi:
	curl https://raw.githubusercontent.com/mitsuhiko/pipsi/master/get-pipsi.py | python

install-pythonz:
	curl -kL https://raw.github.com/saghul/pythonz/master/pythonz-install | bash
