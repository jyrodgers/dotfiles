brew-install:
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	cd ~/.local/share/chezmoi/etc
	brew bundle

install: brew-install macos-settings-install plug.vim-install snippets-install terminal-vim-install z-install

macos-settings-install:
	ifeq ($(UNAME_S),Darwin)
		./macOS-settings.sh
	fi

plug.vim-install:
	curl -s -L https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim > $$(chezmoi source-path ~/.local/share/nvim/site/autoload/plug.vim)


snippets-install:
	cd ~/Git && git clone https://github.com/jyrodgers/neosnippet-snippets neosnippets

terminal-vim-install:
	if [ -d "/Applications" ]; then
		cp ~/.local/share/chezmoi/etc/TerminalVim.app /Applications
	fi

update-all:
	chezmoi apply
	vim -c PlugUpdate -c qa

z-install:
	cd ~/Git/ && git clone https://github.com/skywind3000/z.lua.git z_lua

zsh:
	sh -c $(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)

python:
	python3 -m pip install --user --upgrade pynvim :UpdateRemotePlugins
	# Run :UpdateRemotePlugins in vim

fzf:
	$(brew --prefix)/opt/fzf/install
