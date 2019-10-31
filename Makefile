
brew-install:
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	cd ~/.local/share/chezmoi/etc
	brew bundle
