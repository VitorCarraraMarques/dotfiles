export EDITOR="snap run nvim"
export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$HOME/.local/bin/"
ZSH_THEME="robbyrussell"

plugins=(
    git
    zsh-autosuggestions    
    zsh-syntax-highlighting
    zsh-bat
)


source $ZSH/oh-my-zsh.sh

setopt completealiases
alias nvim="snap run nvim"
alias nv="snap run nvim"
alias bat="batcat"
alias gc="git checkout"
alias ga="git add"
alias gcm="git commit"
alias gps="git push"
alias gpl="git pull"

#export TERM='screen-256color-bce'
#export COLORTERM="truecolor"

function clear-screen-and-scrollback() {
  builtin echoti civis >"$TTY"
  builtin print -rn -- $'\e[H\e[2J' >"$TTY"
  builtin zle .reset-prompt
  builtin zle -R
  builtin print -rn -- $'\e[3J' >"$TTY"
  builtin echoti cnorm >"$TTY"
}
zle -N clear-screen-and-scrollback
bindkey '^w' clear-screen-and-scrollback


autoload -Uz zmv
. "/home/vitor/.deno/env"
