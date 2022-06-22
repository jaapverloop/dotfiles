.PHONY: setup \
	help \
	install-homebrew

help:
	@echo "Helpers to setup dotfiles and install additional software"
	@echo
	@echo "+ setup    : setup dotfiles"
	@echo "+ homebrew : make install-homebrew"
	@echo

setup:
	@# setup zsh
	@rm -f ${HOME}/.zshrc
	@ln -s ${CURDIR}/zshrc ${HOME}/.zshrc

	@# setup vim
	@rm -rf ${HOME}/.vim
	@rm -f ${HOME}/.vimrc
	@ln -s ${CURDIR}/vim ${HOME}/.vim
	@ln -s ${CURDIR}/vimrc ${HOME}/.vimrc

	@# setup git
	@rm -f ${HOME}/.gitconfig
	@rm -f ${HOME}/.gitignore
	@ln -s ${CURDIR}/gitconfig ${HOME}/.gitconfig
	@ln -s ${CURDIR}/gitignore ${HOME}/.gitignore

	@# setup tmux
	@rm -f ${HOME}/.tmux.conf
	@ln -s ${CURDIR}/tmux.conf ${HOME}/.tmux.conf

install-homebrew:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
