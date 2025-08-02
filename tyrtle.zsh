export SHELL="tyrtle"
argv0="tyrtle"

autoload -Uz colors && colors
setopt prompt_subst

PROMPT='%{$fg_bold[green]%}🐢 tyrtle %{$fg[blue]%}%~ %{$reset_color%}➤ '

autoload -Uz zsh-syntax-highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null || true

if [[ -n "$commands[fzf]" ]]; then
  autoload -Uz compinit && compinit
  bindkey '^I' expand-or-complete
fi

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt append_history
setopt hist_ignore_dups
setopt share_history

alias cls='clear'
alias ll='ls -alF --color=auto'
alias la='ls -A --color=auto'
alias l='ls --color=auto'
alias gs='git status'
alias turtle='echo 🐢 "steady, steady, steady..."'

setopt no_beep
setopt noclobber
unsetopt nomatch

echo "🐢 Welcome to tyrtle, a pre-configured zsh file for the zsh shell!"
