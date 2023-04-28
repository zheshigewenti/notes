
#
# ~/.zshrc
#

#history
SAVEHIST=1000  # Save most-recent 1000 lines
HISTFILE=~/.zsh_history
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='%n%# '
export LS_COLORS=$LS_COLORS:"*.tar=4;36":"*.xz=4;31"
alias ls='ls --color=auto'
alias sgrep='grep --color=auto'
alias vim='nvim'
alias n='neofetch'
alias reboot='sudo reboot'
alias r='ranger'

export EDITOR=nvim

#proxy
export http_proxy=http://127.0.0.1:7890/
export https_proxy=$http_proxy
export ftp_proxy=$http_proxy
export rsync_proxy=$http_proxy
export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"

#fzf.vim
export FZF_DEFAULT_OPTS='--bind ctrl-j:down,ctrl-k:up --preview "[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (ccat --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500"'
export FZF_DEFAULT_COMMAND='rg -S --files --hidden'
#fzf
# Use ~~ as the trigger sequence instead of the default **
export FZF_COMPLETION_TRIGGER='\'

# Options to fzf command
export FZF_COMPLETION_OPTS='--border --info=inline'

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion  使用fd生成搜索列表
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1" 
}

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'tree -C {} | head -200'   "$@" ;;
    export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview 'bat -n --color=always {}' "$@" ;;
  esac
}



source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
