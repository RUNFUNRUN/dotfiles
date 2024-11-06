export TERM="xterm-256color"
export EDITOR="nvim"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH="$HOME/.commands:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.bun/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export GPG_TTY=$(tty)
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=""
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
eval "$(starship init zsh)"

eval "$(github-copilot-cli alias -- "$0")"

alias clock="tty-clock -sc -C4"

# bun completions
[ -s "/home/runfunrun/.bun/_bun" ] && source "/home/runfunrun/.bun/_bun"

# my commands install
export COMMANDS_INSTALL="/home/runfunrun/projects/buntin/commands"
