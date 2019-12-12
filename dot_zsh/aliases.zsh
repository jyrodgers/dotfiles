###############################################################################
# Alias'
###############################################################################

# Terminal
alias  ..='cd ..'
alias ...='cd ../..'
alias cls="clear && ls"
alias cp='cp -iv'
alias cwd='pwd | tr -d "\n" | pbcopy && pwd'
alias h="cd -"
alias mv='mv -iv'
alias sudo="sudo --preserve-env"
alias n="nnn"

alias cask_folder='/usr/local/Caskroom'
alias brew_folder='/usr/local/Cellar'

# Git
alias gad='git add'
alias gcl='git clone'
alias gco='git commit'
alias gch='git checkout'
# alias gcom='git checkout master'
alias gpul='git pull'
alias gpus='git push'

# Tmux
alias ta='tmux attach -t'
alias tn='tmux new -s'
alias tls='tmux ls'

# instead of this use that

if (( $+commands[bat] )); then
  alias cat=bat
fi


if (( $+commands[fd] )); then
  alias find="fd"
fi

if (( $+commands[atool] )); then
  alias extract='atool -x'
fi

# Brew
if (( $+commands[brew] )); then
  alias bi='brew install'
  alias bu='brew upgrade'
fi

# mach3
alias flmacbuild='make developer=env.developer application=flmac build'
alias flmacdeploy='make developer=env.developer application=flmac deploy'
alias tmacbuild='make developer=env.developer application=tmac build'
alias tmacdeploy='make developer=env.developer application=tmac deploy'

# Vim
#alias v='nvim'
if (( $+commands[nvim] )); then
  alias v=nvim  # replace with rg for ripgrep
  alias vim=nvim  # replace with rg for ripgrep
else
  alias v=vim
fi

# Docker
alias d="docker"
alias db="docker build"
alias dbnc="docker build --no-cache"
alias dr="docker run"

# Helm

alias hdl="helm delete"
alias hf="helm fetch"
alias hi="helm install"
alias hl="helm list"
alias hld="helm list --deployed"

source ~/.zsh/aliases/kubectl_aliases

## pods

## logs

## nodes

#zsh
# alias prev='fzf --preview 'bat --color \'always\' {}''

which exa 2>&1 > /dev/null
if [[ $? -eq 0 ]]; then
    # Override default oh-my-zsh directories aliases with exa ones
    # https://the.exa.website/
    # unalias l
    # unalias ls
    # unalias lsa
    alias l='exa'
    alias ls='exa'
    alias ll='exa -l'
    alias la='exa -la'
fi
alias ez='exec zsh'

alias treed='tree -d' # list only directories
alias trees='tree -v' # sort by version
alias treer='tree -r' # sort by reverse alphabet order
alias treet='tree -t' # sort by last modification date
alias treel='tree -L' # max depth
alias treeo='tree -o' # output to file 

alias wifi="networksetup -setairportpower en0" # usage: `wifi on` or `wifi off`. 

# z.lua
alias zz='z -c'      # restrict matches to subdirs of $PWD
alias zi='z -i'      # cd with interactive selection
alias zf='z -I'      # use fzf to select in multiple matches
alias zb='z -b'      # quickly cd to the parent directoryexport BROWSER=w3m
