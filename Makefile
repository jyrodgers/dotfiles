
brew-install:
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	cd ~/.local/share/chezmoi/etc
	brew bundle

macos-settings-install:
	ifeq ($(UNAME_S),Darwin)
		./macOS-settings.sh
	fi

snippets-install:
	git ~/Git
	git clone https://github.com/jyrodgers/neosnippet-snippets neosnippets

terminal-vim-install:
	if [ -d "/Applications" ]; then
		cp ~/.local/share/chezmoi/etc/TerminalVim.app /Applications
	fi

z-install:
	git ~/Git/
	git clone https://github.com/skywind3000/z.lua.git z_lua
