# tyrtle Zsh configuration - beginner-friendly!
# 🐢 Edit this file to customize your shell experience.

export SHELL="tyrtle"
argv0="tyrtle"

autoload -Uz colors && colors
setopt prompt_subst

# Function to show current git branch in prompt
git_prompt() {
  local branch
  branch=$(git symbolic-ref --short HEAD 2>/dev/null)
  [[ -n $branch ]] && echo "%{$fg_bold[magenta]%}[$branch]%{$reset_color%} "
}
PROMPT='%{$fg_bold[green]%}🐢 tyrtle %{$fg[blue]%}%~ $(git_prompt)%{$reset_color%}➤ '

# Syntax highlighting (portable)
ZSH_SYNTAX_HIGHLIGHTING_PATH="${ZSH_SYNTAX_HIGHLIGHTING_PATH:-/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh}"
if [[ -f "$ZSH_SYNTAX_HIGHLIGHTING_PATH" ]]; then
  source "$ZSH_SYNTAX_HIGHLIGHTING_PATH"
else
  echo "🔔 zsh-syntax-highlighting not found!" >&2
fi

# History settings
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt append_history
setopt hist_ignore_dups
setopt share_history
setopt hist_ignore_space
setopt extended_history

# Quality-of-life aliases
alias clr='clear'
alias ll='ls -alF --color=auto'
alias la='ls -A --color=auto'
alias l='ls --color=auto'
alias gs='git status'
alias ..='cd ..'
alias ...='cd ../..'

# Shell options for beginners
setopt no_beep
setopt noclobber
unsetopt nomatch
setopt auto_cd

# Welcome message (interactive shells only)
[[ $- == *i* ]] && echo "🐢 Welcome to tyrtle, a beginner-friendly Zsh shell."
