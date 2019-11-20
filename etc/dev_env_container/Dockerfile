FROM linuxbrew/brew:latest
# RUN HOMEBREW_NO_AUTO_UPDATE=1 brew install zsh
#install chezmoi
RUN HOMEBREW_NO_AUTO_UPDATE=1 brew install twpayne/taps/chezmoi
RUN chezmoi init https://github.com/jyrodgers/dotfiles.git
RUN chezmoi apply
RUN HOMEBREW_NO_AUTO_UPDATE=1 brew bundle --verbose --file=~/.local/share/chezmoi/etc/dev_env_container/Brewfile
RUN brew cleanup \
 && rm -rf /home/linuxbrew/.cpan /home/linuxbrew/.cache/Homebrew

## Install Vim-Plug
RUN curl -fLo ${HOME}/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


#RUN localedef -i en_US -f UTF-8 en_US.UTF-8

## Set Timezone
#RUN cp /usr/share/zoneinfo/America/Tijuana /etc/localtime && \
#    echo "America/Tijuana" > /etc/timezone

## Install oh-my-zsh
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
RUN wget https://gist.githubusercontent.com/xfanwu/18fd7c24360c68bab884/raw/f09340ac2b0ca790b6059695de0873da8ca0c5e5/xxf.zsh-theme -O ${HOME}/.oh-my-zsh/custom/themes/xxf.zsh-theme


## Install TMUX
## COPY tmux.conf ${HOME}/.tmux.conf
## RUN git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm && \
##     ${HOME}/.tmux/plugins/tpm/bin/install_plugins

## Set working directory to /workspace
## WORKDIR /workspace

## RUN git config --global user.name "$GIT_USER_NAME" && git config --global user.email "$GIT_USER_EMAIL"

# Entrypoint script creates a user called `me` and `chown`s everything
COPY entrypoint.sh /bin/entrypoint.sh

# Default entrypoint, can be overridden
CMD ["/bin/entrypoint.sh"]
