FROM prodromou87/llvm

FROM linuxbrew/brew:latest


ENV HOMEBREW_NO_AUTO_UPDATE=1

RUN brew tap aykamko/tag-ag
RUN brew tap homebrew/bundle
RUN brew tap homebrew/core
RUN brew tap homebrew/services
RUN brew tap twlz0ne/ccls
RUN brew install aykamko/tag-ag/tag-ag
RUN brew install twpayne/taps/chezmoi
RUN brew install bat
RUN brew install ccls
RUN brew install cmake
RUN brew install coreutils
# RUN brew install llvm
RUN brew install cquery # I might need this for vim completion
RUN brew install ctags
RUN brew install fzf
# RUN brew install gcc
RUN brew install gdb
RUN brew install git
RUN brew install jq
RUN brew install kubecfg
RUN brew install kubernetes-cli
RUN brew install kubernetes-helm
RUN brew install lua@5.1
RUN brew install luajit
RUN brew install luarocks
RUN brew install neovim
RUN brew install nnn
RUN brew install python
RUN brew install the_silver_searcher
RUN brew install tmux
RUN brew install tree
RUN brew install wget
RUN brew install zsh
RUN brew install zsh-completions

RUN brew cleanup \
 && rm -rf /home/linuxbrew/.cpan /home/linuxbrew/.cache/Homebrew


#RUN localedef -i en_US -f UTF-8 en_US.UTF-8

## Set Timezone
#RUN cp /usr/share/zoneinfo/America/Tijuana /etc/localtime && \
#    echo "America/Tijuana" > /etc/timezone

## Install oh-my-zsh
# ENV USER jyrodgers
# ENV HOME /home/${USER}
ENV SHELL /bin/zsh
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
RUN wget https://gist.githubusercontent.com/xfanwu/18fd7c24360c68bab884/raw/f09340ac2b0ca790b6059695de0873da8ca0c5e5/xxf.zsh-theme -O ${HOME}/.oh-my-zsh/custom/themes/xxf.zsh-theme

# install su-exec
RUN curl -o /usr/local/bin/su-exec.c https://raw.githubusercontent.com/ncopa/su-exec/master/su-exec.c
RUN gcc -Wall /usr/local/bin/su-exec.c -o/usr/local/bin/su-exec
RUN chown root:root /usr/local/bin/su-exec
RUN chmod 0755 /usr/local/bin/su-exec
RUN rm /usr/local/bin/su-exec.c

#install chezmoi
RUN chezmoi init https://github.com/jyrodgers/dotfiles.git
RUN chezmoi apply
## RUN git config --global user.name "$GIT_USER_NAME" && git config --global user.email "$GIT_USER_EMAIL"

## Install Vim-Plug
RUN curl -fLo ${HOME}/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# RUN nvim +PlugInstall +qall >> /dev/null

COPY entrypoint.sh /bin/entrypoint.sh
RUN chmod +x /bin/entrypoint.sh

# Set working directory to /workspace
WORKDIR /workspace

# Default entrypoint, can be overridden
# CMD ["/bin/entrypoint.sh"]
CMD ["zsh"]
