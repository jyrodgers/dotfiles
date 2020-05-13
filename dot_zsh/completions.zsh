
#export DOTZSH=$HOME/.zsh
#if [ ! -d $DOTZSH ]; then
#    mkdir -p $DOTZSH
#fi
#
#
#function source-file(){
#    [[ -s "$1" ]] && source "$1"
#}
#
#function zsh-update-comp-defs() {
#    local links urls comps file fname
#
#    comps="$DOTZSH/site-functions"
#    urls=(
#        # https://raw.githubusercontent.com/docker/compose/master/contrib/completion/zsh/_docker-compose
#        # https://raw.githubusercontent.com/jwilm/alacritty/master/alacritty-completions.zsh
#        # https://raw.githubusercontent.com/motemen/ghq/master/zsh/_ghq
#        # https://raw.githubusercontent.com/rhysd/notes-cli/master/completions/zsh/_notes
#        # https://raw.githubusercontent.com/zsh-users/zsh-completions/master/src/_bundle
#        # https://raw.githubusercontent.com/zsh-users/zsh-completions/master/src/_ghc
#        # https://raw.githubusercontent.com/zsh-users/zsh-completions/master/src/_go
#        # https://raw.githubusercontent.com/zsh-users/zsh-completions/master/src/_jq
#        # https://raw.githubusercontent.com/zsh-users/zsh-completions/master/src/_node
#        # https://raw.githubusercontent.com/zsh-users/zsh-completions/master/src/_perf
#        https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker
#        https://raw.githubusercontent.com/nnao45/zsh-kubectl-completion/master/_kubectl
#        https://raw.githubusercontent.com/ttscoff/doing/master/doing.completion.zsh
#        https://raw.githubusercontent.com/zsh-users/zsh-completions/master/src/_caffeinate
#        https://raw.githubusercontent.com/zsh-users/zsh-completions/master/src/_cmake
#    )
#
#    for url in $urls; do
#        fname="${url:t}"
#        if [[ "$fname" == "doing.completion.zsh" ]]; then
#            fname="_doing"
#        fi
#        if [[ "$fname" == "alacritty-completions.zsh" ]]; then
#            fname="_alacritty"
#        fi
#        file="$comps/$fname"
#        echo "Downloading complation definition '${file}'"
#        if curl -f -L "$url" > "$file"; then
#            chmod +x "$file"
#        else
#            echo "Failed to download ${url}"
#            rm -rf $file
#        fi
#        echo
#    done
#}
#
#if [ ! -d "$DOTZSH/site-functions" ]; then
#    mkdir "$DOTZSH/site-functions"
#    zsh-update-comp-defs
#fi
#
#fpath=("$DOTZSH/site-functions" ${fpath})
#
#autoload -Uz compinit; compinit -u
#
###################
##   Completion   #
###################
## {{{
#zstyle ':completion:*' completer _complete _expand _list _match _prefix
#
#zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
#
#zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' '+m:{A-Z}={a-z}'
#
#zstyle ':completion:*' menu select=2
#
#zstyle ':completion:*:sudo:*' command-path $sudo_path $path
#
#zstyle ':completion:*' use-cache true
#
#compdef _git g=git
#compdef _docker d=docker
#
#zstyle ':completion:*:*:cdr:*:*' menu selection
#zstyle ':chpwd:*' recent-dirs-max 5000

