parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}


setopt PROMPT_SUBST
PS1="%F{045}|%F{035}Fractal Config%F{045}| "
PS1+="%F{142}\$(parse_git_branch)"$'\n'
PS1+="%F{142}%n%F{255}@%F{035}%m:%F{045}%~%F{255}$ "
export CLICOLOR=1
export LSCOLORS="gxBxhxDxfxhxhxhxhxcxcx"

zstyle ':completion:*' list-colors 'di=36:ln=1;31:so=37:pi=1;33:ex=35:bd=37:cd=37:su=37:sg=37:tw=32:ow=32'
zstyle ':completion:*:*:git:*' script ~/git-completion.zsh
autoload -U compinit && compinit

alias ll="ls -la"
alias dc="docker-compose"
alias tf="terraform"

alias dockerrmleaves="docker rmi \$(docker images -f 'dangling=true' -q)"
alias dockerrmstopped="docker rm \$(docker ps -a -q)"
