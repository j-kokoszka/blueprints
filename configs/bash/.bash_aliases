# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


# some more ls aliases
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Editing
alias vim='nvim'
alias edbash='vim $HOME/.bashrc'
alias edalias='vim $HOME/.bash_aliases'
alias reload='source $HOME/.bashrc'
alias lg='lazygit'

# Aliases
alias ssh='export TERM="xterm-256color"; ssh'
alias mux='tmux'
alias muxa='tmux attach'
# alias rr='lfcd'
alias rr='. ranger'
alias less='less -r'
alias cat='tail -n +1'
alias fixtty='reset; stty sane; tput rs1; clear; echo -e "\033c"'

alias sctl='systemctl'
alias sctls='systemctl status'
alias sctlr='systemctl restart'
alias sctlus='systemctl --user status'
alias sctlur='systemctl restart'



## Kubernetes
alias k='kubectl'
alias kn='kubectl config set-context --current --namespace '
alias kctx='kubectx'
alias p='python3'
export do='--dry-run=client -o yaml'
export now='--force --grace-period=0'

