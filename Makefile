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
	git ~/Git
	git clone https://github.com/jyrodgers/neosnippet-snippets neosnippets

terminal-vim-install:
	if [ -d "/Applications" ]; then
		cp ~/.local/share/chezmoi/etc/TerminalVim.app /Applications
	fi

update-all:
	chezmoi apply
	vim -c PlugUpdate -c qa

z-install:
	git ~/Git/
	git clone https://github.com/skywind3000/z.lua.git z_lua
