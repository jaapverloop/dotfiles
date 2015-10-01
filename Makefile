.PHONY: help \
	install-homebrew \
	install-nvm \
	install-pipsi \
	install-pythonz \
	install-sexybashprompt \
	install-z

help:
	@echo "Helpers to install additional software"
	@echo
	@echo "+ homebrew		: make install-homebrew"
	@echo "+ nvm			: make install-nvm"
	@echo "+ pipsi			: make install-pipsi"
	@echo "+ pythonz		: make install-pythonz"
	@echo "+ sexybashprompt	: make install-sexybashprompt"
	@echo "+ z				: make install-z"
	@echo

install-homebrew:
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

install-nvm:
	git clone https://github.com/creationix/nvm.git ~/.bin/nvm \
	&& cd ~/.bin/nvm \
	&& git checkout `git describe --abbrev=0 --tags`

install-pipsi:
	curl https://raw.githubusercontent.com/mitsuhiko/pipsi/master/get-pipsi.py | python

install-pythonz:
	curl -kL https://raw.github.com/saghul/pythonz/master/pythonz-install | bash

install-sexybashprompt:
	git clone https://github.com/twolfson/sexy-bash-prompt.git ~/.bin/sexy-bash-prompt

install-z:
	git clone https://github.com/rupa/z.git ~/.bin/z
