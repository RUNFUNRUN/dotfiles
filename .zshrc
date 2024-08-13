export TERM="xterm-256color"
export EDITOR="nvim"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH="$HOME/.commands:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.bun/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export MODULAR_HOME="/home/runfunrun/.modular"
export PATH="/home/runfunrun/.modular/pkg/packages.modular.com_mojo/bin:$PATH"
export GPG_TTY=$(tty)

eval "$(github-copilot-cli alias -- "$0")"

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias clock="tty-clock -sc -C4"

# bun completions
[ -s "/home/runfunrun/.bun/_bun" ] && source "/home/runfunrun/.bun/_bun"

[ -f ~/.inshellisense/key-bindings.zsh ] && source ~/.inshellisense/key-bindings.zsh

export PATH="/home/runfunrun/Documents/buntin/commands/bin:$PATH"
